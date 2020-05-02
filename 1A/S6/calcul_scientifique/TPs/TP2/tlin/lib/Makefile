F90 = gfortran
FOPTS = -O3
#FOPTS = -g


OBJ= daxpy.o dcopy.o ddot.o dgemv.o \
	dger.o dlabad.o dlagge.o dlagsy.o \
	dlamch.o dlaran.o dlarnd.o dlarnv.o \
	dlarot.o dlartg.o dlaruv.o dlaset.o \
	dlatb4.o dlatm1.o dlatms.o dnrm2.o \
	drot.o dscal.o dsymv.o dsyr2.o lsame.o \
	lsamen.o xerbla.o dgesv.o dgetrf.o \
	dgetf2.o dlaswp.o dgetrs.o dtrsm.o \
	dgemm.o dswap.o idamax.o ilaenv.o \
	ieeeck.o iparmq.o matgen.o

lib: $(OBJ)
	ar cur libaux.a *.o

dlamch.o:dlamch.f
	$(F90) -g  -c $<

%.o: %.f90
	$(F90) $(FOPTS)  -c $<

%.o: %.f
	$(F90) $(FOPTS)  -c $<


clean:
	(rm -rf *.o)
