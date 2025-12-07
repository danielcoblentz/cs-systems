#include <mpi.h>
#include <stdio.h>

static long num_trials = 1000000;
static long MULTIPLIER = 1366;
static long ADDEND = 150889;
static long PMOD = 714025;

/* Thread-safe LCG random number generator using rank-specific seed */
double lcgrandom_r(unsigned int *seed) {
    long random_next;
    random_next = (MULTIPLIER * (*seed) + ADDEND) % PMOD;
    *seed = random_next;
    return ((double)random_next / (double)PMOD);
}

int main(int argc, char **argv) {
    long i, Ncirc = 0;
    double pi, x, y;

    int rank, size;
    long my_trials;

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    /* Determine number of trials for this rank */
    my_trials = num_trials / size;
    if (num_trials % (long)size > (long)rank) my_trials++;

    /* Initialize rank-specific seed */
    unsigned int seed = rank;

    for (i = 0; i < my_trials; i++) {
        x = lcgrandom_r(&seed);
        y = lcgrandom_r(&seed);

        if ((x*x + y*y) <= 1.0)
            Ncirc++;
    }

    /* Reduce Ncirc from all ranks to the manager (rank 0) */
    long total_Ncirc = 0;
    MPI_Reduce(&Ncirc, &total_Ncirc, 1, MPI_LONG, MPI_SUM, 0, MPI_COMM_WORLD);
    printf("rank:%d  Ncirc:%ld  total_Ncirc:%ld\n", rank, Ncirc, total_Ncirc);
    
    if (rank == 0) {
        pi = 4.0 * ((double)total_Ncirc) / ((double)num_trials);
        printf("\n \t Computing pi using MPI_Reduce: \n");
        printf("\t For %ld trials, pi = %f\n\n", num_trials, pi);
    }

    MPI_Finalize();
    return 0;
}