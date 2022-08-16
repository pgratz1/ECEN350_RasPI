/* main.c simple program to test compilation and assembly */

#include <stdio.h>

/* "test" is our function that is written in ARMv8 Assembly */
extern long long int test(long long int a, long long int b);

int main(void)
{
    long long int a = test(3, 5); /* Calling assembly funct test from
				     a C program */
    printf("Result of test(3, 5) = %lld\n", a);
    return 0;
}
