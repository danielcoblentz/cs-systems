import matplotlib.pyplot as plt
import numpy as np

threads = range(8)
colors = plt.cm.tab10(np.linspace(0, 1, 8))

plt.figure(figsize=(8, 1.2))
for i, c in enumerate(colors):
    plt.barh(0, 1, left=i, color=c, edgecolor='black')
    plt.text(i+0.4, 0, f'T{i}', ha='center', va='center', color='white', fontsize=10)

plt.title("How Parallelism Divides Work Among Threads", pad=25)
plt.yticks([])
plt.xticks([])
plt.xlabel("Each thread processes part of the workload simultaneously →")
plt.tight_layout()
plt.savefig("parallel_threads_demo.png", dpi=150)
plt.show()
