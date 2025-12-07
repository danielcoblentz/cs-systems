
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

    int rank, size, j, manager = 0;
    MPI_Status status;
    long my_trials, temp;

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

    /* Reduce results to manager */
    if (rank == manager) {
        for (j = 1; j < size; j++) {
            MPI_Recv(&temp, 1, MPI_LONG, j, j, MPI_COMM_WORLD, &status);
            Ncirc += temp;
        }
        pi = 4.0 * ((double)Ncirc) / ((double)num_trials);
        printf("\n \t Computing pi using six basic MPI functions: \n");
        printf("\t For %ld trials, pi = %f\n\n", num_trials, pi);
    } else {
        MPI_Send(&Ncirc, 1, MPI_LONG, manager, rank, MPI_COMM_WORLD);
    }

    MPI_Finalize();
    return 0;
}