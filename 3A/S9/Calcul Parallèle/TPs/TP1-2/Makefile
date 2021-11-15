CC=gcc
TOOLSDIR=/mnt/n7fs/ens/tp_guivarch/hpc2021
MPICC=$(TOOLSDIR)/openmpi-2.1.1/build/bin/mpicc #mpicc
MPEDIR=$(TOOLSDIR)/mpe2-2.4.9b
LD=$(MPEDIR)/build/bin/mpecc
LDFLAGS=-mpilog
CFLAGS=-g -O3 #-fsanitize=address
CLIBS=-lblas -llapack 
INCLUDES=-I$(TOOLSDIR)/mpe2-2.4.9b/build/include/
SOURCEDIR=src
BUILDDIR=build

all: dir main # test 

test_env: dir who_am_i

dir:
	mkdir -p $(BUILDDIR)/bin


clean:
	rm -rf $(BUILDDIR)

%.o: $(SOURCEDIR)/%.c
	echo $@
	$(MPICC) -c -o $(BUILDDIR)/$@ $< $(CFLAGS) $(INCLUDES)

main: main.o gemms.o ex1.o ex2.o ex3.o utils.o dsmat.o
	$(LD) -Dhave_mpi -o $(BUILDDIR)/bin/$@ $(addprefix $(BUILDDIR)/,$^) $(CLIBS) $(LDFLAGS)

who_am_i: who_am_i.o
	$(LD) -Dhave_mpi -o $(BUILDDIR)/bin/$@ $(addprefix $(BUILDDIR)/,$^)  $(LDFLAGS)

