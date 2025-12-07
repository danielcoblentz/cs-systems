#include <mpi.h>
#include <stdio.h>

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);

    int rank = 0;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    int value = rank;
    int sum = 0;
    MPI_Allreduce(&value, &sum, 1, MPI_INT, MPI_SUM, MPI_COMM_WORLD);

    printf("Rank %d reports global sum %d\n", rank, sum);

    MPI_Finalize();
    return 0;
}
