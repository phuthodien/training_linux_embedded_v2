#include <linux/init.h>
#include <linux/module.h>
#include <linux/interrupt.h>
#include <linux/io.h>
#include <linux/device.h>
#include <linux/gpio/driver.h>
#include <linux/gpio.h>
#include <linux/of.h>
#include <linux/of_device.h>
#include <linux/platform_device.h>
#include <linux/pm_runtime.h>
#include <linux/pm.h>
#include <linux/bitops.h>

#define GPIO_REVISION			0x00
#define GPIO_SYSCONFIG			0x10
#define GPIO_EOI				0x20
#define GPIO_IRQSTATUS_RAW_0	0x24
#define GPIO_IRQSTATUS_RAW_1	0x28
#define GPIO_IRQSTATUS_0		0x2C
#define GPIO_IRQSTATUS_1		0x30
#define GPIO_IRQSTATUS_SET_0	0x34
#define GPIO_IRQSTATUS_SET_1	0x38
#define GPIO_IRQSTATUS_CLR_0	0x3C
#define GPIO_IRQSTATUS_CLR_1	0x40
#define GPIO_IRQWAKEN_0			0x44
#define GPIO_IRQWAKEN_1			0x48
#define GPIO_SYSSTATUS			0x114
#define GPIO_CTRL				0x130
#define GPIO_OE					0x134
#define GPIO_DATAIN				0x138
#define GPIO_DATAOUT			0x13C
#define GPIO_LEVELDETECT0		0x140
#define GPIO_LEVELDETECT1		0x144
#define GPIO_RISINGDETECT		0x148
#define GPIO_FALLINGDETECT		0x14C
#define GPIO_DEBOUNCENABLE		0x150
#define GPIO_DEBOUNCINGTIME		0x154
#define GPIO_CLEARDATAOUT		0x190
#define GPIO_SETDATAOUT			0x194

#define LEVELDETECT0			0x1
#define LEVELDETECT1			0x2
#define RISINGDETECT			0x3
#define FALLINGDETECT			0x4

#define OUT						0
#define IN						1
#define BANK_WIDTH				32

struct omap_gpio_reg_offs {
	u32 revision;
	u32 sysconfig;
	u32 eoi;
	u32 irqstatus_raw0;
	u32 irqstatus_raw1;
	u32 irq_status0;
	u32 irq_status1;
	u32 irq_status_set0;
	u32 irq_status_set1;
	u32 irq_status_clr0;
	u32 irq_status_clr1;
	u32 irq_waken0;
	u32 irq_waken1;
	u32 sysstatus;
	u32 ctrl;
	u32 oe;
	u32 datatin;
	u32 dataout;
	u32 leveldetect0;
	u32 leveldetect1;
	u32 rising;
	u32 falling;
	u32 debounce_enable;
	u32 debonce_time;
	u32 clear_dataout;
	u32 set_dataout;
};

struct my_gpio_bank {
	struct list_head list_node;
	void __iomem *base;
	int irq;
	struct omap_gpio_reg_offs *regs;
	struct gpio_chip chip;
	u32 mod_usage;
	u32 irq_usage;
	u32 pins;
};

static struct my_gpio_bank *to_my_gpio_bank(struct gpio_chip *chip)
{
	struct my_gpio_bank *ret = gpiochip_get_data(chip);

	if (ret == NULL)
		pr_err("Can not get bank by chip\n");

	return ret;
}

/*
 * There are functions that implement read/write to hardware registers
 */
void __enable_modules(struct my_gpio_bank *bank, int is_enable)
{
	void __iomem *base = bank->base;

	if (is_enable)
		iowrite32(0, base + bank->regs->ctrl); /* enable clock gate */
	else
		iowrite32(1, base + bank->regs->ctrl); /* disable clock gate */
}

int __get_direction(struct my_gpio_bank *bank, int pin)
{
	int temp_reg = 0;
	void __iomem *base = bank->base;

	if (bank->regs->oe)
		temp_reg = ioread32(base + bank->regs->oe);
	else
		pr_err("Register not exsit\n");

	temp_reg &= (1 << pin);

	if (temp_reg)
		return IN;
	else
		return OUT;
}

