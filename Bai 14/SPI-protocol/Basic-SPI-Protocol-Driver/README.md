******************* GUIDE for use SPI protocol driver as example for studying *************
- This driver is SPI protocol driver and used controll LCD Nokia 5110.
- It can be create multiple device file by just one driver file.
- It can do it because it use Link list to parse device tree SPI node to get child-node and initialize device infomation (SPI slave).
-------------------------------------------------------------------------------------------------------------------------------------
Do following step to use this source code:

1. Modify spi1 node in device tree file : linux/arch/arm/boot/dts/am33xx.dtsi

	spi1: spi@481a0000 {
		compatible = "ti,omap4-mcspi";
                #address-cells = <1>;
                #size-cells = <0>;
                reg = <0x481a0000 0x400>;
                interrupts = <125>;
                ti,spi-num-cs = <2>;
                ti,hwmods = "spi1";
		cs-gpios = <&gpio3 17 1>, <&gpio0 7 1>;
                dmas = <&edma 42 0
     		        &edma 43 0
                	&edma 44 0
                        &edma 45 0>;
                dma-names = "tx0", "rx0", "tx1", "rx1";
                status = "disabled";

		lcd0:lcd0@0 {
			reg = <0>;
			spi-max-frequency = <10000000>;
			compatible = "dungnt98,spi1";
		};

		lcd1:lcd1@1 {
			reg = <1>;
			spi-max-frequency = <10000000>;
			compatible = "dungnt98,spi2";
		};
        };
	
2. Re-build kernel and coppy file linux/arch/arm/boot/dts/am335x-boneblack.dtb to BOOT partition of sd-card.
3. Modify path of kernel and toolchain in Makefile file then run following command to build driver:
	make clean all
4. Coppy file lcd_driver.ko to sd-card.

5. Insert sd-card and Power up board and run following command to test driver:
	insmode lcd_driver.ko
	echo "hello" > /dev/lcd_113

/******** connection between board and 2 lcd ********/
----------------------------------------------------------------------------------------------------------
|      LCD_1            |                     BBB			|         		LCD_2    |
----------------------------------------------------------------------------------------------------------
       CLK   <-------------------->    P9_31 - SPI1_SCLK           <-------------------->  	CLK
       DIN   <-------------------->    P9_20 - GPIO_112 / SPI1_D1  <-------------------->       DIN
       RESET <-------------------->    P9_27 - GPIO_115            <-------------------->       RESET
       CMD   <-------------------->    P9_25 - GPIO_117            <-------------------->       CMD
       EN    <-------------------->    P9_28 - SPI1_CS0
                                       P9_42 - SPI1_CS1            <-------------------->       EN























