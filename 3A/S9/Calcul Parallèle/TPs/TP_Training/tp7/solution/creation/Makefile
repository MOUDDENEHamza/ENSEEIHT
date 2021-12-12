############################ -*- Mode: Makefile -*- ###########################
## Makefile --- T.P. 7 du cours MPI
##              Création du fichier donnees.dat
##
## Auteur          : Denis GIROU (CNRS/IDRIS - France) <Denis.Girou@idris.fr>
##
###############################################################################

# Compilateur et options de compilation et de link
include ../../../arch/make_inc

OBJS    = creation.o

.SUFFIXES: .o .c
# Règle implicite de compilation
.c.o:
	$(CC) -c $(CFLAGS_TP7) $<

creation:$(OBJS)
	$(CC) $(LDFLAGS_TP7) -o $@ $(OBJS)
	$(MPIEXEC_TP7_CREAT) ./creation
	rm -f $(OBJS) creation core
	cp donnees.dat ../..
	mv donnees.dat ..

clean:
	rm -f *.o creation core

cleanall:
	make clean
	rm -f donnees.dat ../donnees.dat ../../donnees.dat