void __set_direction(struct my_gpio_bank *bank, int pin, char is_input)
{
	void __iomem *base = bank->base;
	int temp_reg = ioread32(base + bank->regs->oe);

	if (is_input)
		temp_reg |= (1 << pin);
	else
		temp_reg &= ~(1 << pin);

	iowrite32(temp_reg, base + bank->regs->oe);
}

unsigned int __get_datain(struct my_gpio_bank *bank, int pin)
{
	void __iomem *base = bank->base;
	int temp_reg = ioread32(base + bank->regs->datatin);

	return (temp_reg & (1 << pin));
}

unsigned int __get_dataout(struct my_gpio_bank *bank, int pin)
{
	void __iomem *base = bank->base;
	int temp_reg = ioread32(base + bank->regs->dataout);

	return (temp_reg & (1 << pin));
}

void __set_dataout(struct my_gpio_bank *bank, int pin, char data)
{
	void __iomem *base = bank->base;
	int temp_reg = ioread32(base + bank->regs->dataout);

	if (data)
		temp_reg |= 1 << pin;
	else
		temp_reg &= ~(1 << pin);

	iowrite32(temp_reg, base + bank->regs->dataout);
}

void __my_enable_irq(struct my_gpio_bank *bank, int pin)
{
	void __iomem *base = bank->base;
	int temp_reg = ioread32(base + bank->regs->irq_status_set0);

	temp_reg |= (1 << pin);
	iowrite32(temp_reg, base + bank->regs->irq_status_set0);
}

void __my_disable_irq(struct my_gpio_bank *bank, int pin)
{
	void __iomem *base = bank->base;
	int temp_reg = ioread32(base + bank->regs->irq_status_clr0);

	temp_reg |= (1 << pin);
	iowrite32(temp_reg, base + bank->regs->irq_status_clr0);
}

void __clear_irq(struct my_gpio_bank *bank, int pin)
{
	void __iomem *base = bank->base;
	int temp_reg = ioread32(base + bank->regs->irq_status0);

	temp_reg |= (1 << pin);
	iowrite32(temp_reg, base + bank->regs->irq_status0);
}

void __set_irq_mode(struct my_gpio_bank *bank, int pin, char detection)
{
	void __iomem *base = bank->base;
	int temp_reg = 0;

	switch (detection) {
	case LEVELDETECT0:
		base += bank->regs->leveldetect0;
		break;
	case LEVELDETECT1:
		base += bank->regs->leveldetect1;
		break;
	case RISINGDETECT:
		base += bank->regs->rising;
		break;
	case FALLINGDETECT:
		base += bank->regs->falling;
		break;
	default:
		dev_err(bank->chip.parent,
		"Could not config unterrupt for pin %d\n", pin);
		break;
	}

	temp_reg = ioread32(base);
	temp_reg |= (1 << pin);
	iowrite32(temp_reg, base);
}

void __enable_debounce(struct my_gpio_bank *bank, int pin, int is_enable)
{
	void __iomem *base = bank->base;
	int temp_reg = ioread32(base + bank->regs->debounce_enable);

	if (is_enable)
		temp_reg |= (1 << pin);
	else
		temp_reg &= ~(1 << pin);

	iowrite32(temp_reg, base + bank->regs->debounce_enable);
}

void __set_debouncetime(struct my_gpio_bank *bank, int sec)
{
	pr_emerg("Dungnt98 %s %d\n", __func__, __LINE__);
}

/*****************************************************************************
 ********** There are some functions services for initialize gpio_chip *******
 ****************************************************************************/
int	my_gpio_request(struct gpio_chip *chip, unsigned int pin)
{
	struct my_gpio_bank *bank = to_my_gpio_bank(chip);

	if (!(bank->pins)) {
		pm_runtime_get_sync(bank->chip.parent);
		__enable_modules(bank, 1);
	}
	bank->pins |= (1 << pin);

//	return pinctrl_request_gpio(chip->base + gpio_pin);

	return 0;
}

void my_gpio_free(struct gpio_chip *chip, unsigned int pin)
{
	struct my_gpio_bank *bank = to_my_gpio_bank(chip);

	pinctrl_free_gpio(chip->base + pin);
	bank->pins &= ~(1 << pin);

	if (!(bank->pins)) {
		pm_runtime_put(chip->parent);
		__enable_modules(bank, 0);
	}
}

