# Définition des Variables (à compléter)
CC = c99 
CFLAGS = -Wextra -pedantic -c 
LDFLAGS = -o
EXE = test_file exemple_file

# Règles (à compléter avec des variables automatiques)
all: $(EXE)

test_file: file.o test_file.o
	$(CC) $^ $(LDFLAGS) $@

exemple_file: file.o exemple_file.o
	$(CC) $^ $(LDFLAGS) $@

makedepend:
	$@ *.c -Y

clean:
	rm $(EXE) *.o

.PHONY: clean all makedepend

