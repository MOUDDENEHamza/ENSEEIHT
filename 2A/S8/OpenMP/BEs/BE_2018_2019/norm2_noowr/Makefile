CC       = gcc
LINK     = $(CC)

CFLAGS   = -O3 -fopenmp 
# CFLAGS   = -g -fopenmp
LDFLAGS  = $(CFLAGS) 
LIBS     = -lm

OBJS =   main.o

main: $(OBJS)
	$(LINK) -o $@  $(LDFLAGS) $(OBJS) $(LIBS)






clean:
	(rm -f *.o main)



%.o: %.c
	$(CC)  $(CFLAGS)  $(CINCLUDES) $(INCLUDES) $(CDEFS) $(PREC) -c $<
%.o: %.f90				       
	$(FC)  $(FCFLAGS) $(FINCLUDES) $(INCLUDES) $(FDEFS) $(DEFINE_PREPEND)$(PREC) -c $<




