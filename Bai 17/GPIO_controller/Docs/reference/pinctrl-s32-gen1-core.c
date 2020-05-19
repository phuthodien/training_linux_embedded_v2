/*
 * Core driver for the S32 pin controller
 *
 * Copyright 2015-2016 Freescale Semiconductor, Inc.
 * Copyright 2017-2018 NXP
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 */

#include <linux/err.h>
#include <linux/init.h>
#include <linux/io.h>
#include <linux/module.h>
#include <linux/of.h>
#include <linux/of_device.h>
#include <linux/pinctrl/machine.h>
#include <linux/pinctrl/pinconf.h>
#include <linux/pinctrl/pinctrl.h>
#include <linux/pinctrl/pinmux.h>
#include <linux/slab.h>

#include "../core.h"
#include "pinctrl-s32.h"

#include <dt-bindings/pinctrl/s32-gen1-pinctrl.h>

/**
 * Holds pin configuration for GPIO's.
 * @pin: Pin settings
 */
struct gpio_pin_config {
	struct s32_pin pin;
	struct list_head list;
};

/**
 * @dev: a pointer back to containing device
 * @base: the offset to the controller in virtual memory
 * @gpio_configs: Saved configurations for GPIO pins
 */
struct s32_pinctrl {
	struct device *dev;
	struct pinctrl_dev *pctl;
	void __iomem *mscr_base;
	void __iomem *imcr_base;
	const struct s32_pinctrl_soc_info *info;
	struct list_head gpio_configs;
};

static const char *pin_get_name_from_info(struct s32_pinctrl_soc_info *info,
			const unsigned int pin_id)
{
	int i;

	for (i = 0; i < info->npins; i++) {
		if (info->pins[i].number == pin_id)
			return info->pins[i].name;
	}

	return NULL;
}

static inline unsigned long s32_pinctrl_readl(struct pinctrl_dev *pctldev,
					      unsigned int pin_id)
{
	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
	const struct s32_pinctrl_soc_info *info = ipctl->info;
	unsigned long config;

	if (pin_id >= info->mscr_base_pin && pin_id <= info->mscr_end_pin)
		config = readl(ipctl->mscr_base + S32_PAD_CONFIG
						(pin_id - info->mscr_base_pin));
	else
		config = readl(ipctl->imcr_base + S32_PAD_CONFIG
						(pin_id - info->imcr_base_pin));

	return config;
}

static inline void s32_pinctrl_writel(unsigned long config,
				      struct pinctrl_dev *pctldev,
				      unsigned int pin_id)
{
	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
	const struct s32_pinctrl_soc_info *info = ipctl->info;

	if (pin_id >= info->mscr_base_pin && pin_id <= info->mscr_end_pin)
		writel(config, ipctl->mscr_base + S32_PAD_CONFIG
				(pin_id - info->mscr_base_pin));
	else
		writel(config, ipctl->imcr_base + S32_PAD_CONFIG
				(pin_id - info->imcr_base_pin));
}

static inline const struct s32_pin *s32_pinctrl_find_pin(
			const struct s32_pin_group *grp,
			unsigned pin_id)
{
	unsigned i;

	if (!grp)
		return NULL;

	for (i = 0; i < grp->npins; i++) {
		struct s32_pin *pin = &grp->pins[i];

		if (pin->pin_id == pin_id)
			return pin;
	}

	return NULL;
}
static inline const struct s32_pin_group *s32_pinctrl_find_group_by_name(
				const struct s32_pinctrl_soc_info *info,
				const char *name)
{
	const struct s32_pin_group *grp = NULL;
	unsigned int i;

	for (i = 0; i < info->ngroups; i++) {
		if (!info->groups[i].name)
			continue;
		if (!strcmp(info->groups[i].name, name)) {
			grp = &info->groups[i];
			break;
		}
	}

	return grp;
}

static int s32_get_groups_count(struct pinctrl_dev *pctldev)
{
	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
	const struct s32_pinctrl_soc_info *info = ipctl->info;

	return info->ngroups;
}

static const char *s32_get_group_name(struct pinctrl_dev *pctldev,
				       unsigned int selector)
{
	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
	const struct s32_pinctrl_soc_info *info = ipctl->info;

	return info->groups[selector].name;
}

static int s32_get_group_pins(struct pinctrl_dev *pctldev,
			       unsigned int selector, const unsigned int **pins,
			       unsigned int *npins)
{
	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
	const struct s32_pinctrl_soc_info *info = ipctl->info;

	if (selector >= info->ngroups)
		return -EINVAL;

	*pins = info->groups[selector].pin_ids;
	*npins = info->groups[selector].npins;

	return 0;
}

