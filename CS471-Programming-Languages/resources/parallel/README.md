Parallel programming snippets (OpenMP and MPI).

- `openmp/` - minimal OpenMP examples (`test-openmp.c`, `test-openmp-1.c` reduction, `test-openmp-2.c` sections).
- `mpi/` - MPI hello/allreduce demos (`test-openmpi.c`, `test-openmpi-1.c`).
- `darts/` - Monte Carlo π estimators in OpenMP and MPI (`darts-omp-v1.c`, `darts-mpi-v1.c`, `darts-collective-v1.c`).

Build hints
- OpenMP: `gcc -fopenmp openmp/test-openmp.c -o /tmp/omp-hello && /tmp/omp-hello`
- MPI: `mpicc mpi/test-openmpi.c -o /tmp/mpi-hello && mpirun -np 4 /tmp/mpi-hello`
