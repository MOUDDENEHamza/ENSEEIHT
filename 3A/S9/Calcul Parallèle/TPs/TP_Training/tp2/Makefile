############################ -*- Mode: Makefile -*- ###########################
## Makefile --- Cours MPI : TP2 : Communications point à point - ping-pong
##
## Auteur          : Dimitri Lecas (CNRS/IDRIS)
##
###############################################################################

# Compilateurs, options de compilation et d'édition de liens
include ../arch/make_inc

OBJS1 = ping_pong_1.o
OBJS2 = ping_pong_2.o
OBJS3 = ping_pong_3.o

# Règle implicite de compilation
.SUFFIXES: .o .c
.c.o:
	$(CC) -c $(CFLAGS_TP2) $<

ping_pong_1: $(OBJS1)
	$(CC) -o $@ $(LDFLAGS_TP2) $(OBJS1)
	$(MPIEXEC_TP2) ./ping_pong_1

ping_pong_2: $(OBJS2)
	$(CC) -o $@ $(LDFLAGS_TP2) $(OBJS2)
	$(MPIEXEC_TP2) ./ping_pong_2

ping_pong_3: $(OBJS3)
	$(CC) -o $@ $(LDFLAGS_TP2) $(OBJS3)
	$(MPIEXEC_TP2) ./ping_pong_3

clean:
	rm -f $(OBJS1) $(OBJS2) $(OBJS3) ping_pong_1 ping_pong_2 ping_pong_3 core
