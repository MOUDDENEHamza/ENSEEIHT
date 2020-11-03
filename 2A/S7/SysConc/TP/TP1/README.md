Concurrence et cohérence
========================

Objectifs
---------
- évaluer le gain, le coût et le contexte approprié à la mise en œuvre multi-activités 
d'un traitement
- mettre en évidence les problèmes de cohérence induits par
	* l'exécution d'activités concurrentes
	* les mécanismes d'optimisation matériels (caches, pipelines) et logiciels 
	(réordonnancement des instructions)
	 
Préparation
-----------
Cette partie présente quelques constructions et outils disponibles sur la plateforme Java, 
en se limitant aux éléments nécessaires à la réalisation des exercices.

###Les activités (threads) Java
La brève présentation qui suit peut être illustrée et  par la lecture de la partie 
correspondante du cours sur les processus légers (6ème partie, planches 10-13). Les planches
suivantes et la documentation présentent plus de détails, leur lecture n'est 
pas nécessaire dans l'immédiat.

- la classe **`Thread`**, intégrée au langage (paquetage `java.lang`), permet de *définir*
un processus (léger), ou thread au sein d'une application Java (JVM)
- la classe Thread fournit (en particulier)
	* une méthode **`start`** qui permet de *lancer* l'instance de thread auquel elle est appliquée
	* une méthode **`join`** (`void join() throws InterruptedException`),
	 qui permet d'attendre la terminaison l'instance de thread auquel elle est appliquée
	* une méthode de classe, `static Thread currentThread()` qui fournit la référence du 
	thread en cours d'exécution
	* une méthode de classe, `static void sleep(long ms) throws InterruptedException` qui
	suspend le thread appelant pour une durée de `ms` millisecondes
- le constructeur de la classe `Thread` prend un paramètre d'une classe implémentant
l'interface **`Runnable`**. Cette interface expose une méthode **`public void run()`**. 
La méthode `run()` définit le code qui sera exécuté par le thread correspondant.

**Les planches 10 et 11 fournissent des exemples simples du schéma standard de création de threads**

###Le modèle de cohérence Java
Par défaut, Java n'offre pas de garantie de cohérence pour les variables partagées,
 utilisées simultanément par un ensemble de threads. En particulier, les instructions 
 sont susceptibles d'être réordonnées, et la cohérence des caches n'est pas assurée.
 
 Cependant Java offre quelques outils de base pour faciliter la programmation 
 multiactivités avec des variables partagées :
 
 - le mot-clé **`volatile`** associé à un attribut élémentaire ou une référence
garantit que (tout se passe comme si) les accès à cet attribut ne sont pas effectués dans le cache, mais
 directement en mémoire, ce qui permet de considérer que les accès concurrents ont été 
 effectués en suivant un ordre total global. En outre, l'accès à des variables `volatile` inhibe le réordonnancement
   des instructions  
 - le paquetage ` java.util.concurrent.atomic` propose un ensemble de classes « atomiques »,
qui fournissent un ensemble de méthodes dont l'exécution est garantie sans interférences.
La différence avec des méthodes `synchronized` (vues tout de suite après) est que 
l'absence d'interférences est obtenue sans qu'il y ait à faire attendre (bloquer) des
activités en conflit. L'algorithmique de la mise en œuvre de tels objets est abordée dans 
la dernière partie du cours. La documentation Java en ligne fournit le détail de ces classes
et de leur interface.

###Les verrous Java
Historiquement, il s'agit du premier outil de synchronisation proposé en Java, disponible
dès les premières versions du langage. Le service rendu, très élémentaire, s'avère pratique
et adapté pour exprimer l'exclusion mutuelle, ce qui fait qu'il reste largement utilisé,
même actuellement, car la simple exclusion mutuelle représente le schéma de synchronisation
le plus souvent rencontré. En revanche, il se révèle lourd et malcommode dès qu'il
s'agit de réaliser des schémas un peu plus évolués que l'exclusion mutuelle. D'où les objets
de synchronisation plus classiques et robustes apparus à partir de la version 5 de Java.

La rapide présentation qui suit porte essentiellement sur la syntaxe. Elle peut être 
complétée par la lecture de la partie correspondante du cours sur les processus légers 
(planches 36-40) pour les notions et sur la documentation Java en ligne pour les détails
techniques.

#### Principe
**Tout objet** Java peut être utilisé comme un verrou pour contrôler l'accès à une section
 critique.
      
