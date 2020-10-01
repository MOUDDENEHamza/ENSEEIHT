Exclusion mutuelle et synchronisation élémentaire
=================================================

Objectifs
---------
- réfléchir sur les protocoles de base de gestion de la cohérence par exclusion mutuelle
- première approche de la synchronisation de processus au travers de l'utilisation d'un 
mécanisme élémentaire de verrouillage/déverrouillage
 
Préparation
-----------
###Les verrous Java (complément)

**Au sein d'un bloc `synchronized`** contrôlé par un objet `unObj`, il est possible de 
réaliser une synchronisation élémentaire au moyen des deux méthodes suivantes, fournies par
tout objet :

- `unObj.wait()` libère l’accès exclusif à `unObj` et bloque l’activité appelante 
	en attente d’un réveil via une opération
- `unObj.notify()` ou `unObj.notifyAll()` qui réveille une (ou toutes les) activité(s)
	bloquées sur `unObj.wait()` 
- Remarques
	1. les activités réveillées par `notify` sont mises en attente du verrou et ne poursuivent
	effectivement qu'une fois celui-ci obtenu
	2. une activité en bloquée sur `wait` *peut* être réveillée spontanément... 
			Il est  donc conseillé que l'attente soit gardée par une condition logique, et que cette
	condition logique soit évaluée dans une boucle `while`, selon le schéma suivant :	
        `synchronized (obj) {	
			while ( condition invalide ) { unObjbj.wait(); }        
			<opérations à réaliser une fois la condition vérifiée >
         }` 


Exercices
---------

**Note** : Pour les besoins de ce TP, _la synchronisation des exercices qui suivent
 doit être traitée en utilisant des **verrous**, à l'exclusion de tout autre outil
  (sémaphores, moniteurs...)_.  (Ces outils conviendraient, mais ce n'est pas l'objet de ces exercices.)

### Exclusion mutuelle
1. La classe `Peterson` fournie dans l'archive propose une implémentation du protocole 
d'exclusion mutuelle de Peterson vu en cours. Vérifiez et complétez éventuellement cette
implémentation.

2. L'ordre des deux premières affectations de la méthode entrer() (lignes 29 et 30 : 
`Peterson.demande[id] = true;` et `Peterson.tour = di ;`) est-il important ? Pourquoi ?


3. La classe `java.util.concurrent.atomic.AtomicBoolean` propose une implantation 
logicielle de primitives de type TestAndSet, CompareAndSwap...
	- Utiliser l'une de ces primitives pour réaliser un protocole d'exclusion mutuelle pour N
processus.
	- Réaliser une version vivace du protocole, garantissant que toute demande d'entrée 
	en section critique finira par être servie.
	- Comparer les performances des deux versions, entre elles et par rapport à une 
	version utilisant un bloc `synchronized` pour assurer l'exclusion mutuelle.
	- Comparer, pour 2 processus, ces versions à une version utilisant le protocole de Peterson
	
### Schéma producteurs consommateurs
4. Compléter la classe `TamponBorné` fournie, qui ne comporte aucune synchronisation, afin de 
gérer convenablement les accès concurrents.

- seules les méthodes `déposer` et `retirer` de la classe `TamponBorné` sont à modifier. Les
parties du code où l'on suggère d'intervenir sont signalées par un commentaire `//*** A compléter`
- le test intégré à l'application est conçu pour vérifier le comportement attendu suivant :

	* initialement, les consommateurs doivent attendre, car le tampon est vide
	* les consommateurs retirent des entiers différents, dans l'ordre croissant, 
		sans trous dans la numérotation
	* progressivement, de plus en plus de producteurs doivent attendre
	
Vous pouvez commencer par exécuter le code fourni sans synchronisation, et constater qu'il 
ne produit pas vraiment le comportement attendu...