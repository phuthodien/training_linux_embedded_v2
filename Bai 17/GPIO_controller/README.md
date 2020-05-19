************* GUIDE for use GPIO_CONTROLLER driver as example of tutorial **********

1. Modify compatible property of gpio node in device tree at path: linux/arch/arm/boot/dts/am33xx.dtsi
   - notice that we just be able to modify node gpio1 gpio2 gpio3 and can not change gpio0 node, because need it for boot-up system.

2. Modify path of source code linux and toolchain in Makefile file corresponding to your environment build system.

3. run command to build:
	make clean all

4. Coppy file my_gpio.ko to your sd-card and then insert it to Beaglebone Black board.

5. Power-up board, and use command with sysfs to test driver.
