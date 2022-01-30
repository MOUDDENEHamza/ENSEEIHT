import csv
import matplotlib.pyplot as plt

N   = []
gpu_cpu = []

with open('gpu_with_cpu.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        N.append(int(row[0]))
        gpu_cpu.append(int(row[1]))

plt.plot(N, gpu_cpu, 'r--', label='CPU')
plt.xlabel('% GPU')
plt.ylabel('Time (ms)')
plt.title('SGEMM time processing when using GPU to compute X% of \n '+
          'the working charge for a fixed dimension N=12000')
plt.savefig('gpu_with_cpu.png')
