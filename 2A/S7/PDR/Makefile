MAKE = make
SILENT = -s
JAVAC = javac
JAVA = java
JAR = -cp "lib/snakeyaml-1.5.jar"
CLASSPATH = -cp src
FLAG = -Xlint:unchecked
SRC = src/formats/*.java src/map/*.java src/application/*.java src/hdfs/*.java src/ordo/*.java
READ = read -p

all :
	$(MAKE) compile $(SILENT)

compile :
	$(JAVAC) $(JAR) $(FLAG) $(SRC)

run_worker :
	@$(READ) "Enter the port : " Port; \
	$(JAVA) $(CLASSPATH) ordo.WorkerImpl $$Port

run_NameProvider :
	$(JAVA) $(CLASSPATH) hdfs.NameProvider

run_HdfsServer :
	@$(READ) "Enter the server name : " ServerName; \
	$(JAVA) $(CLASSPATH):lib/snakeyaml-1.5.jar hdfs.HdfsServer $$ServerName

run_HdfsClient :
	@$(READ) "args : " args; \
        $(JAVA) $(CLASSPATH):lib/snakeyaml-1.5.jar hdfs.HdfsClient $$args
