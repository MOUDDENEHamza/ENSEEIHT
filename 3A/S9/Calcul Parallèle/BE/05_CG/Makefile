CC=gcc
TOOLSDIR=/mnt/n7fs/ens/tp_guivarch/hpc2021
MPICC=$(TOOLSDIR)/openmpi-2.1.1/build/bin/mpicc #mpicc
CFLAGS=-g -O3 #-fsanitize=address
CLIBS=-lblas -llapack 
INCLUDES=-I$(TOOLSDIR)/mpe2-2.4.9b/build/include/

all: CG_par CG_sq

clean:
	rm -rf *.o CG_par CG_sq

%.o: %.c
	echo $@
	$(MPICC) -c -Wall -o $@ $< $(CFLAGS) $(INCLUDES)

CG_par: util.o CG_par.o main_par.o
	$(MPICC) -Dhave_mpi -o $@ $^  -lm

CG_sq: util.o CG_sq.o main_sq.o
	$(CC) -Dhave_mpi -o $@ $^  -lm
