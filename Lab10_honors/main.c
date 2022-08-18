/* main.c simple program to test compilation and assembly */

#include <stdio.h>
extern int my_funct(int a, int b);

int main(void)
{
    long long int a = my_funct(3, 5); /* Calling assembly funct test from
				     a C program */
    printf("Result of my_funct(3, 5) = %lld\n", a);
    return 0;
}
