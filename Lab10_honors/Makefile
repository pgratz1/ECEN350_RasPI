# LAB10 Example Makefile
#
# This makefile is intended for use with GNU make

TARGET=Lab10
CC=gcc
LD=gcc

FLAGS=-g -O0

all: $(TARGET)

clean:
	rm *.o *.s $(TARGET)

main.s: main.c
	$(CC) -S  main.c

my_funct.s: my_funct.c
	$(CC) -S  my_funct.c

$(TARGET): main.s my_funct.s
# Compile for best debug view (lowest optimization)
	$(CC) main.c my_funct.c -o Lab10
