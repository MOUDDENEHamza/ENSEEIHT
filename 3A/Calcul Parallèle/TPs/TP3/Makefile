default: testing.c gemm_collection.c utils.c
	/mnt/n7fs/ens/tp_abuttari/gcc-offload-gpu/offload/install/bin/gcc\
		-I/applications/CUDA/include \
		-I/applications/CUDA/targets/x86_64-linux/include/ \
		-fopenmp -foffload=nvptx-none -foffload="-O3" \
		gemm_collection.c utils.c testing.c -o testing -L/applications/CUDA/lib64 \
		-lcudart -lcublas -lm \
		-L/mnt/n7fs/ens/tp_abuttari/opt/OpenBLAS/lib -lopenblas
	/mnt/n7fs/ens/tp_abuttari/gcc-offload-gpu/offload/install/bin/gcc\
		-I/applications/CUDA/include \
		-I/applications/CUDA/targets/x86_64-linux/include/ \
		-fopenmp -foffload=nvptx-none -foffload="-O3" \
		gemm_collection.c utils.c gpu_vs_cpu.c -o gpu_vs_cpu -L/applications/CUDA/lib64 \
		-lcudart -lcublas -lm \
		-L/mnt/n7fs/ens/tp_abuttari/opt/OpenBLAS/lib -lopenblas
	/mnt/n7fs/ens/tp_abuttari/gcc-offload-gpu/offload/install/bin/gcc\
		-I/applications/CUDA/include \
		-I/applications/CUDA/targets/x86_64-linux/include/ \
		-fopenmp -foffload=nvptx-none -foffload="-O3" \
		gemm_collection.c utils.c gpu_with_cpu.c -o gpu_with_cpu -L/applications/CUDA/lib64 \
		-lcudart -lcublas -lm \
		-L/mnt/n7fs/ens/tp_abuttari/opt/OpenBLAS/lib -lopenblas
	rm -f *.o

clean: 
	rm -f *.o testing gpu_vs_cpu gpu_with_cpu

cleanall: 
	rm -f *.o *.csv *.png testing gpu_vs_cpu gpu_with_cpu
