PWD := $(shell pwd)

src-file = ./my_gpio.c
obj-m += my_gpio.o

CROSS := /data/dungnt98/toolchain/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
KERNEL := /data/dungnt98/linux/

all:
	make ARCH=arm CROSS_COMPILE=$(CROSS) -C $(KERNEL) SUBDIRS=$(PWD) modules
clean:
	make -C $(KERNEL) SUBDIRS=$(PWD) clean
check:
	./checkpatch.pl --no-tree --ignore CONST_STRUCT --show-types -f $(src-file)