int	my_gpio_get_direction(struct gpio_chip *chip, unsigned int pin)
{
	int ret = 0;
	struct my_gpio_bank *bank = to_my_gpio_bank(chip);

	if (bank == NULL) {
		pr_err("error get bank\n");
		return -1;
	}

	ret = __get_direction(bank, pin);

	return ret;
}

int	my_gpio_direction_input(struct gpio_chip *chip, unsigned int pin)
{
	struct my_gpio_bank *bank = to_my_gpio_bank(chip);

	if (bank == NULL) {
		pr_err("error get bank\n");
		return -1;
	}

	__set_direction(bank, pin, 1);

	return 0;
}

int	my_gpio_direction_output(struct gpio_chip *chip,
		unsigned int pin, int value)
{
	struct my_gpio_bank *bank = to_my_gpio_bank(chip);

	__set_direction(bank, pin, 0);
	__set_dataout(bank, pin, value);

	return 0;
}

int my_gpio_get(struct gpio_chip *chip, unsigned int pin)
{
	struct my_gpio_bank *bank = to_my_gpio_bank(chip);
	int ret = 0;

	if (bank == NULL)
		return -1;

	ret = __get_direction(bank, pin);

	if (ret == IN)
		ret = __get_datain(bank, pin);
	else
		ret = __get_dataout(bank, pin);

	return ret;
}

void my_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
{
	struct my_gpio_bank *bank = to_my_gpio_bank(chip);

	if (bank == NULL)
		return;

	__set_dataout(bank, pin, value);
}

int my_gpio_set_config(struct gpio_chip *chip,
		unsigned int pin, unsigned long config)
{
	struct my_gpio_bank *bank = to_my_gpio_bank(chip);

	__set_direction(bank, pin, 0);
	__set_dataout(bank, pin, 1);

	return 0;
}

/************* Functions services for IRQ setting *************/
static irqreturn_t my_irq_handler(int irq, void *gpiobank)
{
	struct my_gpio_bank *bank = (struct my_gpio_bank *)gpiobank;

	pm_runtime_get_sync(bank->chip.parent);

	/* Do something here */

	pm_runtime_put(bank->chip.parent);

	return IRQ_HANDLED;
}

/**
 * my_irq_startup() - start up interrupt ( default to -> enable if NULL )
 * - enable irq
 */
static unsigned int my_irq_startup(struct irq_data *d)
{
	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
	struct my_gpio_bank *bank = gpiochip_get_data(chip);
	unsigned int offset = d->hwirq;

	__my_enable_irq(bank, offset);

	return 0;
}

/**
 * my_irq_shutdown() - shut down the interrupt ( default to -> disable if NULL )
 * - clear irq flag
 * - disable irq
 */
static void my_irq_shutdown(struct irq_data *d)
{
	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
	struct my_gpio_bank *bank = gpiochip_get_data(chip);
	unsigned int offset = d->hwirq;

	__clear_irq(bank, offset);
	__my_disable_irq(bank, offset);
}

/**
 * my_ack_irq() - start of a new interrupt
 * clear as soon as possible when new interrupt rising
 * Linux calls this function as soon as an interrupt is raised,
 * far before it is serviced.
 * Some implementations map this function to chip->disable(), so that another
 * interrupt request on the line will not cause another interrupt until
 * after the current interrupt request has been serviced.
 */
static void my_ack_irq(struct irq_data *d)
{
	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
	struct my_gpio_bank *bank = gpiochip_get_data(chip);
	unsigned int offset = d->hwirq;

	__clear_irq(bank, offset);
}

static void my_mask_irq(struct irq_data *d)
{
	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
	struct my_gpio_bank *bank = gpiochip_get_data(chip);
	unsigned int offset = d->hwirq;
}

static void my_unmask_irq(struct irq_data *d)
{
	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
	struct my_gpio_bank *bank = gpiochip_get_data(chip);
	unsigned int offset = d->hwirq;

}

/*
 * my_irq_type() - sets the type detection of an IRQ.
 */
static int my_irq_type(struct irq_data *d, unsigned int type)
{
	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
	struct my_gpio_bank *bank = gpiochip_get_data(chip);
	unsigned int offset = d->hwirq;

	return 0;
}

/*
 * my_gpio_wake_enable() - enables/disables power-management
 * wake-on of an IRQ
 */
