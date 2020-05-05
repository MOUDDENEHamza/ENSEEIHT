# Ceci est un commentaire pour introdure la variable CC qui comporte le nom du compilateur utilisé :
CC = c99
# Les variables CFLAGS et LDFLAGS comportent les options de compilation et d'édition des liens :
CFLAGS = -Wextra -pedantic -c
LDFLAGS = -o

all: ephemeride EDT

ephemeride: date.o ephemeride.o
	$(CC) $^ $(LDFLAGS) $@

EDT: date.o salle.o enseignant.o cours.o EDT.o
	$(CC) $^ $(LDFLAGS) $@

depend:
	makedepend *.c -Y

clean:
	rm *.o ephemeride EDT

.PHONY: clean all
# DO NOT DELETE

EDT.o: cours.h salle.h date.h enseignant.h
cours.o: cours.h salle.h date.h enseignant.h
date.o: date.h
enseignant.o: enseignant.h date.h
ephemeride.o: date.h
salle.o: salle.h date.h