static void s32_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
		   unsigned int offset)
{
	seq_printf(s, "%s", dev_name(pctldev->dev));
}

static int s32_dt_node_to_map(struct pinctrl_dev *pctldev,
			struct device_node *np,
			struct pinctrl_map **map, unsigned int *num_maps)
{
	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
	const struct s32_pinctrl_soc_info *info = ipctl->info;
	const struct s32_pin_group *grp;
	struct pinctrl_map *new_map;
	struct device_node *parent;
	int map_num = 1;
	int i;

	/*
	 * first find the group of this node and check if we need create
	 * config maps for pins
	 */
	grp = s32_pinctrl_find_group_by_name(info, np->name);
	if (!grp) {
		dev_err(info->dev, "unable to find group for node %s\n",
			np->name);
		return -EINVAL;
	}

	map_num += grp->npins;

	new_map = kmalloc_array(map_num, sizeof(struct pinctrl_map), GFP_KERNEL);
	if (!new_map)
		return -ENOMEM;

	*map = new_map;
	*num_maps = map_num;

	/* create mux map */
	parent = of_get_parent(np);
	if (!parent) {
		kfree(new_map);
		return -EINVAL;
	}
	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
	new_map[0].data.mux.function = parent->name;
	new_map[0].data.mux.group = np->name;
	of_node_put(parent);

	/* create config map */
	new_map++;
	for (i = 0; i < grp->npins; i++) {
		new_map[i].type = PIN_MAP_TYPE_CONFIGS_PIN;
		new_map[i].data.configs.group_or_pin =
			pin_get_name(pctldev, grp->pins[i].pin_id);
		new_map[i].data.configs.configs = &grp->pins[i].config;
		new_map[i].data.configs.num_configs = 1;
	}

	dev_dbg(pctldev->dev, "maps: function %s group %s num %d\n",
		(*map)->data.mux.function, (*map)->data.mux.group, map_num);

	return 0;
}

static void s32_dt_free_map(struct pinctrl_dev *pctldev,
				struct pinctrl_map *map, unsigned int num_maps)
{
	kfree(map);
}

static const struct pinctrl_ops s32_pctrl_ops = {
	.get_groups_count = s32_get_groups_count,
	.get_group_name = s32_get_group_name,
	.get_group_pins = s32_get_group_pins,
	.pin_dbg_show = s32_pin_dbg_show,
	.dt_node_to_map = s32_dt_node_to_map,
	.dt_free_map = s32_dt_free_map,

};

static int s32_pmx_set(struct pinctrl_dev *pctldev, unsigned int selector,
		       unsigned int group)
{
	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
	const struct s32_pinctrl_soc_info *info = ipctl->info;
	unsigned int npins;
	int i;
	struct s32_pin_group *grp;

	/*
	 * Configure the mux mode for each pin in the group for a specific
	 * function.
	 */
	grp = &info->groups[group];
	npins = grp->npins;

	dev_dbg(ipctl->dev, "enable function %s group %s\n",
		info->functions[selector].name, grp->name);

	for (i = 0; i < npins; i++) {
		struct s32_pin *pin = &grp->pins[i];
		s32_pinctrl_writel(pin->config, pctldev, pin->pin_id);
	}

	return 0;
}

static int s32_pmx_get_funcs_count(struct pinctrl_dev *pctldev)
{
	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
	const struct s32_pinctrl_soc_info *info = ipctl->info;

	return info->nfunctions;
}

static const char *s32_pmx_get_func_name(struct pinctrl_dev *pctldev,
					  unsigned int selector)
{
	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
	const struct s32_pinctrl_soc_info *info = ipctl->info;

	return info->functions[selector].name;
}

static int s32_pmx_get_groups(struct pinctrl_dev *pctldev,
			       unsigned int selector,
			       const char * const **groups,
			       unsigned int * const num_groups)
{
	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
	const struct s32_pinctrl_soc_info *info = ipctl->info;

	*groups = info->functions[selector].groups;
	*num_groups = info->functions[selector].num_groups;

	return 0;
}

#define GPIO_GROUP_NAME0 "gpiogrp0"
#define GPIO_GROUP_NAME1 "gpiogrp1"


static int s32_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
			struct pinctrl_gpio_range *range, unsigned offset)
{
	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
	unsigned long config;
	const struct s32_pin_group *grp;
	const struct s32_pin *pin;
	struct gpio_pin_config *gpio_pin;

