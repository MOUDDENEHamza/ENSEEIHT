CC=gcc
TOOLSDIR=/mnt/n7fs/ens/tp_guivarch/hpc2021
MPICC=$(TOOLSDIR)/openmpi-2.1.1/build/bin/mpicc #mpicc
CFLAGS=-g -O3 #-fsanitize=address
CLIBS=-lblas -llapack 
INCLUDES=-I$(TOOLSDIR)/mpe2-2.4.9b/build/include/

all: dotp

clean:
	rm -rf *.o dotp

%.o: %.c
	echo $@
	$(MPICC) -c -Wall -o $@ $< $(CFLAGS) $(INCLUDES)

dotp: dotp.o
	$(MPICC) -Dhave_mpi -o $@ $^  -lm
