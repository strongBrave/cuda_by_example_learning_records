#include "../common/book.h"

#define N 10

void add(int *a, int *b, int *c)
{
    int tid = 0; // this is CPU zero, so we start zero
    while (tid < N)
    {
        c[tid] = a[tid] + b[tid];
        tid += 1; // we have one CPU, so we incermeny by one
    }
}

int main(void)
{
    int a[N], b[N], c[N];

    // fill the arrays "a" and "b" on the CPU
    for (int i =0; i < N; i ++ )
    {
        a[i] = -1;
        b[i] = i * i;
    }

    add(a, b, c);

    // display the results
    for (int i = 0; i < N; i ++ )
    {
        printf("%d + %d = %d\n", a[i], b[i], c[i]);
    }

    return 0;
}