static int my_gpio_wake_enable(struct irq_data *d, unsigned int enable)
{
	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
	struct my_gpio_bank *bank = gpiochip_get_data(chip);
	unsigned int offset = d->hwirq;

	return 0;
}

/*
 * my_irq_bus_lock() - Lock access to slow bus (I2C) chips.
 * Locking a mutex here is sufficient.
 */
static void my_irq_bus_lock(struct irq_data *d)
{
	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
	struct my_gpio_bank *bank = gpiochip_get_data(chip);
	unsigned int offset = d->hwirq;
}

/*
 * my_irq_bus_sync_unlock() - Sync and unlock slow bus (I2C) chips.
 * Unlock the mutex previously locked.
 */
static void my_irq_bus_sync_unlock(struct irq_data *d)
{
	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
	struct my_gpio_bank *bank = gpiochip_get_data(chip);
	unsigned int offset = d->hwirq;
}

/*****************************************************************************/

static int init_gpio_chip(struct platform_device *pdev, struct irq_chip *irqc)
{
	static int gpio = 32;
	int ret = 0;
	int irq_base = 0;
	struct resource *res;
	struct device *dev = &pdev->dev;
	struct my_gpio_bank *bank = platform_get_drvdata(pdev);

	if (bank == NULL)
		dev_err(dev, "can't get drvdata\n");

	/* Get physical address from DT */
	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	bank->base = devm_ioremap_resource(dev, res);
	if (bank->base == NULL) {
		dev_err(dev, "can't get resource resource\n");
		return PTR_ERR(bank->base);
	}

	/* Get IRQ number from DT */
	bank->irq = platform_get_irq(pdev, 0);
	if (bank->irq <= 0) {
		if (!bank->irq)
			bank->irq = -ENXIO;
		if (bank->irq != -EPROBE_DEFER)
			dev_err(dev, "can't get irq resource\n");
		return bank->irq;
	}

	bank->chip.parent = dev;
	bank->chip.owner = THIS_MODULE;
	bank->chip.of_node = dev->of_node;
	bank->chip.base = gpio;
	bank->chip.ngpio = BANK_WIDTH;
	bank->chip.label = "gpio";

	bank->chip.request = my_gpio_request;
	bank->chip.free = my_gpio_free;
	bank->chip.get_direction = my_gpio_get_direction;
	bank->chip.direction_input = my_gpio_direction_input;
	bank->chip.direction_output = my_gpio_direction_output;
	bank->chip.get = my_gpio_get;
	bank->chip.set = my_gpio_set;
	bank->chip. set_config = my_gpio_set_config;

	gpio += BANK_WIDTH;

	/* create sysfs */
	ret = gpiochip_add_data(&bank->chip, bank);
	if (ret) {
		dev_err(bank->chip.parent, "Dungnt98 Could not register gpio chip\n");
		return ret;
	}

	/* auto register chip->to_irq api */
	ret = gpiochip_irqchip_add(&bank->chip,
		irqc, irq_base, handle_bad_irq, IRQ_TYPE_NONE);
	if (ret) {
		dev_err(bank->chip.parent, "Couldn't add irqchip to gpiochip\n");
		gpiochip_remove(&bank->chip);
		return -ENODEV;
	}

	// gpiochip_set_chained_irqchip(&bank->chip, irqc, bank->irq, NULL);

	/* request irq */
	ret = devm_request_irq(bank->chip.parent, bank->irq,
			my_irq_handler, 0, dev_name(bank->chip.parent), bank);
	if (ret) {
		pr_emerg("Dungnt98 %s %d\n", __func__, __LINE__);
		gpiochip_remove(&bank->chip);
	}

	return ret;
}

static const struct of_device_id my_of_match[];

