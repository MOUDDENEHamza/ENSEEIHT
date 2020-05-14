MAKE = make
GCC = gcc
INCLUDE = .
SRC = $(wildcard *.c)
MOVE = mv
EXC = main
GIT = git
ADD = add .
COMMIT = commit -m
PUSH = push
READ = read -p

all :
	$(MAKE) compile -s
	$(MAKE) run -s
	$(MAKE) clean -s

compile :
	$(GCC) -I $(INCLUDE) -c $(SRC)
	$(GCC) -o $(EXC) *.o

run :
	./$(EXC)

clean :
	rm $(EXC) *.o
	
git :
	@$(READ) "Enter the message to set up the commit : " message; \
	$(GIT) $(ADD) && $(GIT) $(COMMIT) "$$message" && $(GIT) $(PUSH);
