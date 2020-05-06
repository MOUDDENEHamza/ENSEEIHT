READ = read -p
SVN = svn
ADD = add
FLAG = --force * --auto-props --parents --depth infinity -q
COMMIT = commit -m

svn :
	@$(READ) "Enter the message to set up the commit : " message; \
	$(SVN) $(ADD) $(FLAG) && $(SVN) $(COMMIT) "$$message"
