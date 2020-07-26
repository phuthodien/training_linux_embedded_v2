#include <linux/module.h>       /* Needed by all modules */
#include <linux/kernel.h>       /* Needed for KERN_INFO */
#include <linux/time.h>
#include <linux/io.h>
#include <linux/delay.h>

#define GPIO_ADDR_BASE  0x44E07000
#define ADDR_SIZE       (0x1000)
#define GPIO_SETDATAOUT_OFFSET          0x194
#define GPIO_CLEARDATAOUT_OFFSET        0x190
#define GPIO_OE_OFFSET                  0x134
#define LED                             (1 << 31)

uint32_t __iomem *base_addr;
struct timer_list my_timer;
unsigned int count = 0;

static void timer_function(unsigned long data){
	if ((count % 2) == 0)
			*(base_addr + GPIO_SETDATAOUT_OFFSET / 4) |= LED;
	else
			*(base_addr + GPIO_CLEARDATAOUT_OFFSET / 4) |= LED;

	count++;
	mod_timer(&my_timer, jiffies + HZ);
}

int init_module(void)
{
	base_addr = ioremap(GPIO_ADDR_BASE, ADDR_SIZE);

	*(base_addr + GPIO_OE_OFFSET / 4) &= ~LED;

	init_timer(&my_timer);
	my_timer.expires = jiffies + HZ;
	my_timer.function = timer_function;
	my_timer.data = 0;
	add_timer(&my_timer);

	return 0;
}

void cleanup_module(void)
{
	del_timer(&my_timer);
	*(base_addr + GPIO_CLEARDATAOUT_OFFSET / 4) |= LED;
}

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Phu Luu An");
MODULE_DESCRIPTION("Hello world kernel module");
