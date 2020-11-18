## A. Problèmes sans contraintes

Les problèmes de minimisation sans contraintes à résoudre sont les suivants :

#### Problème 1

``\hspace*{1.5cm}`` ``\begin{aligned} f_{1}: \mathbb{R}^{3} & \rightarrow \mathbb{R} \\ \left(x_{1}, x_{2}, x_{3}\right) & \mapsto 2\left(x_{1}+x_{2}+x_{3}-3\right)^{2}+\left(x_{1}-x_{2}\right)^{2}+\left(x_{2}-x_{3}\right)^{2} \end{aligned}``

On cherchera à minimiser ``f_{1}`` sur ``\mathbb{R}^{3}`` , en partant des points suivants : ``\\``

``\hspace*{2cm}`` ``x_{011}=\left[\begin{array}{c} 1 \\ 0 \\ 0 \end{array}\right], \quad x_{012}=\left[\begin{array}{c} 10 \\ 3 \\ -2.2 \end{array}\right]``

#### Problème 2

``\hspace*{1.5cm}`` ``\begin{aligned} f_{2}: \mathbb{R}^{2} & \rightarrow \mathbb{R} \\ \left(x_{1}, x_{2}\right) & \mapsto 100\left(x_{2}-x_{1}^{2}\right)^{2}+\left(1-x_{1}\right)^{2} \end{aligned}``

On cherchera à minimiser ``f_{2}`` sur ``\mathbb{R}^{2}`` , en partant des points suivants :``\\`` 


``x_{0 2 1}=\left[\begin{array}{c} -1.2 \\ 1 \end{array}\right]\\``

``x_{0 2 2}=\left[\begin{array}{c} 10 \\ 0 \end{array}\right]\\``

``x_{023}=\left[\begin{array}{c} 0 \\ \frac{1}{200}+\frac{1}{10^{12}} \end{array}\right]\\``



## B. Cas tests pour le calcul du pas de Cauchy

On considère des fonctions quadratiques de la forme ``q(s)=s^{\top} g+\frac{1}{2} s^{\top} H s``

#### Quadratique 1

``g=\left[\begin{array}{l} 0 \\ 0 \end{array}\right]``,``H=\left[\begin{array}{ll} 7 & 0 \\ 0 & 2 \end{array}\right]\\``

#### Quadratique 2
``g=\left[\begin{array}{l} 6 \\ 2 \end{array}\right]``,``H=\left[\begin{array}{ll} 7 & 0 \\ 0 & 2 \end{array}\right]\\``


#### Quadratique 3

``g=\left[\begin{array}{l} -2 \\ 1 \end{array}\right]``,``H=\left[\begin{array}{ll} -2 & 0 \\ 0 & 10 \end{array}\right]\\``

## C. Cas tests pour la résolution du sous-problème par l’algorithme du Gradient Conjugué Tronqué

On reprendra les 3 quadratiques testées avec le pas de Cauchy, auxquelles on ajoutera :

#### Quadratique 4

``g=\left[\begin{array}{l} 0 \\ 0 \end{array}\right]``, ``H=\left[\begin{array}{ll} -2 & 0 \\ 0 & 10 \end{array}\right]\\``

#### Quadratique 5

``g=\left[\begin{array}{l} 2 \\ 3 \end{array}\right]``,``H=\left[\begin{array}{ll} 4 & 6 \\ 6 & 5 \end{array}\right]\\``

#### Quadratique 6

``g=\left[\begin{array}{l} 2 \\ 0 \end{array}\right]``, ``H=\left[\begin{array}{ll} 4 & 0 \\ 0 & -15 \end{array}\right]\\``




## D. Problèmes avec contraintes

### Retour sur ``f_1`` 
On s'intéresse à la valeur minimale de ``f_1`` sur un ensemble défini par une contrainte linéaire. La formulation du problème sera alors 

``\min _{x_{1}+x_{3}=1; x \in \mathbb{R}^{3}} f_{1}(x)``

On choisira comme point initial

``x_{c 11}=\left[\begin{array}{l} 0 \\ 1 \\ 1 \end{array}\right]`` (réalisable) 

ou 

``x_{c 12}=\left[\begin{array}{l} 0.5 \\ 1.25 \\ 1 \end{array}\right]`` (non réalisable) .
   
#### Retour sur ``f_2``
  On cherche à minimiser la fonction ``f_2`` décrite dans la partie précédente, en se restreignant maintenant à une sphère. Le problème s'écrit :

``\min _{x_{1}^{2}+x_{2}^{2}=1.5; x \in \mathbb{R}^{2}} f_{2}(x)``

On choisira comme point initial

``x_{c 21}=\left[\begin{array}{c} 1 \\ 0 \end{array}\right]``  (non réalisable)  

ou  

``x_{c 22}=\left[\begin{array}{c} \sqrt{3} / 2 \\ \sqrt{3} / 2 \end{array}\right]`` (réalisable).

### Un problème avec contraintes d'inégalité (supplément)

``\left\{\begin{array}{lll} \min _{(x, y) \in \mathbb{R}^{2}} f_{3}(x, y) & = & (x-1)^{2}+(y-2.5)^{2} \\ x-2 y+2 & \geq & 0 \\ -x-2 y+6 & \geq & 0 \\ -x+2 y+2 & \geq & 0 \\ x & \geq & 0 \\ y & \geq & 0 \end{array}\right.``

L'origine pourra être prise comme point initial.