	const struct s32_pinctrl_soc_info *info = ipctl->info;

	/* Find the pinctrl config for the requested pin */
	grp = s32_pinctrl_find_group_by_name(info, GPIO_GROUP_NAME0);
	if (!grp) {
		grp = s32_pinctrl_find_group_by_name(info, GPIO_GROUP_NAME1);
		if (!grp) {
			dev_err(info->dev, "unable to find group for gpiogrp node\n");
			return -EINVAL;
		}
	}

	pin = s32_pinctrl_find_pin(grp, offset);
	if (!pin) {
		dev_err(info->dev, "The pin %d is not member of a gpio group\n",
					offset);
		return -EINVAL;
	}

	config = s32_pinctrl_readl(pctldev, pin->pin_id);

	/* Save current configuration */
	gpio_pin = kmalloc(sizeof(*gpio_pin), GFP_KERNEL);
	if (!gpio_pin)
		return -ENOMEM;

	gpio_pin->pin = *pin;
	gpio_pin->pin.config = config;
	list_add(&(gpio_pin->list), &(ipctl->gpio_configs));

	config &= ~PAD_CTL_MUX_MODE_MASK;
	config |= PAD_CTL_SRC_SIG_SEL0;

	s32_pinctrl_writel(config, pctldev, pin->pin_id);

	return 0;
}

static void s32_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
		struct pinctrl_gpio_range *range,
		unsigned offset)
{
	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
	struct list_head *pos, *tmp;
	struct gpio_pin_config *gpio_pin;
	struct s32_pin pin;

	list_for_each_safe(pos, tmp, &ipctl->gpio_configs) {
		gpio_pin = list_entry(pos, struct gpio_pin_config, list);
		pin = gpio_pin->pin;

		if (pin.pin_id == offset) {
			s32_pinctrl_writel(pin.config, pctldev, pin.pin_id);
			list_del(pos);
			kfree(gpio_pin);
			break;
		}
	}
}

static int s32_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
	   struct pinctrl_gpio_range *range, unsigned offset, bool input)
{
	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
	const struct s32_pinctrl_soc_info *info = ipctl->info;
	unsigned long config;
	const struct s32_pin_group *grp;
	const struct s32_pin *pin;

	/* Find the pinctrl config for the requested pin */
	grp = s32_pinctrl_find_group_by_name(info, GPIO_GROUP_NAME0);
	if (!grp) {
		grp = s32_pinctrl_find_group_by_name(info, GPIO_GROUP_NAME1);
		if (!grp) {
			dev_err(info->dev, "unable to find group for gpiogrp node\n");
			return -EINVAL;
		}
	}

	pin = s32_pinctrl_find_pin(grp, offset);

	if (!pin)
		return -EINVAL;

	config = s32_pinctrl_readl(pctldev, pin->pin_id);

	if (input) {
		/* Disable output buffer and enable input buffer */
		config &= ~(PAD_CTL_OBE | PAD_CTL_PUE | PAD_CTL_PUS);
		config |= (PAD_CTL_IBE | PAD_CTL_PUE);
	} else {
		/* Disable input buffer and enable output buffer */
		config &= ~(PAD_CTL_IBE | PAD_CTL_PUE | PAD_CTL_PUS);
		config |= (PAD_CTL_OBE | PAD_CTL_PUE | PAD_CTL_PUS);
	}

	s32_pinctrl_writel(config, pctldev, pin->pin_id);

	return 0;
}

static const struct pinmux_ops s32_pmx_ops = {
	.get_functions_count = s32_pmx_get_funcs_count,
	.get_function_name = s32_pmx_get_func_name,
	.get_function_groups = s32_pmx_get_groups,
	.set_mux = s32_pmx_set,
	.gpio_request_enable = s32_pmx_gpio_request_enable,
	.gpio_disable_free = s32_pmx_gpio_disable_free,
	.gpio_set_direction = s32_pmx_gpio_set_direction,
};

static int s32_pinconf_get(struct pinctrl_dev *pctldev,
			     unsigned int pin_id, unsigned long *config)
{
	*config = s32_pinctrl_readl(pctldev, pin_id);

	return 0;
}

static int s32_pinconf_set(struct pinctrl_dev *pctldev,
			     unsigned int pin_id, unsigned long *configs,
			     unsigned int num_configs)
{
	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
	int i;

	dev_dbg(ipctl->dev, "pinconf set pin %s with %d configs\n",
			pin_get_name(pctldev, pin_id), num_configs);

	for (i = 0; i < num_configs; i++) {
		s32_pinctrl_writel(configs[i], pctldev, pin_id);
		dev_dbg(ipctl->dev, "write: offset 0x%x val 0x%lx\n",
			S32_PAD_CONFIG(pin_id), configs[i]);
	} /* for each config */

	return 0;
}

