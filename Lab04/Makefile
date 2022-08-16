# LAB04 Example Makefile
#
# This makefile is intended for use with GNU make
# This example is intended to be built with Linaro bare-metal GCC

TARGET=Lab04

CC=gcc
LD=gcc

FLAGS=-g -O0

all: $(TARGET)

clean:
	rm *.o
	rm $(TARGET)

main.o: main.c
# Compile for best debug view (lowest optimization)
	$(CC) $(FLAGS) -c $^ -o $@

my_mul.o: my_mul.S
# Compile for best debug view (lowest optimization)
	$(CC) $(FLAGS) -c $^ -o $@

$(TARGET): main.o my_mul.o
# Link with specific base address to suit VE model memory layout
	$(LD) main.o my_mul.o -o $@
