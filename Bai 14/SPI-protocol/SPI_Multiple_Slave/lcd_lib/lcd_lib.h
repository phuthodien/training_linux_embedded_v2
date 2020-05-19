#ifndef __LCD_LIB
#define __LCD_LIB

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

#include "../lcd1/lcd_ioctl.h"


#define FILENAME 	"/dev/lcd_0"

extern void draw_string(char *str, Pixel_t color, FontSize_t font);
extern int open_file();
extern void lcd_send_buff();
extern void lcd_clear_screen();
extern void lcd_home();
extern void lcd_set_contrast(unsigned char contrast);
extern void lcd_gotoxy(unsigned char x, unsigned char y);
extern void lcd_draw_pixel(unsigned char x, unsigned char y, Pixel_t pixel);
extern void lcd_draw_line(unsigned char x0, unsigned char y0,
			unsigned char x1, unsigned char y1, Pixel_t pixel);
extern void lcd_draw_rect(unsigned char x0, unsigned char y0,
		unsigned char x1, unsigned char y1, Pixel_t pixel);
extern void lcd_draw_fill_rect(unsigned char x0, unsigned char y0,
		unsigned char x1, unsigned char y1, Pixel_t pixel);
extern void lcd_draw_circle(char x, char y, char r, Pixel_t pixel);
extern void lcd_draw_fill_circle(char x, char y, char r, Pixel_t pixel);

#endif


