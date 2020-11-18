# Algorithme de Newton local

## Principe

La fonction ``f`` étant ``C^{2}`` , on peut remplacer ``f`` au voisinage de l’itéré courant ``x_{k}`` par son développement de Taylor au second ordre, soit :

``f(y) \sim q(y)=f\left(x_{k}\right)+\nabla f\left(x_{k}\right)^{T}\left(y-x_{k}\right)+\frac{1}{2}\left(y-x_{k}\right)^{T} \nabla^{2} f\left(x_{k}\right)\left(y-x_{k}\right)``

On choisit alors comme point ``x_{k+1}`` le minimum de la quadratique q lorsqu’il existe et
est unique, ce qui n’est le cas que si ``\nabla^{2} f (x)`` est définie positive. Or le minimum de q est
réalisé par ``x_{k+1}`` solution de : ``\nabla q (x_{k+1}) = 0`` , soit :
``\nabla f\left(x_{k}\right)+\nabla^{2} f\left(x_{k}\right)\left(x_{k+1}-x_{k}\right)=0,``

ou encore, en supposant que ``\nabla^{2} f (x_{k})`` est définie positive :

``x_{k+1}=x_{k}-\nabla^{2} f\left(x_{k}\right)^{-1} \nabla f\left(x_{k}\right).``

La méthode ne doit cependant jamais être appliquée en utilisant une inversion de la
matrice Hessienne (qui peut être de très grande taille et mal conditionnée), mais plutôt en utilisant :

   ``x_{k+1}=x_{k}+d_{k}``
où ``d_{k}`` est l’unique solution du système linéaire :

   ``\nabla^{2} f\left(x_{k}\right) d_{k}=-\nabla f\left(x_{k}\right)`` ,
``d_{k}``
étant appelée direction de Newton.

Cette méthode est bien définie si à chaque itération, la matrice hessienne ``\nabla^{2} f (x_{k})`` est
définie positive : ceci est vrai en particulier au voisinage de la solution ``x^{*}_{k}`` cherchée si on
suppose que ``\nabla^{2} f (x^{*})`` 
est définie positive (par continuité de ``\nabla^{2} f``).

## Algorithme

#### Données:

``f , x_{0}`` première approximation de la solution cherchée, ``\epsilon > 0`` précision demandée.

#### Sorties

une approximation de la solution du problème ``\min _{x \in \mathbb{R}^{n}} f(x)`` .

#### 1.Tant que le test de convergence est non satisfait 
  a. Calculer ``d_k`` solution du système : ``\nabla^{2} f (x_{k}) d_{k} = - \nabla f (x_{k})``
  
  b. Mise à jour : ``x_{k+1} = x_{k}+ d_{k} , k = k + 1``
#### 2.Retourner :  ``x_{k}``.



