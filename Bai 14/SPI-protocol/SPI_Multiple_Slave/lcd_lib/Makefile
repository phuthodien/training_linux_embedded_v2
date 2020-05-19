.PHONY : clean

SOURCES = $(shell echo *.c)
HEADERS = $(shell echo *.h)
OBJECTS = $(SOURCES:.c=.o)

TARGET = lcd_test

CC := /home/dungnt98/toolchain/arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc


all: $(OBJECTS)
	$(CC) -o $(TARGET) $(OBJECTS)
$(OBJECTS):
	$(CC) -c $(SOURCES)

clean: 
	rm -f $(OBJECTS) $(TARGET)
