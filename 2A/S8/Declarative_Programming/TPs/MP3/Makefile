JAVAC = javac
JAVA = java
CP_OPTS = -cp $$CLASSPATH
JAVAC_OPTS = $(CP_OPTS) -d classes
JAVA_OPTS = $(CP_OPTS):./classes
SRC_DIR = src/fr/n7/smt

_SRC_FILES = SimpleIntegerProblem.java SimpleBVProblem.java CheckingOverflowBV.java \
	SimpleArrayProblem.java Chiffres.java Main.java
SRC_FILES = $(patsubst %,$(SRC_DIR)/%,$(_SRC_FILES))

.PHONY: compile run-example

compile: $(SRC_FILES) | classes
	$(JAVAC) $(JAVAC_OPTS) $^

run-example-int: compile
	$(JAVA) $(JAVA_OPTS) fr.n7.smt.SimpleIntegerProblem

run-example-bv: compile
	$(JAVA) $(JAVA_OPTS) fr.n7.smt.SimpleBVProblem

run-example-overflow: compile
	$(JAVA) $(JAVA_OPTS) fr.n7.smt.CheckingOverflowBV

run-example-array: compile
	$(JAVA) $(JAVA_OPTS) fr.n7.smt.SimpleArrayProblem

run: compile
	$(JAVA) $(JAVA_OPTS) fr.n7.smt.Main

classes:
	mkdir -p $@

clean:
	- rm -rf classes *.log **/*~
