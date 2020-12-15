JAVAFILES= $(wildcard *.java) $(wildcard tm/*.java) $(wildcard simulation/*.java)
CLASSFILES= $(wildcard *.class) $(wildcard tm/*.class) $(wildcard simulation/*.class)

all: $(JAVAFILES)
	javac -encoding UTF8 $(JAVAFILES)

shell:
	java -Dfile.encoding=UTF8 Simulator

simu:
	java -Dfile.encoding=UTF8 Simulator $(SCEN)

clean:
	rm -f $(CLASSFILES)

.PHONY: all run clean
