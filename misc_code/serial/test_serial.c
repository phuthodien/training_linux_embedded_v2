/*
 * test_serial.c
 * Sample application to read/write data from serial device.
 * Path to serial device is /dev/ttyUSB0
 * This program have to run with root permission.
 */

#include <stdio.h>
#include <termios.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <stdlib.h>
#include <strings.h>
#include <string.h>
#include <poll.h>
#include <unistd.h>
#include <getopt.h>
#include <time.h>
#include <linux/serial.h>
#include <errno.h>

#include <errno.h>
#include <fcntl.h> 
#include <string.h>
#include <termios.h>
#include <unistd.h>

int
set_interface_attribs (int fd, int speed, int parity)
{
	struct termios tty;
	int status;
	if (tcgetattr (fd, &tty) != 0)
	{
			printf("error %d from tcgetattr", errno);
			return -1;
	}

	cfsetospeed (&tty, speed);
	cfsetispeed (&tty, speed);

	tty.c_cflag = (tty.c_cflag & ~CSIZE) | CS8;     // 8-bit chars
	tty.c_iflag &= ~IGNBRK;         // disable break processing
	tty.c_lflag = 0;                // no signaling chars, no echo,
									// no canonical processing
	tty.c_oflag = 0;                // no remapping, no delays
	tty.c_cc[VMIN]  = 0;            // read doesn't block
	tty.c_cc[VTIME] = 5;            // 0.5 seconds read timeout

	tty.c_iflag &= ~(IXON | IXOFF | IXANY); // shut off xon/xoff ctrl

	tty.c_cflag |= (CLOCAL | CREAD);// ignore modem controls,
									// enable reading
	tty.c_cflag &= ~(PARENB | PARODD);      // shut off parity
	tty.c_cflag |= parity;
	tty.c_cflag &= ~CSTOPB;
	tty.c_cflag &= ~CRTSCTS;
	
	//PhuLA set hardware flow control
	tty.c_cflag |= CRTSCTS;

	if (tcsetattr (fd, TCSANOW, &tty) != 0)
	{
		printf("error %d from tcsetattr", errno);
		return -1;
	}
	
	ioctl(fd, TIOCMGET, &status);
	ioctl(fd, TIOCMSET, &status);

	return 0;
}

void
set_blocking(int fd, int should_block)
{
	struct termios tty;
	memset (&tty, 0, sizeof tty);
	if (tcgetattr (fd, &tty) != 0)
	{
		printf("error %d from tggetattr", errno);
		return;
	}

	tty.c_cc[VMIN]  = should_block ? 1 : 0;
	tty.c_cc[VTIME] = 5;            // 0.5 seconds read timeout

	if (tcsetattr (fd, TCSANOW, &tty) != 0)
		printf("error %d setting term attributes", errno);
}

void main()
{
	char *portname = "/dev/ttyUSB0";
	char buf[4098];
	int n = 0;
	int fd = open (portname, O_RDWR | O_NOCTTY | O_SYNC);
	if (fd < 0)
	{
		printf("error %d opening %s: %s", errno, portname, strerror (errno));
		return;
	}

	set_interface_attribs (fd, B115200, 0);  // set speed to 115,200 bps, 8n1 (no parity)
	set_blocking (fd, 1);                // set no blocking

	write (fd, "hello!\n", 7);           // send 7 character greeting

	usleep ((7 + 25) * 100);             // sleep enough to transmit the 7 plus
                                     // receive 25:  approx 100 uS per char transmit

	while (1) {
		n = read(fd, buf, sizeof buf);
		if (n > 0)
			printf("%s", buf);
		n = 0;
	}
	return;
}
