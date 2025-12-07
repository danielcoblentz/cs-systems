#include <omp.h>
#include <stdio.h>
#include <unistd.h>

int main(void) {
    #pragma omp parallel sections
    {
        #pragma omp section
        {
            printf("Section A on thread %d\n", omp_get_thread_num());
            sleep(1);
        }
        #pragma omp section
        {
            printf("Section B on thread %d\n", omp_get_thread_num());
            sleep(1);
        }
    }

    printf("Sections complete\n");
    return 0;
}
