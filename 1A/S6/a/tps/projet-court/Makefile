JAVA = java
FLAG = -ea

all :
	make compile -s
	make test -s
	make clean -s

compile :
	javac allumettes/*.java
	javadoc -d doc allumettes/*.java

test :
	sh testeur.sh *.run
	$(JAVA) $(FLAG) allumettes.JoueurTest
	$(JAVA) $(FLAG) allumettes.RobustesseJoueurTest
	$(JAVA) $(FLAG) allumettes.ArbitreTest
	$(JAVA) $(FLAG) allumettes.RobustesseArbitreTest
	$(JAVA) $(FLAG) allumettes.RobustesseGameTest
	$(JAVA) $(FLAG) allumettes.RobustesseProxyTest
	$(JAVA) $(FLAG) allumettes.StrategieExperteTest
	$(JAVA) $(FLAG) allumettes.StrategieRapideTest
	$(JAVA) $(FLAG) allumettes.StrategieLenteTest
	$(JAVA) $(FLAG) allumettes.StrategieNaiveTest

clean :
	rm allumettes/*.class
