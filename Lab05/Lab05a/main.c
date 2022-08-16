/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int test(long long int a, long long int b);
// extern long long int test2(long long int d, long long int e);

int main(void)
{
    long long int c = test(3, 5);
    printf("Result of test(3, 5) = %d\n", c);
//    long long int f = test2(6, 5);
    return 0;
}
