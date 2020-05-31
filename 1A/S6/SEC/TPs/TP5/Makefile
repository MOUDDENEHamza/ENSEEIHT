GCC = gcc
FLAG = -o
SRC = $(wildcard *.c)
RM = rm
BIN = chatmmap console serveur

compile : $(SRC)
	$(GCC) chatmmap.c $(FLAG) chatmmap
	$(GCC) console.c $(FLAG) console
	$(GCC) serveur.c $(FLAG) serveur

clean :
	$(RM) $(BIN) *_S2C *_C2S

.PHONY : clean
