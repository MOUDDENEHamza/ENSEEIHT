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

run :
	@$(READ) "Enter the port : " Port; \
	$(JAVA) $(CLASSPATH) ordo.WorkerImpl $$Port

