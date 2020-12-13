TP Synchronisation en Ada : lecteurs/rédacteurs
===============================================

Objectif
--------
Réaliser une tâche Ada gérant les accès à un fichier partagé, en garantissant une cohérence des accès concurrents (accès exclusif pour les écritures) et en suivant différentes stratégies de service :

- priorité aux rédacteurs ou aux lecteurs ;
- FIFO ;
- équitable (absence de famine que ce soient des lecteurs ou des rédacteurs).

Les fournitures et paquetages
-----------------------------

`mkstrategie` : script shell permettant de définir, choisir et compiler une stratégie

`LR`  : vide, requis par l'implantation d'Ada utilisée ici (gnat)  
`LR.Affic` : tout ce qui concerne l'affichage  
`LR.Main` : programme principal  
`LR.Simu` : simulateur temporel  
`LR.Synchro` : paquetage de redirection vers la stratégie choisie  
`LR.Synchro.Exclusion` : implantation LR par exclusion mutuelle (approche par conditions d'acceptation)  
`LR.Synchro.Exclusion2` : implantation alternative de LR par exclusion mutuelle  (approche par automates)  
`LR.Synchro.Basique` : 1er exercice, à compléter  
`LR.Tasks` : les tâches clientes (lecteurs et rédacteurs)  

Les paquetages à consulter sont principalement les paquetages `LR.Synchro.*`

Au besoin, il est possible de consulter  `LR.Tasks` qui contient la défintion du comportement
des lecteurs et des rédacteurs. Le code est simple, et il peut être utile de jouer (en les
éditant) sur les paramètres qui fixent la fréquence avec laquelle les différentes entrées
sont appelées.

Par curiosité, on peut aussi consulter `LR.Main` (qui lance les tâches) et les interfaces
de `LR.Simu` et `LR.Affic` mais il n'est pas utile de se pencher sur les détails de
l'implantation de ces deux derniers paquetages, qui ne présente pas d'intérêt particulier.

Principe de la synchronisation
------------------------------

Comme présenté en cours, deux approches sont possibles :

1 - définir une tâche de synchronisation (par exemple `LectRedTask` dans `LR.Synchro.Exclusion`) qui
possède des entrées ouvertes ou pas selon son état interne. La tâche de synchronisation
est alors conçue comme un *automate*. L'interface (=
les entrées) et leur implantation peuvent varier selon la stratégie implantée.
Les procédures `Demander_*` et `Terminer_*` permettent de présenter une interface uniforme pour
les tâches définies dans `LR.Tasks`.

2 - définir une tâche fournissant un *service*, en attente cyclique d'appels (requêtes) sur
ses différentes entrées. A chaque itération, la tâche traite un appel. Elle reste en attente
s'il n'y a pas de client. La démarche de conception est alors très proche de celle des
 moniteurs : à chaque entrée est associé un traitement, gardé par une condition
 d'acceptation ; la condition d'acceptation détermine la décision d'entamer (ou non)
  le traitement, en fonction du maintien de la cohérence (ou non) de la ressource gérée
  par le service.


À Faire
-------

1. Écrire dans `lr-synchro-basique.adb` une version basique autorisant
plusieurs lecteurs simultanés. Ne pas se préoccuper d'implanter une
stratégie particulière. Pour cela, utiliser un automate fini à états (approche 1)
déterminant les entrées ouvertes dans chaque état.

2. Définir une tâche serveur réalisant le même service (approche 2).

3. Modifier les versions précédentes pour implanter une stratégie de
type priorité aux rédacteurs.

4. Modifier les versions précédentes pour implanter une stratégie FIFO.

5. Construire un automate pour une stratégie équitable (autre que FIFO), i.e. qui garantit
l'absence de famine des lecteurs et des rédacteurs, et implanter cet automate.

Définition des stratégies
-------------------------

L'absence d'introspection en Ada, qui aurait par exemple permis de paramétrer `LR.Synchro`
 avec le nom des paquetages/stratégies disponibles, alourdit un peu le travail d'édition
 des différents composants.

 Le script shell `./mkstrategie` vise à faciliter ce travail d'édition :

 - appelé sans paramètres (`./mkstrategie`), il permet de recompiler la dernière stratégie "installée" ;
 - avec l'option -i (`./mkstrategie -i`), il permet de créer et installer une nouvelle stratégie,
d'installer une stratégie existante, ou de recompiler la dernière stratégie installée.

Pour définir une stratégie (`Xxxx`), il suffit de travailler sur le fichier
`lr-synchro-xxxx.adb`, correspondant à son implantation. Seul le corps de la tâche
 `LectRedTask`, ainsi que la  fonction `Nom_Strategie` doivent être
 modifiés. En particulier, les procédures `Demander_Lecture`, `Demander_Ecriture`,
 `Terminer_Lecture`, `Terminer_Ecriture` qui appellent les entrées correspondantes de
 la tâche `LectRedTask` n'ont pas à être modifiées  (sauf, bien sûr, si l'on souhaite modifier l'interface de la tâche `LectRedTask`). Leur rôle est d'abord d'assurer
 une modularité, en permettant leur appel (depuis d'autres paquetages) en tant que procédures de paquetages, sans référence à la tâche `LectRedTask`.

 Il est par ailleurs possible de réaliser les opérations du script `./mkstrategie`
 à la main. Le détail des opérations est donné en fin de document.

Pour exécuter
-------------

    ./lr-main 5 4    (nb lecteurs, nb rédacteurs)

*Note :* le bouton d'aide de la fenêtre affichée par l'application en présente les fonctionnalités.


Annexe
=======

Rappel tâches Ada
-----------------

- Pour une entrée de rendez-vous `Rdv`, `Rdv'count` est le nombre de tâches
  clientes en attente de l'acceptation du rendez-vous.

Ajouter une nouvelle stratégie sans utiliser le script `mkstrategie`
-----------------------------------

Soit la stratégie `Toto` que l'on souhaite implanter :

- dupliquer `lr-synchro.ads` dans `lr-synchro-toto.ads` ;
- éditer `lr-synchro-toto.ads` pour nommer le paquetage `LR.Synchro.Toto` ;
toutes les stratégies ont ainsi la même interface, mais des noms différents.
- dans `lr-synchro.adb`, remplacer `LR.Synchro.Exclusion` (en supposant que `Exclusion` est
la dernière stratégie utilisée)  par `LR.Synchro.Toto` (deux emplacements marqués par `XXXX`) ;
cette manipulation (pas vraiment élégante...) vise à pallier l'absence d'introspection en Ada, 
qui aurait ici permis de paramétrer `LR.Synchro` avec le nom des paquetages/stratégies disponibles.
- écrire l'implantation du paquetage `LR.Synchro.Toto`
    dans le fichier `lr-synchro-toto.adb` en s'inspirant d'une stratégie déjà existante.


Pour compiler
-------------
 - assurez vous d'utiliser le compilateur Ada situé dans `usr/bin` (au besoin : `export PATH=/usr/bin:$PATH`)
 - `make` ou `gprbuild build.gpr` ou `./mkstrategie`
