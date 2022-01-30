############################ -*- Mode: Makefile -*- ###########################
## Makefile --- Cours MPI : TP8 : Equation de poisson
##
## Auteur          : Dimitri Lecas (CNRS/IDRIS)
## 
###############################################################################
SHELL := /bin/bash
# Compilateur et options de compilation et de link
include ../arch/make_inc

OBJS = parallel.o calcul.o poisson.o
OBJS1 = read.o
OBJS2 = calcul_exact.o
OBJS3 = parallel.o calcul.o poisson_non_bloquant.o

# Règle implicite de compilation
.SUFFIXES: .o .c
.c.o:
	$(CC) -c  $(CFLAGS_TP8) $<

default: poisson

all: poisson read calcul_exact

poisson: $(OBJS)
	$(CC) $(LDFLAGS_TP8) -o $@ $(OBJS)

#poisson_non_bloquant: $(OBJS3)
#	$(CC) $(LDFLAGS_TP8) -o $@ $(OBJS3)

read: $(OBJS1)
	$(CC) $(LDFLAGS_TP8) -o $@ $(OBJS1)

calcul_exact: $(OBJS2)
	$(CC) $(LDFLAGS_TP8) -o $@ $(OBJS2)

verification: fort.11 calcul_exact
	./calcul_exact

fort.11: read donnees.dat
	$(EXEC_TP8_VERIF) ./read

exe donnees.dat: poisson poisson.data
	rm -f donnees.dat
	$(MPIEXEC_TP8) ./poisson

clean:
	rm -f $(OBJS) $(OBJS1) $(OBJS2) $(OBJS3) poisson poisson_non_bloquant calcul_exact read *.mod core donnees.dat fort.10 fort.11
