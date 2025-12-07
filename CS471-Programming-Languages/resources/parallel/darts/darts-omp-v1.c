#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

int main(void) {
    const int darts = 200000;
    int hits = 0;

    #pragma omp parallel reduction(+:hits)
    {
        unsigned int seed = 1234u + (unsigned int)omp_get_thread_num();
        int local = darts / omp_get_num_threads();

        for (int i = 0; i < local; ++i) {
            double x = rand_r(&seed) / (double)RAND_MAX;
            double y = rand_r(&seed) / (double)RAND_MAX;
            double dist = x * x + y * y;
            if (dist <= 1.0) {
                ++hits;
            }
        }
    }

    double pi = 4.0 * hits / darts;
    printf("Approximate pi (OpenMP): %.6f using %d threads\n", pi, omp_get_max_threads());
    return 0;
}
