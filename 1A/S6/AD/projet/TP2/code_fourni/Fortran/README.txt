code fortran fourni pour la partie 2 
du projet de Calcul Scientifique et d'Analyse de Données 2020

ce répertoire comprend
 - *matgen* un sous répertoire contenant les routines pour générer différents
   types de matrice (à partir de leur spectre)
   [[A NE PAS MODIFIER]]

 - *Make.inc* et *Makefile* deux fichiers pour compiler sur les machines d'enseignement
   [[A NE PAS MODIFIER]]

 - *tools.f90* une fichier contenant quelques routines utiles en particulier
   la routine qui orthonormalise un ensemble de vecteurs par le procédé de
   Gram-Schmidt
   [[A NE PAS MODIFIER]]

 - *main.f90* contenant le programme principal qui permet de lancer le calcul
   des couples propres en utilisant l'une ou l'autre des méthodes 
   [[A NE PAS MODIFIER sauf pour changer le nombre d'itérations max ou la
   précision demandée ou le paramètre p de l'approche par bloc]]

 - *power_v11.f90* contenant la routine de la méthode puissance itérée avec déflation [FOURNI]

 - *iter_v0.f90* contenant la routine de la méthode subspace_iter_v0 [À COMPLÉTER PENDANT LE TP2]

 - *iter_v1.f90* contenant la routine de la méthode subspace_iter_v1 [FOURNI]

 - *iter_v2.f90* contenant la routine de la méthode subspace_iter_v2
    [À ÉCRIRE POUR LE RENDU INTERMÉDIAIRE 2]
    (à la base, ce fichier contient le code de la version v1,
     si ce n'est le paramètre supplémentaire p pour l'approche bloc)

Compilation
-----------

pour générer l'exécutable main
 make

pour ne conserver que les sources
 make clean

Lancer le programme
-------------------

pour connaître les paramètres à fournir
./main

exemples
./main -imat 2 -n 500 -v 10 -disp 1
./main -imat 2 -n 500 -v 11 -m 20 -per 0.5 -disp 1

remarques
---------

- un appel avec (v=10), appel au solveur DSYEV de LAPACK ou (v=11), appel à la
  méthode de la puissance itérée avec déflation fonctionne
- les versions (v=0) et (v=2) correspondant aux solveurs basés sur la méthode
  de la subspace iteration v0 et v2  ne donnent pas de résultats corrects avec
  le code initial
- la version (v=1) (subspace iteration v1) fonctionne 
./main -imat 2 -n 500 -v 1 -m 20 -per 0.5 -disp 1
- le programme principal crée à chaque run un fichier *spectrum.txt*
  contenant le spectre de la matrice. Cela peut être utile pour analyser les
  performances des différentes méthodes. Il peut aussi être chargé dans
  matlab pour visualiser le spectre.


================================================
TODO pour prendre en main le code en début de TP
================================================

Lancez plusieurs calculs de couples propres avec les solveurs disponibles en
faisant varier
 - la taille de la matrice            (-n)
 - le type de la matrice              (-imat)
 - le pourcentage de la trace demandé (-per)

Vous pouvez garder -disp à 2 pour voir les valeurs propres et vérifier la
précision de la résolution
