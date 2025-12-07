#include <omp.h>
#include <stdio.h>

int main(void) {
    #pragma omp parallel
    {
        int id = omp_get_thread_num();
        int count = omp_get_num_threads();
        #pragma omp critical
        {
            printf("Hello from thread %d of %d\n", id, count);
        }
    }
    return 0;
}
