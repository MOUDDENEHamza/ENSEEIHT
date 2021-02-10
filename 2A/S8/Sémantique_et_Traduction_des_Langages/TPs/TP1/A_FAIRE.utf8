 TP de sémantique et TDL #1
 ==========================
Le but de ce TP est d'apprendre à écrire un interpréteur (sémantique dynamique)
pour un langage à partir de l'arbre abstrait des programmes.

Le principe de cet interpréteur et les structures de données associées
ont été présenté en cours. Les règles de la sémantique dynamique qui
décrivent l'exécution ont été présentées en cours et en TD.

L'objectif du TP est d'implanter ces règles en exploitant les
structures de données proposées.

L'arbre abstrait est décrit par le type ast dans le fichier Ast.ml.

Vous testerez votre implantation au niveau de chaque étape.

Un fichier dune est fourni pour compiler et exécuter les tests. Vous utiliserez donc la commande habituelle :

dune runtest

A/ Exécution des expressions arithmétiques

Il s'agit des constructeurs : BinaryNode, UnaryNode, IntegerNode, TrueNode, FalseNode de l'arbre 
abstrait.

B/ Exécution des conditionnelles et définitions de variables

Il s'agit des constructeurs : IfthenelseNode, LetNode de l'arbre abstrait.

C/ Exécution des définitions et appel par valeur de fonctions

Il s'agit des constructeurs : FunctionNode, CallNode de l'arbre abstrait.

La valeur des paramètres doit être calculée avant l'appel de la fonction
(appel par valeur). 

Implanter la sémantique de l'appel par valeur.

D/ Exécution des définitions récursives

Il s'agit des constructeurs : LetrecNode et AccessNode de l'arbre abstrait.

E/ Appel par nom de fonctions

Une deuxième sémantique est possible pour les appels de fonctions (respectivement, les definitions
de variables), l'appel par nom : le calcul du paramètre de la fonction (respectivement, de la valeur
de la variable) est suspendu (constructeur de valeur FrozenValue) et l'appel de la fonction (respectivement,
le corps de la définition) est exécuté. La valeur du paramètre (respectivement, de la variable)
sera calculée lors de l'accès au paramètre (respectivement, à la variable).

Implanter la sémantique de l'appel par nom.

F/ Appel paresseux de fonctions

Lors d'un appel par nom, la valeur du paramètre (respectivement, de la valeur de la variable) est calculée à chaque
fois que la fonction utilise le paramètre (respectivement, le corps utilise la variable). L'appel paresseux consiste
à partager le résultat de cette évaluation. Proposer une solution pour implanter l'appel paresseux.
