import csv
import matplotlib.pyplot as plt

N   = []
cpu = []
gpu = []

with open('gpu_vs_cpu.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        N.append(int(row[0]))
        cpu.append(int(row[1]))
        gpu.append(int(row[2]))

plt.plot(N, cpu, 'r--', label='CPU')
plt.plot(N, gpu, 'b--', label='GPU')
plt.legend(fontsize=16)
plt.title("SGEMM time processing with full CPU or GPU according \n to the dimension")
plt.xscale('log')
plt.xlabel('N')
plt.ylabel('Time (ms)')
plt.savefig('gpu_vs_cpu.png')
