TP Outils Mathématiques Informatique : Analyse Syntaxique par Descente Récursive
================================================================================

Le but de ce TP est d'apprendre à écrire un analyseur syntaxique
descendant récursif et à le tester.

Nous allons dans une première étape traiter le cas de la grammaire manipulée
en TD, puis nous étendrons celle-ci :

A/ La syntaxe du langage est un sous ensemble des expressions en CaML :

E est l'axiome.

  E -> ER = E
  E -> ER
  ER -> ER + T
  ER -> ER - T
  ER -> T
  T -> T * F
  T -> T / F
  T -> F
  F -> - F
  F -> ( E )
  F -> ident
  F -> true
  F -> false
  F -> number

Voici une grammaire LL(1) possible (vous pouvez aussi partir de celle proposée
en TD pour les expressions de bloc) :

  E  -> ER EX              - ( ident true false number
  EX -> = ER EX            =
  EX ->                    ) $
  ER -> T TX               - ( ident true false number
  TX -> + T TX             +
  TX -> - T TX             -
  TX ->                    = ) $
  T  -> F FX               - ( ident true false number
  FX -> * F FX             *
  FX -> / F FX             /
  FX ->                    + - = ) $
  F  -> - F                -
  F  -> ( E )              (
  F  -> ident              ident
  F  -> true               true
  F  -> false              false
  F  -> number             number

1) Écrire quelques programmes de test respectant la syntaxe de miniml.

2) L'analyseur lexical étant fourni (généré par camllex à partir du
   fichier Scanner.mll), écrire un analyseur descendant récursif pour
   miniml dans le fichier Syntax.ml, suivant le principe étudié en TD.

   La compilation est effectuée par la commande : dune build Main.exe

3) Tester cet analyseur syntaxique.

================================================================
B/ Simplification de l'analyseur par notation monadique

L'analyseur développé dans l'exercice précédent est relativement complexe à
cause de la gestion des succès/échec et de la transmission de la liste des
terminaux en cours d'analyse.

Il est possible de simplifier la programmation en utilisant une notation
monadique pour factoriser ce traitement répétitif.

Celle-ci est composée de trois parties :
 - le type de donnée monadique : parseResult
 - la fonction : inject qui construit ce type à partir d'une liste de terminaux
 - la fonction : bind (opérateur >>=) qui combine les fonctions d'analyse.

1) Étudier le fichier SyntaxMonad.ml qui implante le même analyseur
   que l'exercice A/ en utilisant cette notation.

   La compilation est effectuée par la commande : dune build MainMonad.exe

================================================================
C/ La syntaxe du langage étendue sera celle d'un mini CaML.

E0 est l'axiome.

Nous avons mis en évidence les nouvelles règles et les règles modifiées.

* E0 -> fun ident -> E0
* E0 -> let ident = E0 in E0
* E0 -> letrec ident = E0 in E0
* E0 -> if E0 then E0 else E0
* E0 -> E
  E  -> ER = E
  E  -> ER
  ER -> ER + T
  ER -> ER - T
  ER -> T
  T -> T * F
  T -> T / F
  T -> F
  F -> - F
* F -> ( E0 )
* F -> ( E0 ) (E0)
  F -> ident
* F -> ident (E0)
  F -> true
  F -> false
  F -> number

1) Écrire quelques programmes de test respectant la syntaxe de miniml.

2) Cette grammaire n'est pas LL(1), factoriser celle-ci et éliminer la
   récursivité à gauche.

3) L'analyseur lexical étant fourni (généré par camllex à partir du
   fichier Scanner.mll), écrire un analyseur descendant récursif pour
   miniML en exploitant la technique monadique présentée dans
   l'exercice précédent, vous modifierez pour cela le fichier
   SyntaxMonad.ml.

4) Tester cet analyseur syntaxique.
