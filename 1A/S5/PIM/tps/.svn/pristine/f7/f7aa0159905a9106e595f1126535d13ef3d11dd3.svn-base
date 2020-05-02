ephemeride: date.o ephemeride.o
	c99 date.o ephemeride.o -o ephemeride

date.o: date.c date.h
	c99 -Wextra -pedantic -c date.c

ephemeride.o: ephemeride.c
	c99 -Wextra -pedantic -c ephemeride.c

clean:
	rm *.o ephemeride
