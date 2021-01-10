READ = read -p
GIT = git
ADD = add .
COMMIT = commit -m
PUSH = push
PULL = pull

push :
	$(GIT) $(ADD)
	@$(READ) "The message to commit : " message; \
	$(GIT) $(COMMIT) "#$$message"
	$(GIT) $(PUSH)

.PHONY : push
