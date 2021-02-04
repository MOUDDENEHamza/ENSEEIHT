CC       = gcc
LINK     = $(CC)

CFLAGS   = -g -fopenmp -Wunknown-pragmas
# CFLAGS   = -g -fopenmp
LDFLAGS  = $(CFLAGS) 
LIBS     = -lm

OBJS =   aux.o longest_branch_seq.o longest_branch_par.o main.o

main: $(OBJS)
	$(LINK) -o $@  $(LDFLAGS) $(OBJS) $(LIBS)






clean:
	(rm -f *.o main)



%.o: %.c
	$(CC)  $(CFLAGS)  $(CINCLUDES) $(INCLUDES) $(CDEFS) $(PREC) -c $<
%.o: %.f90				       
	$(FC)  $(FCFLAGS) $(FINCLUDES) $(INCLUDES) $(FDEFS) $(DEFINE_PREPEND)$(PREC) -c $<




