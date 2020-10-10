# Reconnaître les entiers supérieurs à 5


## Excercice 5 Déterminer, sous la forme d’une expression régulière:

1- L3 = 101|110|111

2- L4 = 1.(0|1).(0|1).(0|1).(0|1)*

3- L = 0*.(L3 | L4)

# Construire un automate minimal

On cherche à construire un automate minimal reconnaissant le langage L.

## Excercice 6 Construire un automate reconnaissant le langage L.

L3 = 101|110|111

L4 = 1.(0|1).(0|1).(0|1).(0|1]*

L = 0*.(L3 | L4)
  = q0 = 0*.(101|110|111 | 1.(0|1).(0|1).(0|1).(0|1)*)

D_{0}(q_{0}) = D_{0}(0*).(L_{3}|L_{4}) = 0*.(L_{3}|L_{4}) = q_{0}

D_{1}(q_{0}) = D_{1}(L_{3}|L_{4}) = D_{1}(101|110|111 | 1.(0|1).(0|1).(0|1).(0|1)*)
			 = 01 | 10 | 11 | (0|1).(0|1).(0|1).(0|1)* = q_{1}

D_{0}(q_{1}) = 1 | 
## Exercice 7 Minimiser l’automate précédent.
