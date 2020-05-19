/* spi_protocol_example.c
 * This is template for SPI_PROTOCOL_DRIVER
 */
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/slab.h>
#include <linux/types.h>
#include <linux/io.h>
#include <linux/slab.h>
#include <linux/cdev.h>
#include <linux/device.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/ioctl.h>
#include <linux/mm.h>
#include <linux/module.h>
#include <linux/gpio.h>
#include <linux/delay.h>
#include <linux/spi/spi.h>
#include <linux/string.h>
#include <linux/of_gpio.h>

#include "lcd.h"
#include "lcd_ioctl.h"

#define MAX_SLAVE	2

static LIST_HEAD(device_list);

struct class  *class_p;
dev_t  dev_num;

/***************** OS Specific **********************/
/*
 * Turn on LCD
 */
static int nokia5110_open(struct inode *inodep, struct file *filep)
{
	struct nokia_5110 *lcd = NULL;
	int status = -ENXIO;

	pr_info("Dungnt98 %s, %d\n", __func__, __LINE__);

	/* find spi device coresspond with device file */
	list_for_each_entry(lcd, &device_list, device_entry) {
		if (lcd->dev_number == inodep->i_rdev) {
			status = 0;
			break;
		}
	}

	if (status) {
		pr_info("Device has not support \n");
		return status;
	}

	filep->private_data = lcd;

	return 0;
}

/*
 * Turn off LCD
 */
static int nokia5110_release(struct inode *inodep, struct file *filep)
{
	pr_info("Dungnt98 %s, %d\n", __func__, __LINE__);

	filep->private_data = NULL;
	return 0;
}

/*
 * Display Text to LCD
 */
static int nokia5110_write(struct file *filep, const char __user *buf,
			size_t len, loff_t *offset)
{
	struct nokia_5110 *lcd = filep->private_data;
	int ret;
	Draw_String_t *str = NULL;

	pr_emerg("%s: lcd-dc: %d\n", __func__, lcd->lcd_dc);
	pr_emerg("%s: lcd-rs: %d\n", __func__, lcd->lcd_rs);

	str = kzalloc(sizeof(Draw_String_t), GFP_KERNEL );

	ret = copy_from_user(str, buf, sizeof(Draw_String_t));
	if (ret) {
		pr_err("can not copy from user\n");
		return -ENOMSG;
	}
	pr_info("\nUser send: %s\n", str->message);

	LCD_Puts(str->message, str->pixel, str->font);

	LCD_Refresh(lcd);

	return len;
}

static long nokia5110_ioctl(struct file* filep, unsigned int cmd,
			unsigned long arg)
{
	struct nokia_5110 *lcd = filep->private_data;
	void __user *argp = (void __user *)arg;
	unsigned char *value = (unsigned char *)argp;
	unsigned char contrast;
	int ret = 0;

	Position_t *pos = NULL;
	Draw_Pixel_t *pixel = NULL;
	Draw_Shape_t *shape = NULL;
	Draw_Circle_t *cir = NULL;

	switch (cmd) {
	case IOCTL_SEND_BUFF:
			LCD_Refresh(lcd);
			break;

	case IOCTL_CLEAR:
			LCD_Clear(lcd);
			break;

	case IOCTL_HOME:
			LCD_Home(lcd);
			break;

	case IOCTL_SET_CONTRAST:
			get_user(contrast, value);
			LCD_SetContrast(lcd, contrast);
			break;

	case IOCTL_GOTOXY:
			pos = kmalloc(sizeof(Position_t), GFP_KERNEL);
			ret = copy_from_user(pos, argp, sizeof(Position_t));
			LCD_GotoXY(lcd, pos->x, pos->y);
			break;

	case IOCTL_DRAW_PIXEL:
			pixel = kmalloc(sizeof(Draw_Pixel_t), GFP_KERNEL);
			ret = copy_from_user(pixel, argp, sizeof(Draw_Pixel_t));
			LCD_DrawPixel(pixel->x, pixel->y, pixel->pixel);
			break;

	case IOCTL_DRAW_LINE:
			shape = kmalloc(sizeof(Draw_Shape_t), GFP_KERNEL);
			ret = copy_from_user(shape, argp, sizeof(Draw_Shape_t));
			LCD_DrawLine(shape->x0, shape->y0, shape->x1, shape->y1,
					shape->pixel);
			break;

	case IOCTL_DRAW_RECT:
			shape = kmalloc(sizeof(Draw_Shape_t), GFP_KERNEL);
			ret = copy_from_user(shape, argp, sizeof(Draw_Shape_t));
			LCD_DrawRectangle(shape->x0, shape->y0, shape->x1,
					shape->y1, shape->pixel);
			break;

	case IOCTL_DRAW_FILL_RECT:
			shape = kmalloc(sizeof(Draw_Shape_t), GFP_KERNEL);
			ret = copy_from_user(shape, argp, sizeof(Draw_Shape_t));
			LCD_DrawFilledRectangle(shape->x0, shape->y0, shape->x1,
					shape->y1, shape->pixel);
			break;

	case IOCTL_DRAW_CIRCLE:
			cir = kmalloc(sizeof(Draw_Circle_t), GFP_KERNEL);
			ret = copy_from_user(cir, argp, sizeof(Draw_Circle_t));
			LCD_DrawCircle(cir->x, cir->y, cir->r, cir->pixel);
			break;

	case IOCTL_DRAW_FILL_CIRCLE:
			cir = kmalloc(sizeof(Draw_Circle_t), GFP_KERNEL);
			ret = copy_from_user(cir, argp, sizeof(Draw_Circle_t));
			LCD_DrawFilledCircle(cir->x, cir->y, cir->r, cir->pixel);
			break;

	default:
		return -ENOTTY;
	}

	return 0;
}

