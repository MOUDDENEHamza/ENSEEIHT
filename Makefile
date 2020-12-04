READ = read -p
GIT = git
ADD = add .
COMMIT = commit -m
PUSH = push
PULL = pull

push :
	@$(READ) "Enter the subject : " subject;
	@$(READ) "Enter the message : " message; \
	$(GIT) $(ADD) && $(GIT) $(COMMIT) "#$$subject : $$message" && $(GIT) $(PUSH)

.PHONY : push
