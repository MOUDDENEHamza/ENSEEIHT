READ = read -p
SVN = svn
ADD = add
FLAG = --force * --auto-props --parents --depth infinity -q
COMMIT = commit -m
PUSH = push

all :
	make add
	make commit

add :
	$(SVN) $(ADD) $(FLAG)

commit : 
	@$(READ) "Enter the message to set up the commit : " message; \
	$(SVN) $(COMMIT) "$$message"
