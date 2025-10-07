#include <stdio.h>
#include <omp.h>

int main() {
    const int N = 12000; // adjust up/down for diff problem size
    double sum, t_serial, t_parallel; 

    //  base version (this will use a single thread and process the computation inorder )
    sum = 0.0;
    double t0 = omp_get_wtime();
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            sum += (i * j) / 1000000.0;
        }
    }
    double t1 = omp_get_wtime();
    t_serial = t1 - t0;
    printf("Serial: sum=%.2f  time=%.6f s\n", sum, t_serial);



    // -----------------------------------------------------------------------------
    //  Parallel version
    sum = 0.0;
    t0 = omp_get_wtime();
    
    #pragma omp parallel for collapse(2) reduction(+:sum) schedule(static)
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            sum += (i * j) / 1000000.0;
        }
    }
    t1 = omp_get_wtime();
    t_parallel = t1 - t0;
    printf("Parallel: sum=%.2f  time=%.6f s  (threads=%d)\n",
           sum, t_parallel, omp_get_max_threads());

    //  speedup computation + results
    printf("Speedup: %.2fx\n", t_serial / t_parallel);
    return 0;
}
