############################ -*- Mode: Makefile -*- ###########################
## Makefile --- Cours MPI : TP1 : Environnement
##
## Auteur          : Dimitri Lecas (CNRS/IDRIS) <dimitri.lecas@idris.fr>
###############################################################################

# Compilateurs, options de compilation et d'édition de liens
include ../arch/make_inc

OBJS = pair_impair.o

# Règle implicite de compilation
.SUFFIXES: .o .c
.c.o:
	$(CC) -c $(CFLAGS_TP1) $<

all: pair_impair

pair_impair:$(OBJS)
	$(CC) -o $@ $(LDFLAGS_TP1) $(OBJS)
	$(MPIEXEC_TP1) ./pair_impair

clean:
	rm -f $(OBJS) pair_impair core
