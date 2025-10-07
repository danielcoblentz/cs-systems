#  OpenMP Results

##  Compilation
```bash
gcc-15 -O3 -fopenmp parallel_speedup_demo.c -o parallel_speedup_demo
```

##  Run Commands
```bash
OMP_NUM_THREADS=1 ./parallel_speedup_demo
OMP_NUM_THREADS=4 ./parallel_speedup_demo
OMP_NUM_THREADS=8 ./parallel_speedup_demo
```

---

##  Results

| Threads | Serial Time (s) | Parallel Time (s) | Speedup | Sum |
|:--------:|:----------------:|:-----------------:|:--------:|:----------------:|
| 1 | 0.141870 | 0.127124 | **1.12×** | 5,183,136,036.00 |
| 4 | 0.129036 | 0.035212 | **3.66×** | 5,183,136,036.00 |
| 8 | 0.127343 | 0.023862 | **5.34×** | 5,183,136,036.00 |

---

