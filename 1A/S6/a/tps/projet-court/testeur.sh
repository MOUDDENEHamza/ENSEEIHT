# Usage: sh testeur.sh *.run

mainClass=allumettes.Partie
mainFile=`echo $mainClass | tr . /`.java

# Déterminer si l'option -enconding latin1 est nécessaire
javacOpt=
if file -i $mainFile |  grep iso-8859 > /dev/null 2>&1 ; then
    echo "Le fichier est en latin1.  Utilisation de l'option -encoding latin1 de javac"
    javacOpt="-encoding latin1"
fi


if javac $javacOpt $mainFile ; then
    while [ $1 ] ; do
	test="$1"
	shift

	testName=$(basename $test .run)

	if [ "$testName" = "$(basename $test)" ] ; then
	    echo "Test ignoré (le suffixe doit être .run) : $test"
	    continue
	fi


	# Définir les noms de fichiers utilisés
	computed=$testName.computed
	expected=${test%.run}.expected
	diff=$testName.diff

	# Lancer le test
	sh $test > $computed 2>&1

	# Transformer le résultat en utf8 (si nécessaire)
	if file -i $computed | grep iso-8859 > /dev/null 2>&1 ; then
	    echo "Résultat en latin1.  Transformé en utf8."
	    recode latin1..utf8 $computed
	fi

	# Afficher le résultat
	echo -n "$testName : "
	if diff -Bbw $computed $expected > $diff 2>&1 ; then
	    echo "ok"
	else
	    echo "ERREUR"
	    cat $diff
	    echo ""
	fi
    done
else
    echo "Erreur de compilation !"
fi

