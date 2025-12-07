#include <omp.h>
#include <stdio.h>

int main(void) {
    int total = 0;
    #pragma omp parallel for reduction(+:total)
    for (int i = 0; i < 100; ++i) {
        total += i;
    }

    printf("Sum 0..99 = %d using %d threads\n", total, omp_get_max_threads());
    return 0;
}
