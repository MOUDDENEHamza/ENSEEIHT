Parallélisme régulé 
=================================================

Objectifs
---------
- gérer le parallélisme à gros grain
- paralléliser un algorithme par décomposition en sous-tâches
- connaître les services d'exécution de la plateforme Java

 
Prérequis
---------
Vous devez savoir parfaitement comment définir une activité (Thread) en Java, 
comment lancer une activité, et comment attendre sa terminaison.

 ** Si ce n'est pas le cas,
(re)voyez et (re)faites le travail demandé à la rubrique « concurrence et cohérence » avant
d'entamer ce TP**

Vous aurez vraisemblablement besoin lors de ce TP d'utiliser les méthodes de classe suivantes 
de la classe `Thread` :

- `static Thread currentThread()` qui fournit la référence du thread en cours d'exécution
- `static void sleep(long ms) throws InterruptedException` qui suspend le thread 
appelant pour une durée de `ms` millisecondes

Enfin, vous aurez sans doute aussi besoin de deux méthodes de classe de la classe `System` :
`System.nanoTime()` et `System.currentTimeMillis()` qui fournissent une durée écoulée 
(en ns et ms) depuis une date d'origine non spécifiée.  La différence entre les valeurs 
retournées par deux appels successifs permet d'évaluer le temps écoulé entre ces deux appels.

Préparation : services de régulation des activités en Java
-----------
*La rapide présentation qui suit peut être complétée par la lecture de la partie 
correspondante du cours sur les processus légers (planches 34-45) pour les notions et sur la 
[documentation Java en ligne](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/package-summary.html) 
pour la syntaxe et les détails techniques.*

Les classes et notions utilisées jusqu'ici étaient destinées à définir et gérer la concurrence
explicitement, et à un niveau fin : le choix de lancer, d'attendre et de terminer une tâche
appartient entièrement au programmeur. De même, le programmeur a la charge des choix en
termes de gestion de la cohérence (variables `volatile`, classes atomiques...) et du type 
d'attente (blocs `synchronized`, verrous, attente active).

La plateforme Java fournit dans ses dernières versions la classe `Executor`, destinée à
séparer la gestion des activités des aspects purement applicatifs. Le principe est qu'un
objet de la classe `Executor` (« exécuteur ») fournit un *service* de gestion et d'ordonnancement 
d'activités, auquel on soumet des *tâches* à traiter. Une application est donc vue comme
un ensemble de tâches qui sont fournies à l'exécuteur. L'exécuteur gère alors l'exécution 
des tâches qui lui sont soumises de manière indépendante et transparente pour l'application.
L'objectif de ce service est de permettre

- de simplifier la tâche du programmeur, puisqu'il n'a plus à gérer le démarrage des activités,
ni leur ordonnancement
- d'adapter le nombre d'activités exécutées à la charge et au nombre de processeurs 
physiques disponibles

Le paquetage `java.util.concurrent` définit 3 interfaces pour les exécuteurs :

- `Executor`, qui fournit une méthode `execute`, permettant de soumettre une tâche `Runnable`.
- `ExecutorService`, qui étend `Executor`, avec une méthode `submit`, permettant de
 soumettre une tâche `Callable` et renvoyant un objet `Future`, lequel permet de récupérer
 la valeur de retour de la tâche `Callable` soumise. Un `ExecutorService` permet en outre 
 de soumettre des ensembles de tâches `Callable`, et de gérer la terminaison de l'exécuteur.
- `ScheduledExecutorService`, qui étend `ExecutorService` avec des méthodes permettant de 
spécifier l'ordonnancement des tâches soumises.

Le paquetage `java.util.concurrent` fournit différentes implémentations d'exécuteurs. Le
principe commun aux exécuteurs est de distribuer les tâches soumises à un ensemble
d'ouvriers. Chaque ouvrier est un thread cyclique, qui traite une par une les tâches qui
lui sont attribuées.

Les exécuteurs fournis par le paquetage `java.util.concurrent` sont de deux sortes :

### Pools de threads
La classe `java.util.concurrent.Executors` fournit des méthodes permettant de créer des
pools de threads implantant `ExecutorService` avec un nombre d'ouvriers fixe 
-- méthode `newFixedThreadPool` --, variable (adaptable) -- méthode `newCachedThreadPool`) ou 
permettant une régulation par vol de tâches (voir cours) (méthode `newWorkStealingPool`). 
Une variante implantant `ScheduledExecutorService` est proposée pour chacune de ces
 méthodes, afin de permettre d'intervenir sur l'ordonnancement des tâches. Enfin, les classes
