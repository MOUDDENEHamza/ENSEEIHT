############################ -*- Mode: Makefile -*- ###########################
## Makefile --- Cours MPI : TP5 : Communications collectives
##
## Auteur          : Dimitri LECAS (CNRS/IDRIS)
##
###############################################################################

# Compilateurs, options de compilation et d'édition de liens
include ../arch/make_inc

OBJS = produit_matrices.o

# Règle implicite de compilation
.SUFFIXES: .o .c
.c.o:
	$(CC) -c $(CFLAGS_TP5) $<

all : produit_matrices

produit_matrices: $(OBJS)
	$(CC) -o $@ $(LDFLAGS_TP5) $(OBJS)
	$(MPIEXEC_TP5) ./produit_matrices

clean:
	rm -f $(OBJS) produit_matrices core