static struct file_operations fops = {
	.open = nokia5110_open,
	.release = nokia5110_release,
	.write = nokia5110_write,
	.unlocked_ioctl = nokia5110_ioctl,
};

static int my_probe(struct spi_device *spi)
{
	char res = 0;
	int major = MAJOR(dev_num);
	int minor = spi->chip_select;
	struct nokia_5110 *lcd = NULL;
	struct device_node *np = spi->dev.of_node;

/******************* SPI Device Driver ****************/
	lcd = kzalloc(sizeof(*lcd), GFP_KERNEL);
	if (lcd == NULL)
		goto lcd_aloccate_failed;

	lcd->spi = spi;
	lcd->lcd_dc = of_get_named_gpio(np, "lcd-dc", 0);
	lcd->lcd_rs = of_get_named_gpio(np, "lcd-rs", 0);

	spi_set_drvdata(spi, lcd);

	pr_emerg("%s: lcd-dc: %d\n", __func__, lcd->lcd_dc);
	pr_emerg("%s: lcd-rs: %d\n", __func__, lcd->lcd_rs);

	/*
	res = spi_setup(lcd->spi);
	pr_info("Dungnt98 chip_select = %d \n", spi->chip_select);
	pr_info("Dungnt98 clock = %d \n", spi->max_speed_hz);
	pr_info("Dungnt98 cs = %d \n", spi->cs_gpio);
	*/
/***************** Create Device File ***************/
	lcd->dev_number = MKDEV(major, minor);
	lcd->device_p = device_create(class_p,
			&spi->dev, lcd->dev_number, lcd, "lcd_%d",spi->chip_select);
	if (lcd->device_p == NULL) {
		pr_info("Can not create device\n");
		goto create_device_failed;
	}

	/* Register operations of device */
	cdev_init(&lcd->c_dev, &fops);
	lcd->c_dev.owner = THIS_MODULE;
	lcd->c_dev.dev = lcd->dev_number;

	res = cdev_add(&lcd->c_dev, lcd->dev_number, 1);
	if (res) {
		pr_err("error occur when add properties for struct cdev\n");
		goto cdev_add_fail;
	}
/*************** Management LCD devices *************/
	INIT_LIST_HEAD(&lcd->device_entry);
	list_add(&lcd->device_entry, &device_list);

	LCD_Init(lcd, 0x38);
	pr_info("LCD Init successfully\n");
	return 0;

cdev_add_fail:
	device_destroy(class_p, lcd->dev_number);
create_device_failed:
	kfree(lcd);
lcd_aloccate_failed:
	return -1;
}

static int my_remove(struct spi_device *spi)
{
	struct nokia_5110 *lcd = spi_get_drvdata(spi);

	list_del(&lcd->device_entry);

	cdev_del(&lcd->c_dev);
	device_destroy(class_p, lcd->dev_number);
	unregister_chrdev_region(lcd->dev_number, 1);

	LCD_Clear(lcd);
	LCD_free_IO(lcd);

	kfree(lcd);

	pr_emerg("Dungnt98 %s, %d\n", __func__, __LINE__);
	pr_emerg("Dungnt98 cs-gpio: %d\n", spi->cs_gpio);
	pr_emerg("Dungnt98 chip_select: %d\n", spi->chip_select);
	pr_emerg("Dungnt98 lcd_dc: %d\n", lcd->lcd_dc);
	pr_emerg("Dungnt98 lcd_rs: %d\n", lcd->lcd_rs);

	return 0;
}

struct of_device_id dungnt98_of_match[] = {
	{
		.compatible = "dungnt98,spi1"
	},
	{
		.compatible = "dungnt98,spi2"
	},
	{}
};
MODULE_DEVICE_TABLE(of, dungnt98_of_match);

static struct spi_driver my_spi_driver = {
	.probe = my_probe,
	.remove = my_remove,
	.driver = {
		.name = "my_spi", /* /sys/bus/spi/drivers/.... */
		.owner = THIS_MODULE,
		.of_match_table = dungnt98_of_match,	/* Matching device tree node */
	},
};

static int __init dungnt_init(void)
{
	int res = 0;
	pr_emerg("Dungnt98 %s, %d\n", __func__, __LINE__);

	/* Register range device numbers for number of LCD devices */
	res = alloc_chrdev_region(&dev_num, 0, MAX_SLAVE, "nokia_5110_device");
	if (res < 0) {
		pr_info("Error occur, can not register major number\n");
		goto alloc_dev_failed;
	}

	/* Create the class for all of LCD Devices */
	class_p = class_create(THIS_MODULE, "nokia_5110_class");
	if (class_p == NULL) {
		pr_info("Error occur, can not create class device\n");
		goto create_class_failed;
	}

	/* Register spi_driver - protocol driver */
	res = spi_register_driver(&my_spi_driver);
	if (res < 0)
		goto spi_register_failed;

	pr_emerg("%s success, %d\n", __func__, __LINE__);
	return res;

spi_register_failed:
	class_destroy(class_p);
create_class_failed:
	unregister_chrdev_region(dev_num, MAX_SLAVE);
alloc_dev_failed:
	return res;
}

static void __exit dungnt_exit(void)
{
	
	spi_unregister_driver(&my_spi_driver);
	class_destroy(class_p);
	unregister_chrdev_region(dev_num, MAX_SLAVE);
}

module_init(dungnt_init);
module_exit(dungnt_exit);


MODULE_AUTHOR("Trong Dung");
MODULE_LICENSE("GPL");

