############################ -*- Mode: Makefile -*- ###########################
## Makefile --- Cours MPI : TP4 : Type de données derivées (type_transpose)
##
## Auteur          : Dimitri LECAS (CNRS/IDRIS) <dimitri.lecas@idris.fr>
##
###############################################################################

# Compilateurs, options de compilation et d'édition de liens
include ../../arch/make_inc

OBJS = transpose.o

# Règle implicite de compilation
.SUFFIXES: .o .c
.c.o:
	$(CC) -c $(CFLAGS_TP4) $<

all : transpose

transpose: $(OBJS)
	$(CC) -o $@ $(LDFLAGS_TP4) $(OBJS)
	$(MPIEXEC_TP4) ./transpose

clean :
	rm -f $(OBJS) transpose core
