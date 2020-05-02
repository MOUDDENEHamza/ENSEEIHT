include ../Make.inc

OBJ= dlagge.o dlagsy.o \
	dlaran.o dlarnd.o \
	dlarot.o dlatb4.o \
	dlatm1.o dlatms.o \
	matgen.o

lib: $(OBJ)
	ar cur libaux.a *.o

clean:
	(rm -rf *.o *.a)


%.o: %.f90
	$(FC) -c $<  

%.o: %.F90
	$(FC) -c $<  

%.o: %.f
	$(FC) -c $<  
