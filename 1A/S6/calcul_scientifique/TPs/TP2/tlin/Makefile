OBJ=tlin.o

LAUX = ./lib/libaux.a

### INTEL ###
F90 = gfortran
FOPTS = -g

test: laux $(OBJ)
	$(F90) $(FOPTS) -o $@ $(OBJ)  $(LAUX) 


laux:
	(cd lib; make)

clean:
	(cd lib; make clean)
	(rm -rf test *.o)


%.o: %.f90
	$(F90) $(FOPTS)  -c $<

%.o: %.f
	$(F90) $(FOPTS)  -c $<


