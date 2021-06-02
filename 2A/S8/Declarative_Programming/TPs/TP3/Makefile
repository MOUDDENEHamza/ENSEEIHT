JAVAC = javac
JAVA = java
CP_OPTS = -cp $$CLASSPATH
JAVAC_OPTS = $(CP_OPTS) -d classes
JAVA_OPTS = $(CP_OPTS):./classes
SRC_DIR = src/fr/n7/sat

_SRC_FILES = SimpleBooleanProblem.java
SRC_FILES = $(patsubst %,$(SRC_DIR)/%,$(_SRC_FILES))

.PHONY: compile run-example

compile: $(SRC_FILES) | classes
	$(JAVAC) $(JAVAC_OPTS) $^

run-example: compile
	$(JAVA) $(JAVA_OPTS) fr.n7.sat.SimpleBooleanProblem

classes:
	mkdir -p $@

clean:
	- rm -rf classes *.log **/*~
