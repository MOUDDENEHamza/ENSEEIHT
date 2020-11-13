# Patron de conception : le visiteur

## Exercice 1 : Modélisation d’expressions arithmétiques

Soit G la grammaire des expressions arithmétiques suivante :

<ol>
	<li> E → E + E </li>
	<li> E → E * E </li>
	<li> E → - E </li>
	<li> E → ident </li>
	<li> E → constante </li>
</ol>

**1.1.** Donner quelques exemples d’expressions.

<ul>
	<li>1</li>
	<li>4</li>
	<li>3 + -2</li>
	<li>-3 + 2 * x</li>
<ul>

**1.2.** Proposer un diagramme de classe permettant de représenter une expression quelconque correspondant à cette grammaire.<br>

**1.3.** Dessiner un ou plusieurs diagrammes d’objet qui correspondent à l’expression 3 + x * y.<br>

## Exercice 2 : Exploitation du modèle objet des expressions

Intéressons nous à quelques exploitations des expressions ainsi modélisées.

**2.1.** Affichage classique (infixe). Nous souhaitons réaliser une opération d’affichage d’une expression correspondant au diagramme de classe précédent.<br>

**2.1.1.** Compléter le diagramme de classe.<br>

**2.1.2.** Utiliser un diagramme de séquence pour expliquer comment afficher l’expression de la question 1.3.<br>

**2.1.3.** Indiquer comment faire pour afficher l’expression en notation préfixe (polonaise) d’une part, et en notation postfixe (polonaise inverse)
d’autre part.<br>

**2.2.** Valeur d’une expression. Indiquer, en complétant le diagramme de classe, comment calculer la valeur d’une expression. On suppose que les valeurs des variables sont disponibles dans un environnement qui associe à chaque variable sa valeur.<br>

**2.3.** Critique de l’approche choisie. Maintenant que nous avons réalisé plusieurs traitements sur les activités, essayons de prendre du recul.<br>

**2.3.1.** Expliquer comment définir un nouveau traitement sur les expressions. Le traitement pourrait être calculer le nombre d’opérateurs d’un expression, calculer le nombre de variables utilisées, simplifier une expression, etc.<br>

**2.3.2.** Lister les critiques que l’on peut faire concernant l’approche suivie.<br>

## Exercice 3 : Le patron Visiteur

Proposer une nouvelle manière de définir un traitement. Cette solution doit répondre aux problèmes identifiés dans l’exercice précédent. Lister les
inconvénients de cette nouvelle approche.<br>
