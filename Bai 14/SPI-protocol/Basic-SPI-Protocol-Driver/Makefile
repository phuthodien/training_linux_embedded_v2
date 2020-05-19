PWD := $(shell pwd)

file-to-check = lcd1.c

obj-m += lcd1.o

CROSS := /home/dungnt98/toolchain/arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
KERNEL := /home/dungnt98/linux/

all:
	make ARCH=arm CROSS_COMPILE=$(CROSS) -C $(KERNEL) SUBDIRS=$(PWD) modules
clean:
	make -C $(KERNEL) SUBDIRS=$(PWD) clean
check:
	./checkpatch.pl --no-tree --ignore CONST_STRUCT --show-types -f $(file-to-check)