static void s32_pinconf_dbg_show(struct pinctrl_dev *pctldev,
				   struct seq_file *s, unsigned int pin_id)
{
	unsigned long config;

	config = s32_pinctrl_readl(pctldev, pin_id);
	seq_printf(s, "0x%lx", config);
}

static void s32_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
					 struct seq_file *s, unsigned int group)
{
	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
	const struct s32_pinctrl_soc_info *info = ipctl->info;
	struct s32_pin_group *grp;
	unsigned long config;
	const char *name;
	int i, ret;

	if (group > info->ngroups) {
		seq_printf(s, "Warning: %d group > num pinctrl groups, %d\n",
			   group, info->ngroups);
		return;
	}

	seq_puts(s, "\n");
	grp = &info->groups[group];
	for (i = 0; i < grp->npins; i++) {
		struct s32_pin *pin = &grp->pins[i];

		name = pin_get_name(pctldev, pin->pin_id);
		ret = s32_pinconf_get(pctldev, pin->pin_id, &config);
		if (ret)
			return;
		seq_printf(s, "%s: 0x%lx\n", name, config);
	}
}

static const struct pinconf_ops s32_pinconf_ops = {
	.pin_config_get = s32_pinconf_get,
	.pin_config_set = s32_pinconf_set,
	.pin_config_dbg_show = s32_pinconf_dbg_show,
	.pin_config_group_dbg_show = s32_pinconf_group_dbg_show,
};

static struct pinctrl_desc s32_pinctrl_desc = {
	.pctlops = &s32_pctrl_ops,
	.pmxops = &s32_pmx_ops,
	.confops = &s32_pinconf_ops,
	.owner = THIS_MODULE,
};

static int s32_pinctrl_parse_groups(struct device_node *np,
				    struct s32_pin_group *grp,
				    struct s32_pinctrl_soc_info *info,
				    u32 index)
{
	int size, i;
	const __be32 *list;

	dev_dbg(info->dev, "group(%d): %s\n", index, np->name);

	/* Initialise group */
	grp->name = np->name;

	/*
	 * the binding format is fsl,pins = <PIN CONFIG>,
	 * do sanity check and calculate pins number
	 */
	list = of_get_property(np, "fsl,pins", &size);
	if (!list) {
		dev_err(info->dev, "no fsl,pins property in node %s\n",
				np->full_name);
		return -EINVAL;
	}

	/* we do not check return since it's safe node passed down */
	if (!size || size % S32_PIN_SIZE) {
		dev_err(info->dev, "Invalid fsl,pins property in node %s\n",
				np->full_name);
		return -EINVAL;
	}

	grp->npins = size / S32_PIN_SIZE;
	grp->pins = devm_kzalloc(info->dev,
				 grp->npins * sizeof(struct s32_pin),
				 GFP_KERNEL);
	grp->pin_ids = devm_kzalloc(info->dev,
				    grp->npins * sizeof(unsigned int),
				    GFP_KERNEL);
	if (!grp->pins || !grp->pin_ids)
		return -ENOMEM;

	for (i = 0; i < grp->npins; i++) {
		struct s32_pin *pin = &grp->pins[i];

		pin->pin_id = be32_to_cpu(*list++);
		pin->config = be32_to_cpu(*list++);
		grp->pin_ids[i] = grp->pins[i].pin_id;

		dev_dbg(info->dev, "%s: 0x%08lx",
			pin_get_name_from_info(info, pin->pin_id), pin->config);
	}

	return 0;
}

static int s32_pinctrl_parse_functions(struct device_node *np,
				       struct s32_pinctrl_soc_info *info,
				       u32 index)
{
	struct device_node *child;
	struct s32_pmx_func *func;
	struct s32_pin_group *grp;
	u32 i = 0;

	dev_dbg(info->dev, "parse function(%d): %s\n", index, np->name);

	func = &info->functions[index];

	/* Initialise function */
	func->name = np->name;
	func->num_groups = of_get_child_count(np);
	if (func->num_groups == 0) {
		dev_err(info->dev, "no groups defined in %s\n", np->full_name);
		return -EINVAL;
	}
	func->groups = devm_kzalloc(info->dev,
			func->num_groups * sizeof(char *), GFP_KERNEL);

	for_each_child_of_node(np, child) {
		func->groups[i] = child->name;
		grp = &info->groups[info->grp_index++];
		s32_pinctrl_parse_groups(child, grp, info, i++);
	}

	return 0;
}

