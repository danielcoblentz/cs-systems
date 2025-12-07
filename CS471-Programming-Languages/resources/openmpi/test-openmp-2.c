#include <stdio.h>
#include <omp.h>
#define N 1000

int main(void) {
    int i;
    double a[N], b[N], c[N], d[N];
    double sum = 0.0;

    /* Parallel initialization using OpenMP */
    #pragma omp parallel for
    for (i = 0; i < N; i++) {
        a[i] = i * 1.5;
        b[i] = i + 22.35;
    }

   #pragma omp parallel for
    for (i = 0; i < N; i++){
	c[i] = a[i] + b[i];
	d[i] = a[i] * b[i];
    }

    #pragma omp parallel 
    {
        #pragma omp for
        for (i = 0; i < N; i++)
	   sum = sum + b[i] * c[i];
        
        printf("Thread %d; Sum is %f\n", omp_get_thread_num(), sum);
    }

    printf("The total incorrect sum is %f\n", sum);

    sum = 0.0;  
    #pragma omp parallel for reduction(+:sum) 
     for (i = 0; i < N; i++)
	   sum = sum + b[i] * c[i];

     //serial
     printf("The total sum with reduction is %f\n", sum);  

     sum = 0;
     double ps = 0;
     #pragma omp parallel firstprivate(ps)
    {
        #pragma omp for
        for (i = 0; i < N; i++)
	   ps = ps + b[i] * c[i];
        
        printf("Thread %d; Thread sum is %f\n", omp_get_thread_num(), ps);

        #pragma omp critical
	sum = sum + ps;
    }
    
    //serial 
    printf("The total sum is %f\n", sum);

 
    return 0;
}