/* spi_protocol_example.c
 * This is template for SPI_PROTOCOL_DRIVER
 */
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/slab.h>
#include <linux/types.h>
#include <linux/io.h>
#include <linux/slab.h>
#include <linux/mm.h>
#include <linux/module.h>
#include <linux/spi/spi.h>

static int my_probe(struct spi_device *spi)
{
	spi_setup(spi);
	pr_emerg("Dungnt98 %s, %d", __func__, __LINE__);
	return 0;
}

static int my_remove(struct spi_device *spi)
{
	pr_emerg("Dungnt98 %s, %d", __func__, __LINE__);
	return 0;
}

struct of_device_id dungnt98_of_match[] = {
	{
		.compatible = "dungnt98-compatible",
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
	return spi_register_driver(&my_spi_driver);
}
static void __exit dungnt_exit(void)
{
	return spi_unregister_driver(&my_spi_driver);
}

module_init(dungnt_init);
module_exit(dungnt_exit);


MODULE_AUTHOR("Trong Dung");
MODULE_LICENSE("GPL");

