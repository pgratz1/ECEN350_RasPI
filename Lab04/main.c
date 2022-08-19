/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int my_mul(long long int a, long long int b);

int main(void)
{
    long long int a = my_mul(3, 5);
    printf("Result of my_mul(3, 5) = %lld\n", a);
    return 0;
}
