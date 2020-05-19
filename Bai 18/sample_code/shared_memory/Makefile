obj-m:=kernel_module.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
	gcc -o user_space user_space.c -lrt

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
	rm -rf user_space
