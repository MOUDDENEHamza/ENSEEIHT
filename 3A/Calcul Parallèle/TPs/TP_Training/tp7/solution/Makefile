############################ -*- Mode: Makefile -*- ###########################
## Makefile --- T.P. 7 du cours MPI
##
## Auteur          : Dimitri Lecas (CNRS/IDRIS - France)
##
###############################################################################

# Compilateur et options de compilation et de link
include ../../arch/make_inc

OBJS    = lire_fichier.o

# Règle implicite de compilation
.SUFFIXES:
.SUFFIXES: .o .c
.c.o:
	$(CC) -c $(CFLAGS_TP7) $<

lire_fichier:donnees.dat $(OBJS)
	$(CC) $(LDFLAGS_TP7) -o $@ $(OBJS)
	$(MPIEXEC_TP7) ./lire_fichier
	rm -f $(OBJS) core

donnees.dat: creation/carte.dat
	cd creation;make clean;make

exec fichier_dei0.dat: lire_fichier
	$(MPIEXEC_TP7) ./lire_fichier
	rm -f $(OBJS) core

verification: fichier_dei0.dat
	$(CC) verification.c $(LDCFLAGS) -o verification
	$(EXEC_TP7_VERIF) ./verification
	rm -f verification

.PHONY : clean cleanall exec
clean:
	rm -f *.o lire_fichier fichier*.dat verification core*

cleanall:
	make clean
	rm -f donnees.dat
