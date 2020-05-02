OBJLUPIV=TestLUPIV.o
LIBAUX = tlin/lib/libaux.a
F90 = gfortran
FOPTS = -g -fimplicit-none -ffixed-line-length-72 -fbounds-check -fbacktrace

all: TestLUPIV

TestLUPIV: laux $(OBJLUPIV)
	@echo " .... Executable pour la facto LU AVEC pivotage : $@ "
	$(F90) $(FOPTS) -o $@ $(OBJLUPIV)  $(LIBAUX) 

laux:
	(cd tlin/lib; make)

clean:
	(cd tlin/lib; make clean)
	(cd tlin; rm -rf test *.o)
	-rm TestLUPIV  *.o

%.o: %.F90
	$(F90) $(FOPTS)  -c $<

%.o: %.f90
	$(F90) $(FOPTS)  -c $<

%.o: %.f
	$(F90) $(FOPTS)  -c $<


