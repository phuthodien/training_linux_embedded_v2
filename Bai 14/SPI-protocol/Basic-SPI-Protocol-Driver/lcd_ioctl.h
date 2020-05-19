#ifndef __LCD_IOCTL
#define __LCD_IOCTL

#define MAJIC_NO			100
#define IOCTL_CLEAR			_IO(MAJIC_NO, 0)
#define IOCTL_HOME			_IO(MAJIC_NO, 1)
#define IOCTL_SET_CONTRAST		_IOW(MAJIC_NO, 2, unsigned char)

typedef struct position {
	unsigned char x;
	unsigned char y;
} Position_t;
#define IOCTL_GOTOXY			_IOW(MAJIC_NO, 3, Position_t)

typedef enum {
	Pixel_Clear = 0,
	Pixel_Set = !Pixel_Clear
} Pixel_t;

typedef struct draw_pixel {
	unsigned char x;
	unsigned char y;
	Pixel_t pixel;
} Draw_Pixel_t;
#define IOCTL_DRAW_PIXEL		_IOW(MAJIC_NO, 4, Draw_Pixel_t)

typedef struct draw_shape {
	unsigned char x0;
	unsigned char y0;
	unsigned char x1;
	unsigned char y1;
	Pixel_t pixel;
} Draw_Shape_t;
#define IOCTL_DRAW_LINE			_IOW(MAJIC_NO, 5, Draw_Shape_t)
#define IOCTL_DRAW_RECT			_IOW(MAJIC_NO, 6, Draw_Shape_t)
#define IOCTL_DRAW_FILL_RECT		_IOW(MAJIC_NO, 7, Draw_Shape_t)

typedef struct draw_circle {
	char x;
	char y;
	char r;
	Pixel_t pixel;
} Draw_Circle_t;
#define IOCTL_DRAW_CIRCLE		_IOW(MAJIC_NO, 8, Draw_Circle_t)
#define IOCTL_DRAW_FILL_CIRCLE		_IOW(MAJIC_NO, 9, Draw_Circle_t)

#define IOCTL_SEND_BUFF			_IO(MAJIC_NO, 10)

typedef enum {
	FontSize_5x7 = 0,
	FontSize_3x5 = !FontSize_5x7
} FontSize_t;

typedef struct draw_string {
	char message[25];
	Pixel_t pixel;
	FontSize_t font;
} Draw_String_t;

#endif