`java.util.concurrent.ThreadPoolExecutor` et `java.util.concurrent.ScheduledThreadPoolExecutor`
 proposent encore davantage d'options sur la paramétrage et la supervision de l'ordonnancement.
 
Les pools de threads évitent la création de nouveaux threads pour chaque tâche à traiter,
puisque qu'un même ouvrier est réutilisé pour traiter une suite de tâches, ce qui présente
plusieurs avantages :

- éviter la création de threads apporte un gain (significatif lorsque les tâches sont nombreuses)
 en termes de  consommation de ressources mémoire et processeur,
- le délai de prise en charge des requêtes est réduit du temps de la création du traitant
de la requête,
- enfin, et surtout, le contrôle du nombre d'ouvriers va permettre de réguler et d'adapter
l'exécution en fonction des ressources matérielles disponibles, au lieu d'avoir une exécution
directement dépendante du flux de tâches à traiter. Ainsi, dans le cas d'un flux de tâches
augmentant brutalement (comme dans le cas d'une attaque par déni de service), les performances
se dégraderont progressivement (car le délai de prise en charge augmentera proportionnellement
au nombre de tâches en attente), mais il n'y aura pas d'écroulement dû à un épuisement des
ressources nécessaires.

D'une manière générale, 

- Le choix ou l'adaptation du nombre d'ouvriers en fonction du nombre de processeurs
effectivement disponibles et de la charge courante est un élément clé de la
 parallélisation avec un pool de threads : trop peu nombreux, les ouvriers ne pourront
 exploiter tous les processeurs ; trop nombreux, il mobiliseront des ressources inutilement
 et auront un impact négatif sur les performances.
 	- *Note : l'appel de la méthode `Runtime.getRuntime().availableProcessors()` fournit le
 	nombre de processeurs disponibles pour la JVM courante.*
- Les pools de threads sont bien adaptés au traitement de problèmes
 réguliers, c'est à dire aux problèmes décomposables en sous-problèmes de « taille »
équivalente, ce qui garantit une bonne répartition des tâches entre ouvriers.

##### Classes et méthodes utiles
- la classe `java.util.concurrent.Executors`, permet de créer des pools de threads par 
appel de `newFixedThreadPool()` ou `newCachedThreadPool()` (cf supra)
- la classe `ExecutorService` et sa superclasse `Executor`, définissent l'interface 
d'un exécuteur, avec notamment les méthodes `submit()`, `execute()` (cf supra) et 
`shutdown()` (gestion de la terminaison de l'exécuteur)
- la classe `Future` fournit (immédiatement) une référence vers le résultat (à venir)
d'une tâche `Callable`soumise à l'exécuteur par `submit()`. L'appel de la méthode `get()`
permet d'obtenir le résultat effectif, en attendant s'il n'est pas encore disponible.
- les tâches ne renvoyant pas de résultat sont des `Runnable`, soumises à l'exécuteur par
 `execute()`.

##### Un exemple
	import java.util.concurrent.Future;
	import java.util.concurrent.Callable;
	import java.util.concurrent.Executors;
	import java.util.concurrent.ExecutorService;

	class SigmaC implements Callable<Long> {
		private long début;
		private long fin;
	
		SigmaC(long d, long f) { début = d; fin = f;}
	
		@Override
		public	Long call() { // le résultat doit être un objet
			long s = 0;
			for (long i = début; i <= fin; i++) s = s + i;
			return s;
		}                
	}

	class SigmaR implements Runnable {
		private long début;
		private long fin;
	
		SigmaR(long d, long f) { début = d; fin = f;}
	
		@Override
		public	void run() {
			long s = 0;
			for (long i = début; i <= fin; i++) s = s + i;
			System.out.println("Calcul terminé. ∑("+début+","+fin+") = "+s);
		}                
	}

	public class Somme {     
		public static void main(String[] args) throws Exception {
		
			ExecutorService poule = Executors.newFixedThreadPool(2);
		       
			Future<Long> f1 = poule.submit(new SigmaC(0L,1_000_000_000L));
			Future<Long> f2 = poule.submit(new SigmaC(0L,4_000_000_000L));
			poule.execute(new SigmaR(900_000L,1_000_000_000L));
			Future<Long> f3 = poule.submit(new SigmaC(1,100));
			Future<Long> f4 = poule.submit(new SigmaC(0L,3_000_000_000L));
		
			poule.shutdown();
		
			System.out.println("Résultat obtenu. f1 = "+f1.get());
			System.out.println("Résultat obtenu. f2 = "+f2.get());        
			System.out.println("Résultat obtenu. f3 = "+f3.get());        
			System.out.println("Résultat obtenu. f4 = "+f4.get());
		}    
	}
	
##### Commentaires
- L'application crée un pool avec un nombre fixe d'ouvriers (2), puis lance 5 tâches : les
 deux premières et les deux dernières soumises (`Callable` , soumises par appel à `submit()`) 
rendent un résultat `Future`, récupéré de manière bloquante par l'appel à la 
méthode `get()`. La troisième (`Runnable`, soumise par appel à `execute()`) s'exécute de 
manière asynchrone.
- L'exécution voit la tâche `Runnable` terminer après la première soumise (`f1`), 
car bien que plus courte, elle ne peut démarrer tant que l'une des deux premières tâches lancées
n'est pas terminée, la taille du pool étant de 2. L'appel `f2.get()` entraîne l'attente de 
la terminaison de `f2`, plus longue que `f1`et la tâche `Runnable` cumulées. L'appel de 
`f3.get()` retourne immédiatement, car `f3`, courte est déjà terminé. L'appel `f4.get()` 
entraîne l'attente de la terminaison de `f4`. 
- `shutdown` permet de terminer proprement l'exécuteur, qui dès lors n'accepte plus de 
nouvelles tâches. L'application Java termine avec la dernière tâche traitée. Si `shutdown` 
est omis, l'application ne peut terminer, car les threads de l'exécuteur restent 
en attente de nouvelles tâches.
- L'archive contient une variante (`SommePlus`) de l'application `Somme`, qui illustre
 l'utilisation de :
	* `invokeAll()` sur une collection de tâches/actions pour soumettre une collection 
	(ici une liste) de `Callable`. Les résultats sont alors rendus dans une liste de `Future`;
	* `get()` sur les `Future` de cette liste, pour récupérer les résultats effectifs

### Pool Fork/Join (Schéma Map/Reduce)
La classe `ForkJoinPool` est un exécuteur dont l'ordonnancement est adapté à une 
parallélisation selon le schéma *fork/join* (voir cours, planches 43-45). 
Le principe (récursif) est

- de traiter directement (séquentiellement) un problème si sa taille est suffisamment petite
- sinon, de diviser le problème en sous-problèmes, qui seront traités en parallèle (`fork`)
et dont les résultats seront attendus (`join`) et agrégés.

Ce schéma de programmation permet de créer dynamiquement un nombre de tâches adapté à la
taille de chacun des (sous)-problèmes rencontrés, chacune des tâches créées représentant
une charge de travail équivalente. Ce schéma est donc bien adapté au traitement de problèmes
irréguliers, de grande taille. L'ordonnanceur de la classe `ForkJoinPool` comporte en outre
une régulation (vol de tâches) qui permet l'adaptation de l'exécution aux capacités de calcul
disponibles.

Il est important de noter que ce schéma repose sur le fait que les sous-tâches créées 
s'exécutent en parallèle, et donc sur l'hypothèse qu'elles sont complètement indépendantes.
Tout conflit d'accès aux ressources, ou synchronisation compromet l'efficacité de ce schéma.
**Le schéma Fork/Join est donc idéalement et principalement destiné aux calculs intensifs,
 irréguliers, en mémoire pure (sans E/S)**. Avec ce schéma, les interactions et synchronisations
 entre tâches sont alors limitées  aux interactions entre une tâche mère et ses tâches 
 filles, lorsque celles-ci ont terminé, et que la tâche mêre récupère les résultats des 
 tâches filles pour les agréger.
 
##### Classes et méthodes utiles
- `ForkJoinPool`: classe définissant l'exécuteur. Une instance de `ForkJoinPool` doit être
 créée une fois et une seule pour toute la durée de  l'application (ce n'est pas 
 obligatoire, mais c'est vivement conseillé, même pour les experts).
- `RecursiveTask<V>` : définit une tâche soumise à l'exécuteur, fournissant un résultat
- `RecursiveAction` : définit une tâche soumise à l'exécuteur, ne fournissant pas de résultat
- `ForkJoinTask<V>` : superclasse de RecursiveTask<V> and RecursiveAction, définissant la
plupart des méthodes utiles, comme `fork()` et `join()`.

##### Un exemple
(fourni également dans l'archive jointe) réalise le schéma fork/join et illustre
 l'utilisation des principales classes et méthodes dans ce cadre. Dans cette application,
 les données à traiter sont représentées par un simple entier, qui symbolise leur volume.

    import java.util.concurrent.RecursiveTask;
    import java.util.concurrent.ForkJoinPool;

    class TraiterProblème extends RecursiveTask<Integer> {

     private int resteAFaire = 0;
     private int résultat = 0;
     static final int SEUIL = 10;

     TraiterProblème(int resteAFaire) {
        this.resteAFaire = resteAFaire;
    }

     protected Integer compute() {

        //si la tâche est trop grosse, on la décompose en 2
        if(this.resteAFaire > SEUIL) {
            System.out.println("Décomposition de resteAFaire : " + this.resteAFaire);

            TraiterProblème sp1 = new TraiterProblème(this.resteAFaire / 2);
            TraiterProblème sp2 = new TraiterProblème(this.resteAFaire / 2);

            sp1.fork();
            sp2.fork();

            résultat = sp1.join()+ sp2.join();

            return résultat;

        } else {
            System.out.println("Traitement direct de resteAFaire : " + this.resteAFaire);
            return resteAFaire * 3;
        }
     }
    }

    public class FJG {
     static ForkJoinPool fjp = new ForkJoinPool();
     static final int TAILLE = 1024; //Attention : nécessairement une puissance de 2

     public static void main(String[] args) throws Exception {
        TraiterProblème monProblème = new TraiterProblème(TAILLE);
        int résultat = fjp.invoke(monProblème);
        System.out.println("Résultat final = " + résultat);
     }
    }

##### Commentaires
- la méthode abstraite `compute()` définie dans `RecursiveTask` et `RecursiveAction`
contient le code du calcul récursif proprement dit. C'est l'analogue de la méthode `run()` 
pour la classe `Runnnable` ou de la méthode `call()` pour la classe `Callable`.
- `SEUIL` est la taille de problème à partir duquel le travail n'est plus subdivisé. Ainsi
qu'indiqué précédemment sa valeur est un compromis, dépendant de la nature du problème. Une
règle empirique est que le nombre de sous-tâches créées devrait être compris entre 100 et
 10 000. Il faut aussi savoir que le pool ne peut comporter plus de 32K ouvriers.
- le `ForkJoinPool` doit être créé une fois et une seule pour toute la durée de 
l'application (ce n'est pas obligatoire, mais c'est conseillé, même pour les experts).
La méthode employée ici pour créer ce pool est celle nécessaire en Java 6 et 7.
A partir de Java 8, cette création est inutile, car la classe `ForkJoinPool` dispose d'un
d'un pool par défaut (attribut de classe), dont la référence peut être obtenue par appel
de la méthode de classe `ForkJoinPool.commonPool()`.  L'archive contient 
une variante (`FJGPlus`) de l'application `FJG`, qui utilise cette facilité.
- l'appel `fjp.invoke(monProblème);` permet de soumettre la tâche racine au pool.

##### Quelques écueils
- l'implémentation actuelle de `ForkJoinPool` est d'autant moins efficace que les tâches
sont nombreuses. Ainsi, l'implémentation suivante de la branche `if` de la méthode `compute`
précédente aurait été sensiblement plus efficace (mais moins naturelle) :

         if(this.resteAFaire > SEUIL) {
            System.out.println("Décomposition de resteAFaire : " + this.resteAFaire);

            TraiterProblème sp1 = new TraiterProblème(this.resteAFaire / 2);
            TraiterProblème sp2 = new TraiterProblème(this.resteAFaire / 2);
            sp1.fork();
            résultat = sp2.compute();
			résultat = sp1.join()+résultat
            return résultat;
        }

- il ne faut pas oublier que `join()` est bloquant. Ainsi l'échange des appels à `join()` et
`compute()` dans la variante précédente aurait pour effet d'aboutir à un programme séquentiel...
 
Exercices
---------
Vous aurez vraisemblablement besoin pour cette partie de deux méthodes de classe de la classe `System` :
`System.nanoTime()` et `System.currentTimeMillis()` qui fournissent une durée écoulée 
(en ns et ms) depuis une date d'origine non spécifiée.  La différence entre les valeurs 
retournées par deux appels successifs permet d'évaluer le temps écoulé entre ces deux appels.

L'archive fournie propose différents exercices.  
Chaque exercice comporte un calcul
séquentiel (itératif ou récursif), qu'il faut paralléliser en utilisant un pool fixe et/ou
un pool Fork/Join.  
Chaque exercice comporte une méthode main permettant de lancer et
comparer les différentes versions. Des commentaires `// ********* A compléter` ou 
`// ********* A corriger` signalent les (seuls) endroits du code où vous devez intervenir
pour implanter les versions parallèles du calcul séquentiel fourni.

Les exercices utilisent des tableaux d'entiers stockés sur disque.  
L'archive fournie comporte une application GCVT.java qui propose une classe
 `TableauxDisque` permettant de générer, charger
en mémoire, sauvegarder ou comparer de tels tableaux.  
La méthode `main`de l'application 
GCVT.java permet en outre d'appeler les méthodes de la classe `TableauxDisque` depuis
la console.  
*Cette application pourra en particulier être utilisée pour générer les jeux de
données utiles aux tests.* En effet, pour que le gain apporté par les versions parallèles
soit sensible, il est nécessaire que les volumes de données traités soient significatifs,
ce qui implique ici de travailler (pour l'évaluation de performances) sur des tableaux
de 1 à 100 millions d'entrées, ce qui aurait alourdi inutilement l'archive. Vous devrez donc
générer vos jeux de données avec cette application, *sans oublier de supprimer les fichiers
créés une fois le TP passé*, sans quoi vous risquez d'épuiser votre quota d'espace disque :)

Les exercices peuvent être traités dans l'ordre suivant :

- Calcul du maximum d'un tableau (répertoire `max`). Le calcul d'un opérateur associatif
et commutatif sur un ensemble de données est une application canonique de la parallélisation.
Cet exercice permet de mettre simplement et directement en pratique les deux schémas
(pool fixe et map/reduce) présentés dans l'énoncé.
	* Le calcul séquentiel à paralléliser est une itération. A votre avis, quel sera
	le schéma de parallélisation le plus naturel ? le plus efficace ?
	* Notez que le calcul étant très simple, il est important pour évaluer les performances
	de cet exercice de travailler avec un grand tableau.
	* Comparer les deux versions (pool fixe et Fork/join) avec la version séquentielle.
	Les mesures confirment-elles vos a priori ? Commentez.
- Tri d'un tableau selon le schéma tri-fusion (répertoire `tri fusion`). Même s'il est régulier, 
le schéma récursif le prête parfaitement à l'utilisation du schéma map/reduce, et d'autant
 mieux qu'il est  organisé en 2 phases (tri, puis fusion).
	* Paralléliser l'algorithme récursif proposé en utilisant les deux schémas (pool fixe 
	et Fork/Join)
	* Comparer ces deux versions avec la version séquentielle, en termes de facilité de 
	conception, et de performances. Pour cet exercice, un tableau d'un million d'entrées
	devrait suffire.
- **Pour aller plus loin** (non demandé pour ce TP), l'application de comptage de mots dans un répertoire 
(répertoire `comptage des mots d'un répertoire`) réalise la commande 
	`find repertoire -exec grep mot {}\;` 
Elle permet d'illustrer la parallélisation d'un problème irrégulier. 
	* Paralléliser l'algorithme récursif proposé en utilisant le schéma fork/join
	* Comparer cette version avec la version séquentielle, en termes de facilité de 
	conception, et de performances. Pour le test, on pourra prendre un répertoire contenant 
	des fichiers sources, et rechercher un mot clé du langage.

### Rappel
 Selon votre configuration, il est possible que le format par défaut pour les fichiers 
 sources Java soit le format ASCII. Dans ce cas, des erreurs apparaitront lors de la
  compilation des fichiers de l'archive, qui sont codés en UTF8.
  
  Pour remédier à cela, il est possible de positionner la variable d'environnement
`JAVA_TOOL_OPTIONS` (en bash : `export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8`), 

  ou encore de lancer la compilation avec l'option `-encoding UTF8`, ce qui donne ici :
        
        javac -encoding UTF8 *.java


Tester les performances d'applications concurrentes en Java : quelques remarques pratiques
-------------

- sources de perturbation : cache, compilateur à la volée, ramasse miettes et optimiseur, 
charge de l'environnement (matériel, réseau)
-> répéter les mesures et retenir la meilleure
- tester sur des volumes de données significatifs
- connaître le nombre de processeurs réels disponibles
- éviter les optimisations sauvages
	- avoir des tâches suffisamment complexes  
	- avoir un jeu de données varié (non constant en valeur et dans le temps)
- arrêter la décomposition en sous tâches à un seuil raisonnable