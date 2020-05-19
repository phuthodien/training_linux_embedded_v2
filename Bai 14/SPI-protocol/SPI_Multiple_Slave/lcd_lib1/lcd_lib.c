#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>

#include "lcd_lib.h"


extern int open_file()
{
	int fd;

	fd = open(FILENAME, O_RDWR);
	if (fd < 0) {
		perror("open: Failed\n");
		return fd;
	}

	return fd;
}

extern void draw_string(char *name, Pixel_t color, FontSize_t font)
{
	Draw_String_t str;
	int fd = open_file();

	strcpy(str.message, name);
	str.pixel = color;
	str.font = font;
	if (write(fd, &str, sizeof(str)) < 0) {
		perror("write: Failed\n");
		return;
	}

	close(fd);
}

extern void lcd_send_buff()
{
	int fd = open_file();

	if (ioctl(fd, IOCTL_SEND_BUFF) < 0) {
		printf("ioctl: Failed at %s\n", __func__);
		return;
	}

	close(fd);
}

extern void lcd_clear_screen()
{
	int fd = open_file();

	if (ioctl(fd, IOCTL_CLEAR) < 0) {
		printf("ioctl: Failed at %s\n", __func__);
		return;
	}

	close(fd);
}

extern void lcd_home()
{
	int fd = open_file();

	if (ioctl(fd, IOCTL_HOME) < 0) {
		printf("ioctl: Failed at %s\n", __func__);
		return;
	}

	close(fd);
}

extern void lcd_set_contrast(unsigned char contrast)
{
	unsigned char ct = contrast;
	int fd = open_file();

	if (ioctl(fd, IOCTL_SET_CONTRAST, &ct) < 0) {
		printf("ioctl: Failed at %s\n", __func__);
		return;
	}

	close(fd);
}

extern void lcd_gotoxy(unsigned char x, unsigned char y)
{
	Position_t pos;
	int fd = open_file();

	pos.x = x;
	pos.y = y;

	if (ioctl(fd, IOCTL_GOTOXY, &pos) < 0) {
		printf("ioctl: Failed at %s\n", __func__);
		return;
	}

	close(fd);
}

extern void lcd_draw_pixel(unsigned char x, unsigned char y, Pixel_t pixel)
{
	Draw_Pixel_t pixel_pos;
	int fd = open_file();

	pixel_pos.x = x;
	pixel_pos.y = y;
	pixel_pos.pixel = pixel;

	if (ioctl(fd, IOCTL_DRAW_PIXEL, &pixel_pos) < 0) {
		printf("ioctl: Failed at %s\n", __func__);
		return;
	}

	close(fd);
}

extern void lcd_draw_line(unsigned char x0, unsigned char y0,
		unsigned char x1, unsigned char y1, Pixel_t pixel)
{
	Draw_Shape_t shape;
	int fd = open_file();

	shape.x0 = x0;
	shape.y0 = y0;
	shape.x1 = x1;
	shape.y1 = y1;
	shape.pixel = pixel;

	if (ioctl(fd, IOCTL_DRAW_LINE, &shape) < 0) {
		printf("ioctl: Failed at %s\n", __func__);
		return;
	}

	close(fd);
}

extern void lcd_draw_rect(unsigned char x0, unsigned char y0,
		unsigned char x1, unsigned char y1, Pixel_t pixel)
{
	Draw_Shape_t shape;
	int fd = open_file();

	shape.x0 = x0;
	shape.y0 = y0;
	shape.x1 = x1;
	shape.y1 = y1;
	shape.pixel = pixel;

	if (ioctl(fd, IOCTL_DRAW_RECT, &shape) < 0) {
		printf("ioctl: Failed at %s\n", __func__);
		return;
	}

	close(fd);
}

extern void lcd_draw_fill_rect(unsigned char x0, unsigned char y0,
			unsigned char x1, unsigned char y1, Pixel_t pixel)
{
	Draw_Shape_t shape;
	int fd = open_file();

	shape.x0 = x0;
	shape.y0 = y0;
	shape.x1 = x1;
	shape.y1 = y1;
	shape.pixel = pixel;

	if (ioctl(fd, IOCTL_DRAW_FILL_RECT, &shape) < 0) {
		printf("ioctl: Failed at %s\n", __func__);
		return;
	}

	close(fd);
}

extern void lcd_draw_circle(char x, char y, char r, Pixel_t pixel)
{
	Draw_Circle_t circle;
	int fd = open_file();

	circle.x = x;
	circle.y = y;
	circle.r = r;
	circle.pixel = pixel;

	if (ioctl(fd, IOCTL_DRAW_CIRCLE, &circle) < 0) {
		printf("ioctl: Failed at %s\n", __func__);
		return;
	}

	close(fd);
}

extern void lcd_draw_fill_circle(char x, char y, char r, Pixel_t pixel)
{
	Draw_Circle_t circle;
	int fd = open_file();

	circle.x = x;
	circle.y = y;
	circle.r = r;
	circle.pixel = pixel;

	if (ioctl(fd, IOCTL_DRAW_FILL_CIRCLE, &circle) < 0) {
		printf("ioctl: Failed at %s\n", __func__);
		return;
	}

	close(fd);
}

