JAVAC = javac
CLASSPATH = -classpath /usr/share/java/junit4.jar:.
JAVA = java
SRC = Point.java Cercle.java
TEST = CercleTest.java ComplementsCercleTest.java SujetCercleTest.java FormeCercleTest.java RobustesseCercleTest.java
EXC = CercleTest ComplementsCercleTest SujetCercleTest FormeCercleTest RobustesseCercleTest
FLAG = org.junit.runner.JUnitCore
RM = rm
BYTECODES = *.class

all :
	$(MAKE) compile -s
	$(MAKE) run -s
	$(MAKE) clean -s

doc : 
	javadoc $(CLASSPATH) -d doc *.java


compile : $(TEST)
	$(JAVAC) $(CLASSPATH) $(SRC)
	$(JAVAC) $(CLASSPATH) $(TEST)

run : 
	$(JAVA) -ea $(CLASSPATH) $(FLAG) $(EXC) 

clean :
	$(RM) $(BYTECODES)