#### Syntaxe
* Le mot-clé **`synchronized`** permet de définir très simplement une section critique
 contrôlée par (le verrou d')un objet `unObj`, avec la syntaxe suivante
 **`synchronized`** `(unObj) {
 		section critique
 	}`
 	
* Le mot-clé **`synchronized`** peut aussi être utilisé pour qualifier une méthode. Il indique
alors que la méthode sera exécutée en exclusion mutuelle, et que (le verrou de l'instance 
de) l'objet fournissant cette méthode est utilisé pour contrôler cette exclusion mutuelle.

* Enfin, il est possible de qualifier des méthodes de classe (statiques) comme **`synchronized`**.
Dans ce cas, le verrou est associé à la classe, non à ses instances.

###Autres classes, méthodes et remarques utiles
- la classe `System` fournit deux méthodes, `System.nanoTime()` et `System.currentTimeMillis()` qui fournissent une durée écoulée (en ns et ms) depuis une date d'origine non spécifiée. La différence entre les valeurs retournées par deux appels successifs permet d'évaluer le temps écoulé entre ces deux appels.
- Le constructeur de la classe `Thread` peut prendre un paramètre de classe `String`, 
qui permet de donner un nom à l'instance de Thread créée. Le nom peut être accédé via les
méthodes `getName()` et `setName()`
- Selon votre configuration, il est possible que le format par défaut 
        pour les fichiers source Java soit le format ASCII. Dans ce cas, des erreurs 
        apparaitront lors de la compilation des fichiers de l'archive, qui sont codés en UTF8.
        Pour remédier à cela, il est possible de positionner la variable d'environnement
         JAVA\_TOOL_OPTIONS (en bash : `export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8`), 
         ou encore de lancer la compilation avec l'option `-encoding UTF8`, ce qui donne ici :
        
        javac -encoding UTF8 *.java
- l'interpréteur Java (commande `java`) founit deux options qui ne seront pas forcément nécessaires
ici, mais qui peuvent être utiles dans un contexte d'évaluation de performances :
   * `-Xint` force le passage en mode interprété pur (pas de compilation à la volée, ni 
   par conséquent d'optimisation)
   * `-Xprof` fournit des statistiques sur les temps d'exécution des threads.
   
Exercices
---------
### Efficacité de la parallélisation
Il s'agit d'évaluer le gain de temps apporté par la décomposition d'un traitement 
en plusieurs threads.
On considère le traitement réalisé par la classe `IncrMes` fournie dans l'archive, qui 
consiste en une boucle qui incrémente un compteur global. Le nombre important d'itérations 
est destiné à permettre des mesures significatives, mais va nécessiter l'emploi d'entiers
longs.

Comparer le temps d'exécution de l'itération totale avec le temps d'exécution d'une 
application où N threads effectuent chacun 1/N ème de l'itération, N étant un paramètre
fourni au lancement de l'application. 

- Quel résultat « idéal » peut-on a priori espérer ?
- Mesurer le temps d'exécution réel, en fonction de N (en faisant varier N entre 1 et 50, 
 sans nécessairement prendre toutes les valeurs :) )

    * Expliquez les différences observées entre le temps mesuré et le temps attendu.
    * Evaluer le surcoût induit par la gestion des threads, au moins en principe 
  (Il est possible que cette valeur soit trop faible pour être mesurée ainsi, les différents
  mécanismes d'optimisation au niveau du matériel ou du compilateur et le contexte d'exécution
  nuisant à la précision des mesures, cf remarque finale)
  
### Coût de la cohérence
Vérifier la correction des résultats obtenus par l'application précédente. Pour cela,
 chaque thread affichera la valeur du compteur avant de démarrer sa (fraction de) boucle,
 ainsi que la valeur du compteur après.
 
- Quelles seront *a priori* les valeurs affichées dans le cas où il n'y a pas préemption 
 du processeur entre threads ?
- Quelles seront *a priori* les valeurs affichées dans le cas où la gestion des activités
 partage le temps processeur par quantum de temps entre threads ?
- Quelle est la politique effectivement suivie par la JVM utilisée pour le test ?
- La valeur finale du compteur devrait être égale au nombre total d'itérations. Vérifier
 que ce n'est pas le cas avec la version actuelle, et expliquer pourquoi.
- Afin de garantir la cohérence du résultat final, on effectue les incrémentations du
 compteur en exclusion mutuelle, en plaçant l'incrémentation dans un bloc `synchronized`,
 associé à un objet global quelconque. (Déclarer par exemple un attribut 
 `static Object mutex = new Object();` dans la classe principale). Vérifier que le résultat
 est maintenant effectivement correct, et évaluer le coût de l'utilisation de ce mécanisme.
 
    * en plaçant uniquement l'incrémentation de la boucle interne dans le bloc `synchronized` 
    * en plaçant la boucle interne dans le bloc `synchronized` 
- La correction du résultat est-elle garantie a priori si l'on utilise un objet de la classe
 `java.util.concurrent.atomic.AtomicLong` pour le compteur ? Argumenter, puis vérifier 
 cet a priori. Evaluer le coût de l'utilisation de ce mécanisme
 - La correction du résultat est-elle garantie a priori si l'on déclare le compteur
 comme  `volatile` ? Argumenter, puis vérifier cet a priori. Evaluer le coût de 
 l'utilisation de ce mécanisme.
 - Conclure globalement sur les conditions d'utilisation (ou pas) de ces différents mécanismes.
 
### Schéma producteurs consommateurs
La classe PCA fournie dans l'archive est une implémentation du schéma 
producteur/consommateur, pour un unique producteur et un unique consommateur. L'algorithme
semble correct, et pourtant... le test montre un comportement incorrect. Expliquez et rectifiez le code en conséquence.

Tester les performances d'applications concurrentes en Java : quelques remarques pratiques
-------------

- sources de perturbation : cache, compilateur à la volée, ramasse miettes et optimiseur, 
charge de l'environnement (matériel, réseau)
-> répéter les mesures et écarter les valeurs extrêmes (en général, les premières mesures). 
L'application fournie répète les mesures 10 fois par défaut, ce qui est un paramètre 
raisonnable (qui peut éventuellement être un peu réduit).
- tester sur des volumes de données significatifs
- connaître le nombre de processeurs réels disponibles