static int s32_pinctrl_probe_dt(struct platform_device *pdev,
				struct s32_pinctrl_soc_info *info)
{
	struct device_node *np = pdev->dev.of_node;
	struct of_phandle_args pinspec;
	struct device_node *child;
	u32 nfuncs = 0;
	u32 i = 0;
	int ret;

	if (!np)
		return -ENODEV;

	ret = of_parse_phandle_with_fixed_args(np, "pins", 2,
						   0, &pinspec);
	if (ret) {
		dev_err(&pdev->dev, "pins0 error\n");
		return -EINVAL;
	}

	info->mscr_base_pin = pinspec.args[0];
	info->mscr_end_pin = pinspec.args[1];

	ret = of_parse_phandle_with_fixed_args(np, "pins", 2,
						   1, &pinspec);
	if (ret) {
		dev_err(&pdev->dev, "pins1 error\n");
		return -EINVAL;
	}

	info->imcr_base_pin = pinspec.args[0];
	info->imcr_end_pin = pinspec.args[1];

	nfuncs = of_get_child_count(np);
	if (nfuncs <= 0) {
		dev_err(&pdev->dev, "no functions defined\n");
		return -EINVAL;
	}

	info->nfunctions = nfuncs;
	info->functions = devm_kzalloc(&pdev->dev,
				       nfuncs * sizeof(struct s32_pmx_func),
				       GFP_KERNEL);
	if (!info->functions)
		return -ENOMEM;

	info->ngroups = 0;
	for_each_child_of_node(np, child)
		info->ngroups += of_get_child_count(child);
	info->groups = devm_kzalloc(&pdev->dev,
				    info->ngroups * sizeof(struct s32_pin_group),
				    GFP_KERNEL);
	if (!info->groups)
		return -ENOMEM;

	for_each_child_of_node(np, child)
		s32_pinctrl_parse_functions(child, info, i++);

	return 0;
}

int s32_pinctrl_probe(struct platform_device *pdev,
		      struct s32_pinctrl_soc_info *info)
{
	struct s32_pinctrl *ipctl;
	struct resource *res, *res1;
	int ret;

	if (!info || !info->pins || !info->npins) {
		dev_err(&pdev->dev, "wrong pinctrl info\n");
		return -EINVAL;
	}
	info->dev = &pdev->dev;

	/* Create state holders etc for this driver */
	ipctl = devm_kzalloc(&pdev->dev, sizeof(*ipctl), GFP_KERNEL);
	if (!ipctl)
		return -ENOMEM;

	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	res1 = platform_get_resource(pdev, IORESOURCE_MEM, 1);
	ipctl->mscr_base = devm_ioremap_resource(&pdev->dev, res);
	ipctl->imcr_base = devm_ioremap_resource(&pdev->dev, res1);

	if (IS_ERR(ipctl->mscr_base))
		return PTR_ERR(ipctl->mscr_base);
	if (IS_ERR(ipctl->imcr_base))
		return PTR_ERR(ipctl->imcr_base);

	s32_pinctrl_desc.name = dev_name(&pdev->dev);
	s32_pinctrl_desc.pins = info->pins;
	s32_pinctrl_desc.npins = info->npins;

	ret = s32_pinctrl_probe_dt(pdev, info);
	if (ret) {
		dev_err(&pdev->dev, "fail to probe dt properties\n");
		return ret;
	}

	ipctl->info = info;
	ipctl->dev = info->dev;
	platform_set_drvdata(pdev, ipctl);
	ipctl->pctl = pinctrl_register(&s32_pinctrl_desc, &pdev->dev, ipctl);
	if (!ipctl->pctl) {
		dev_err(&pdev->dev, "could not register s32 pinctrl driver\n");
		return -EINVAL;
	}

	INIT_LIST_HEAD(&ipctl->gpio_configs);

	dev_info(&pdev->dev, "initialized s32 pinctrl driver\n");

	return 0;
}

int s32_pinctrl_remove(struct platform_device *pdev)
{
	struct list_head *pos, *tmp;
	struct gpio_pin_config *gpio_pin;
	struct s32_pinctrl *ipctl = platform_get_drvdata(pdev);

	pinctrl_unregister(ipctl->pctl);

	list_for_each_safe(pos, tmp, &ipctl->gpio_configs) {
		gpio_pin = list_entry(pos, struct gpio_pin_config, list);
		list_del(pos);
		kfree(gpio_pin);
	}

	return 0;
}
