Problème des philosophes
========================

Énoncé
------

N philosophes sont autour d'une table. Il y a une assiette par philosophe,
et *une* fourchette entre chaque assiette. Pour manger, un philosophe
doit utiliser les deux fourchettes adjacentes à son assiette (et celles-là
seulement).

Un philosophe peut être dans l'état :

- penseur : il n'utilise pas de fourchettes ;
- mangeur : il utilise les deux fourchettes adjacentes ; aucun de ses
  voisins ne peut manger ;
- demandeur : il souhaite manger mais ne dispose pas des deux fourchettes.

Visuellement les états mangeur/demandeur/penseur sont représentés par un
rond noir (ou rouge en cas de possible problème)/un rond blanc/rien.

Code fourni
-----------
- `StrategiePhilo.java` : interface de la synchronisation entre philosophes.
- `PhiloSem.java` : une implantation de cette interface.
- `ProcessusPhilosophe.java` : code d'un philosophe.
- `Main.java` : programme principal.
  Définit aussi les `PhiloDroite(i)`, `PhiloGauche(i)`, `FourchetteGauche(i)`,
  `FourchetteDroite(i)`.
- `EtatFourchette.java` : définition des constantes pour fourchette placée
  sur la table, l'assiette gauche, l'assiette droite.
- `EtatPhilosophe.java` : définition des constantes pour philosophe penseur,
  demandeur ou mangeur.
- `IHM*.java` : interface utilisateur.
- `Synchro/Simulateur.java` : le simulateur de temps.

- Compilation:  
        `javac *.java Synchro/*.java`  
         **Note** :  selon votre configuration, il est possible que le format par défaut 
        pour les fichiers source Java soit le format ASCII. Dans ce cas, des erreurs 
        apparaitront lors de la compilation des fichiers de l'archive, qui sont codés en UTF8.
        Pour remédier à cela, il est possible de positionner la variable d'environnement
         JAVA\_TOOL_OPTIONS (en bash : `export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8`), 
         ou encore de lancer la compilation avec l'option `-encoding UTF8`, ce qui donne ici :
        
        javac -encoding UTF8 *.java Synchro/*.java

- Exécution:  
        `java Main`  
        `java Main PhiloSem 10`  
         (classe implantant l'interface StrategiePhilo) (nb de philosophes)
         
	Le bouton d'aide de la fenêtre affichée par l'application en présente 
	les fonctionnalités.
	
La classe Semaphore
--------------------
La plateforme Java fournit la classe `java.util.concurrent.Semaphore` qui propose 
une implantation des sémaphores généraux, avec notamment :

- un constructeur prenant un paramètre entier, correspondant à la valeur initiale 
du sémaphore. Un second paramètre *optionnel* booléen, qui permet de préciser si 
le sémaphore créé est FIFO. Par défaut, les sémaphores de 
la classe `java.util.concurrent.Semaphore` ne sont pas FIFO.       
        Par exemple : `s=new Semaphore(5,true)` crée un sémaphore FIFO de valeur initiale 5.
        
- une méthode `acquire()`, qui correspond à l'opération `P()`
- une méthode `release()`, qui correspond à l'opération `V()`

Cette classe fournit en outre différentes méthodes destinées
 à faciliter l'écriture des programmes (au risque d'altérer la clarté et la sûreté 
 de la conception). Il est ainsi possible d'effectuer des `P()`non bloquants (`tryAcquire()`),
  de demander à augmenter ou diminuer la valeur du sémaphore de plusieurs unités en 
  une seule opération (`acquire(k)`, `release(j)`), de consulter et modifier 
  la valeur du sémaphore, le nombre de processus en attente sur le sémaphore, et 
  d'autres choses bien pires encore, qu'il est possible d'utiliser, 
  mais avec recul, précaution et modération...

À faire
-------

### Première approche : les fourchettes sont des ressources critiques 
=> associer un sémaphore à chacune des fourchettes

- Implanter une version de base, où tous les philosophes commencent par prendre leur 
fourchette de droite avant de prendre leur fourchette de gauche. 
- Mettre en évidence la situation d'interblocage pouvant se produire avec cette version.
Un moyen simple pour cela est d'introduire une temporisation suffisante entre les prises
de fourchette.
- Implanter (en utilisant des sémaphores) différentes adaptations de cette version de base
afin d'éviter les interblocages. Justifier en quoi chaque adaptation évite les interblocages. 

### Seconde approche : contrôler la progression d'un philosophe en fonction de l'état de ses voisins.
=> introduire explicitement la notion d'état des philosophes, et associer un sémaphore
« privé » à chaque philosophe :un philosophe peut manger si aucun de ses voisins ne mange, 
il doit attendre sinon. Les principales difficultés sont :

- d'assurer la cohérence des tests sur l'état des philosophes : le (dé)blocage d'un 
   philosophe doit être effectué de manière simultanée (atomique) à l'évaluation de
   l'état qui motive la décision de (dé)blocage;
- la gestion du déblocage d'un philosophe qui ne pouvait pas manger précédemment et qui
   peut le faire suite aux changements d'états d'un ou de ses deux voisins.

Cette solution est optimale en termes de degré de parallélisme, dans
le sens où un philosophe qui demande et dont les voisins ne mangent pas peut
manger directement. Evaluer ce degré de parallélisme, en fonction du nombre
de philosophes, et le comparer avec celui de la solution 1.

#### Equité
Montrer (en exhibant un scénario avec 4 ou 5 philosophes) que cette solution « optimale » 
peut conduire à  la famine d'un philosophe.

Imaginer une solution gérant une priorité entre les philosophes permettant de résoudre ce
problème. Etudier

- le degré de parallélisme dans le pire des cas. Comparer avec la solution optimale.
- l'attente maximum pour un philosophe demandeur 
	(en termes nombre de philosophes servis avant le philosophe demandeur)
- les limites éventuelles de la solution proposée.

Indications
-----------

 - `PhiloSem.java` est la seule classe à modifier. Le constructeur de cette classe prend
un paramètre correspondant au nombre de philosophes lancés. Les variables d'état ou
les sémaphores utilisés par les méthodes de cette classes seront (déclarés comme) des
attributs de cette classe.

- Il est possible de contrôler la progression des philosophes pas à pas, en mettant 
la simulation en pause, puis en cliquant sur les philosophes (voir l'aide de la fenêtre),
ce qui peut être très utile pour mettre en évidence des scénarios conduisant à des
situations pathologiques (famine, erreur...)

 - Utiliser `Main.java` pour les numéros (`Main.FourchetteGauche` /
`Main.FourchetteDroite` / `Main.PhiloGauche` / `Main.PhiloDroite`).

 - (Optionnel) Pour pour poser la fourchette n°f sur l'assiette à *sa* droite, à *sa*
  gauche ou sur la table, utiliser

        IHMPhilo.poser (f, EtatFourchette.AssietteDroite);
        IHMPhilo.poser (f, EtatFourchette.AssietteGauche);
        IHMPhilo.poser (f, EtatFourchette.Table);



