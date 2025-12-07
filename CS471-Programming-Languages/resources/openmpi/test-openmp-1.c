
#include <stdio.h>
#include <omp.h>
#define N 1000

int main(void) {
    int i;
    double a[N], b[N];

    /* Parallel initialization using OpenMP */
    #pragma omp parallel for
    for (i = 0; i < N; i++) {
        a[i] = i * 1.5;
        b[i] = i + 22.35;
    }

    /* Print from a single thread */
    #pragma omp single
    {
        printf("a[0] = %.2f, b[0] = %.2f\n", a[0], b[0]);
        printf("a[N-1] = %.2f, b[N-1] = %.2f\n", a[N-1], b[N-1]);
        printf("Number of threads used: %d\n", omp_get_max_threads());
    }
    return 0;
}