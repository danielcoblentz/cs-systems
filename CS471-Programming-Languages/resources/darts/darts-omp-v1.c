#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

static long num_trials = 10000000;
static long MULTIPLIER = 1366;
static long ADDEND = 150889;
static long PMOD = 714025;

/* Thread-safe linear congruential random number generator */
double lcgrandom_r(unsigned int *seed) {
    long random_next;
    random_next = (MULTIPLIER * (*seed) + ADDEND) % PMOD;
    *seed = random_next;
    return ((double)random_next / (double)PMOD);
}

int main(int argc, char **argv) {
    long i;
    long Ncirc = 0;
    double pi, x, y;
    double r = 1.0;   /* radius of circle */
    double r2 = r * r;

    #pragma omp parallel
    {
        /* Unique seed per thread */
        unsigned int seed = omp_get_thread_num();

        #pragma omp for private(x, y) reduction(+:Ncirc)
        for (i = 0; i < num_trials; i++) {
            x = lcgrandom_r(&seed);
            y = lcgrandom_r(&seed);

            if ((x * x + y * y) <= r2)
                Ncirc++;
        }
    }

    pi = 4.0 * ((double)Ncirc) / ((double)num_trials);

    printf("\n\tComputing pi using OpenMP:\n");
    printf("\tFor %ld trials, pi = %f\n\n", num_trials, pi);

    return 0;
}