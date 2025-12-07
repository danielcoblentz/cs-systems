#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);

    int rank = 0;
    int size = 0;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    int darts = 100000;
    if (rank == 0 && argc > 1) {
        darts = atoi(argv[1]);
    }

    // Make sure every rank uses the same workload.
    MPI_Bcast(&darts, 1, MPI_INT, 0, MPI_COMM_WORLD);

    int local_darts = darts / size;
    int local_hits = 0;
    unsigned int seed = (unsigned int)time(NULL) + (unsigned int)rank * 2027u;

    for (int i = 0; i < local_darts; ++i) {
        double x = rand_r(&seed) / (double)RAND_MAX;
        double y = rand_r(&seed) / (double)RAND_MAX;
        if (x * x + y * y <= 1.0) {
            ++local_hits;
        }
    }

    int total_hits = 0;
    MPI_Allreduce(&local_hits, &total_hits, 1, MPI_INT, MPI_SUM, MPI_COMM_WORLD);

    if (rank == 0) {
        double pi = 4.0 * total_hits / darts;
        printf("Approximate pi (MPI allreduce): %.6f using %d ranks\n", pi, size);
    }

    MPI_Finalize();
    return 0;
}
