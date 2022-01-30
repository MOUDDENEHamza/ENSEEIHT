                       Structures de données en TLA+
                       -----------------------------

Les ensembles
-------------

{}                 == ensemble vide.
{ a,b,c }          == ensemble contenant a, b et c.
{ i \in S : p(i) } == ensemble des éléments de S qui vérifient p(i).
{ e(i) : i \in S } == ensemble des valeurs de l'expression e(i) pour
                      les éléments de S.
m..n               == { i \in Nat : m <= i <= n }
SUBSET S           == ensemble des sous-ensembles de S.
UNION S            == union de tous les éléments de S.

x \in S
x \notin S
S \union T  ou  S \cup T
S \intersect T  ou  S \cap T
S \ T  (différence ensembliste)
S \subseteq T  (inclusion)

Cardinality(S) == taille de S (pour S fini)

================================================================

Les fonctions
-------------

[ S -> T ]            == ensemble des fonctions de S dans T.
[ x \in S |-> e(x) ]  == la fonction qui à chaque élément de S associe e(x).
f[x]                  == valeur de f en x.
DOMAIN f              == domaine de définition de f (l'ensemble des x où
                         f[x] existe).
                         Pour l'image, utiliser: { f[x] : x \in DOMAIN f }.
[ f EXCEPT ![x] = e ] == la fonction identique à f sauf en x où elle vaut e
                         (f peut ne pas être définie en x, la fonction
                         construite l'est nécessairement).

================================================================

Les séquences
-------------
Cf /mnt/n7fs/tla/tla2sany/StandardModules/Sequences.tla

Seq(D) == l'ensemble (infini) de toutes les séquences (finies) contenant des
          éléments pris dans D.

Len(s) == nombre d'éléments de la séquence.

Une séquence de Seq(D) est une fonction de [1..Len(s) -> D].

<< >>       == séquence vide.
<< a,b,c >> == séquence formée par a puis b puis c.
s \o t      == concaténation des séquences s et t.
s[i]        == i-ième élément de la séquence (i \in 1..Len(s)).
Head(s)     == s[1] (avec s non vide).
Tail(s)     == << s[2],...,s[Len(s)] >> (avec s non vide).

Rq : il n'y a pas de différence entre tuples (n-uplets) <<x,y>> et séquences.

================================================================

Les multi-ensembles (bags)
--------------------------
Cf /mnt/n7fs/tla/tla2sany/StandardModules/Bags.tla

Bags(D) == l'ensemble des multi-ensembles contenant des éléments de D.

Un multi-ensemble de Bags(D) est une fonction de [ subD -> Nat \ {0} ], où
subD est inclus dans D : seuls les éléments contenus au moins une fois
apparaissent dans le domaine du multi-ensemble.

BagToSet(B) == l'ensemble obtenu en ignorant les cardinalités.
SetToBag(S) == le bag contenant les éléments de S en un exemplaire chaque.
EmptyBag    == multi-ensemble vide.
BagIn(e,B)  == e est-il dans le multi-ensemble ?
B1 (+) B2   == union.
B1 (-) B2   == différence.
B1 \sqsubseteq B2 == test d'inclusion.
BagCardinality(B) == nombre d'éléments (= somme des occurrences).

================================================================

Les enregistrements (records)
-----------------------------

Un enregistrement est en fait une fonction dont le domaine est l'ensemble
des noms des champs.

Soit r = [ toto |-> 1, titi |-> 2 ]

 r.toto == r["toto"]  (= 1 ici)

 DOMAIN r = { "toto", "titi" }

 [ r EXCEPT !.titi = 3 ] = le même enregistrement que r sauf pour le champ
                           titi qui vaut 3

 [ a : S, b : T, c : U ] == ensemble des enregistrements de champs a, b et c
                            définis respectivement sur S, T et U.
                            (ici, r \in [ toto:Nat, titi:Nat ])
