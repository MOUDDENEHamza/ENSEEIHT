# Héritage comme spécialisation

##Exercice 1 : Comprendre la classe PointNommé

Le diagramme UML de classes de **PointNomme**

|						 PointNomme      			  	|
---------------------------------------------------------					
|	  				 	Attibuts           				|
| nom 	:   String	  									|
---------------------------------------------------------
|		    		 	 Méthodes		  				|
| getNom()           :   String		  					|
| setNom(sonNom      : in String) 	  					|
| afficher()											|
| dessiner(afficheur : in Afficheur)					|


## Exercice 2 : Comprendre la relation d’héritage entre Point et PointNommé

**2.4.** dans la classe **PointNomme** on utilise l'opérateur super sur la 
classe **Point**, le fait qu'on déclarer la méthode **afficher** ce qui provoque
une erreur lors de la compilation.

**2.5.** On peut calculer la distance entre un point et un point nommé car un 
**PointNomme** hérite de **Point**, alors que entre un point nommé et un point
ne compilte pas parce que distance de PointNomme ne reçoit pas un pointNommé en
paramètre. 

**2.6.** Parce que q est un point et alors il est utilisable par tout les points
qui hérite de **Point**, il affiche la méthode de la classe **Point**, ce 
concept correspond à l'héritage.

## Exercice 3 : Segments et points nommés

**3.1.** Oui, on pourra créer un segment à partir d’un point et d’un point nommé
, il sera affiché comme décrit dans la méthode affcher correspondante à la 
classe **PointNomme**, car **PointNomme** est une classe fille de la classe 
**Point**.
