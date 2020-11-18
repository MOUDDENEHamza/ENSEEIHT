# Travail à réaliser pour l'algorithme des régions de confiance avec gradient conjugué tronqué

###### Implémentation 

1. Implémenter l’algorithme du Gradient Conjugué Tronqué, en se basant sur le cours.
On validera les résultats sur les fonctions de l’Annexe C.

2. Intégrer finalement l’algorithme du Gradient Conjugué Tronqué dans un code de
régions de confiance, et appliquer ce code pour résoudre les exemples proposés en
Annexe A.

###### Interprétation  

1. Comparer la décroissance obtenue avec celle du pas de Cauchy, en retournant, dans
un premier temps le dernier itéré admissible à courbure positive (c’est à dire, que si
l’une ou l’autre des deux conditions (b) ou (d) sont rencontrées dans l’algorithme 3,
alors on ne calcule pas ``σ_{j}`` et on retourne le dernier itéré ``s_{j}`` directement).

2. Comparer la décroissance obtenue avec celle du pas de Cauchy, en imposant la sortie
dans l’algorithme 3 au bout d’une itération seulement. Que remarquez vous ?

3. Comparer la décroissance obtenue avec celle du pas de Cauchy dans le cas général.

4. Quels sont les avantages et inconvénients des deux approches ?