static int my_gpio_probe(struct platform_device *pdev)
{
	int ret = 0;
	struct device *dev = &pdev->dev;
	struct my_gpio_bank *bank = NULL;
	struct irq_chip *irqc;
	const struct omap_gpio_reg_offs *pdata;
	const struct of_device_id *match;

	/* get struct regs offset */
	match = of_match_device(of_match_ptr(my_of_match), dev);
	pdata = match ? match->data : dev_get_platdata(dev);
	if (!pdata)
		return -EINVAL;

	bank = devm_kzalloc(dev, sizeof(struct my_gpio_bank), GFP_KERNEL);
	if (!bank) {
		pr_err("Error allocate memmory\n");
		return -ENOMEM;
	}

	irqc = devm_kzalloc(dev, sizeof(struct irq_chip), GFP_KERNEL);
	if (!bank) {
		dev_err(dev, "Memory alloc failed\n");
		return -ENOMEM;
	}

	irqc->irq_startup = my_irq_startup,
	irqc->irq_shutdown = my_irq_shutdown,
	irqc->irq_ack = my_ack_irq,
	irqc->irq_mask = my_mask_irq,
	irqc->irq_unmask = my_unmask_irq,
	irqc->irq_set_type = my_irq_type,
	irqc->irq_set_wake = my_gpio_wake_enable,
	irqc->irq_bus_lock = my_irq_bus_lock,
	irqc->irq_bus_sync_unlock = my_irq_bus_sync_unlock,
	irqc->name = dev_name(&pdev->dev);
	irqc->flags = IRQCHIP_MASK_ON_SUSPEND;

	pm_runtime_enable(dev);
	pm_runtime_irq_safe(dev);
	pm_runtime_get_sync(dev);

	bank->regs = pdata;
	platform_set_drvdata(pdev, bank);

	/* register gpio_chip and irq_chip */
	ret = init_gpio_chip(pdev, irqc);
	if (ret) {
		devm_kfree(&pdev->dev, bank);
		devm_kfree(&pdev->dev, irqc);
		pr_err("Error init gpio_chip");
		return ret;
	}

	pm_runtime_put(bank->chip.parent);

	return 0;
}

static int my_gpio_remove(struct platform_device *pdev)
{
	pr_info("Dungnt98 %s %d\n", __func__, __LINE__);

	struct my_gpio_bank *bank = platform_get_drvdata(pdev);

	gpiochip_remove(&bank->chip);

	pm_runtime_disable(&pdev->dev);

	return 0;
}

struct omap_gpio_reg_offs regs_offset = {
	.revision = GPIO_REVISION,
	.sysconfig = GPIO_SYSCONFIG,
	.eoi = GPIO_EOI,
	.irqstatus_raw0 = GPIO_IRQSTATUS_RAW_0,
	.irqstatus_raw1 = GPIO_IRQSTATUS_RAW_1,
	.irq_status0 = GPIO_IRQSTATUS_0,
	.irq_status1 = GPIO_IRQSTATUS_1,
	.irq_status_set0 = GPIO_IRQSTATUS_SET_0,
	.irq_status_set1 = GPIO_IRQSTATUS_SET_1,
	.irq_status_clr0 = GPIO_IRQSTATUS_CLR_0,
	.irq_status_clr1 = GPIO_IRQSTATUS_CLR_1,
	.irq_waken0 = GPIO_IRQWAKEN_0,
	.irq_waken1 = GPIO_IRQWAKEN_1,
	.sysstatus = GPIO_SYSSTATUS,
	.ctrl = GPIO_CTRL,
	.oe = GPIO_OE,
	.datatin = GPIO_DATAIN,
	.dataout = GPIO_DATAOUT,
	.leveldetect0 = GPIO_LEVELDETECT0,
	.leveldetect1 = GPIO_LEVELDETECT1,
	.rising = GPIO_RISINGDETECT,
	.falling = GPIO_FALLINGDETECT,
	.debounce_enable = GPIO_DEBOUNCENABLE,
	.debonce_time = GPIO_DEBOUNCINGTIME,
	.clear_dataout = GPIO_CLEARDATAOUT,
	.set_dataout = GPIO_SETDATAOUT,
};

static const struct of_device_id my_of_match[] = {
	{
		.compatible = "dungnt98,omap4-gpio",
		.data = &regs_offset,
	},
	{ },
};
MODULE_DEVICE_TABLE(of, my_of_match);

static struct platform_driver my_platform_driver = {
	.probe = my_gpio_probe,
	.remove	= my_gpio_remove,
	.driver		= {
		.name	= "my_bbb_gpio",
		.owner = THIS_MODULE,
		.of_match_table = my_of_match,
	},
};

module_platform_driver(my_platform_driver);

MODULE_AUTHOR("Trong Dung");
MODULE_LICENSE("GPL");
