PWD := $(shell pwd)

obj-m += lcd_driver.o
lcd_driver-objs := lcd.o lcd_ctrl.o

CROSS := /home/dungnt98/toolchain/arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
KERNEL := /home/dungnt98/linux/

all:
	make ARCH=arm CROSS_COMPILE=$(CROSS) -C $(KERNEL) SUBDIRS=$(PWD) modules
clean:
	make -C $(KERNEL) SUBDIRS=$(PWD) clean
