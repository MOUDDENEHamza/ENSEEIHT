READ = read -p
GIT = git
ADD = add .
COMMIT = commit -m
PUSH = push
PULL = pull

push :
	@$(READ) "Enter the message : " message; \
	$(GIT) $(ADD) && $(GIT) $(COMMIT) "#$$message" && $(GIT) $(PUSH)

.PHONY : push
