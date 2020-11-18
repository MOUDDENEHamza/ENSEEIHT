# Régions de confiance partie 1

  L’introduction d’une *région de confiance* dans la méthode de Newton permet de garantir
la convergence globale de celle-ci, i.e. la convergence vers un optimum local quel que soit
le point de départ. Cela suppose certaines conditions sur la résolution locale des sous-
problèmes issus de la méthode, qui sont aisément imposables.

## Principe
  L’idée de la méthode des régions de confiance est d’approcher ``f`` par une fonction
modèle plus simple ``m_{k}`` dans une région ``R_{k}=\left\{x_{k}+s ;\|s\| \leq \Delta_{k}\right\}`` pour un ``\Delta_{k}`` fixé.
Cette région dite “de confiance” doit être suffisament petite pour que

``\hspace*{2.5cm}`` ``m_{k}\left(x_{k}+s\right) \sim f\left(x_{k}+s\right).``

   Le principe est que, au lieu de résoudre : ``f\left(x_{k+1}\right)=\min _{\|x\| \leq \Delta_{k}} f\left(x_{k}+s\right)``
on résout :

``\hspace*{2.5cm}`` ``m_{k}\left(x_{k+1}\right)=\min _{\|x\| \leq \Delta_{k}} m_{k}\left(x_{k}+s\right)`` ``\hspace*{2.5cm}.``(2.1)

Si la différence entre ``f(x_{k+1})`` et ``m_{k} (x_{k+1} )`` est trop grande, on diminue le ``∆_{k}`` (et
donc la région de confiance) et on résout le modèle (2.1) à nouveau. Un avantage de cette
méthode est que toutes les directions sont prises en compte. Par contre, il faut faire attention
à ne pas trop s’éloigner de ``x_{k}`` ; en général, la fonction ``m_{k}`` n’approche proprement ``f`` que
sur une région proche de ``x_{k}`` .

 Exemple de modèle : l’approximation de Taylor à l’ordre 2 (modèle quadratique) :

``\hspace*{1.5cm}``	``m_{k}\left(x_{k}+s\right)=q_{k}(s)=f\left(x_{k}\right)+g_{k}^{\top} s+\frac{1}{2} s^{\top} H_{k} s`` ``\hspace*{1.5cm},``(2.2)

avec ``g_{k}=\nabla f\left(x_{k}\right) \text { et } H_{k}=\nabla^{2} f\left(x_{k}\right).``

## Algorithme

#### Algorithme 2  

*Méthode des régions de confiance (algo général)*     

##### Données:

``\Delta_{\max } > 0, \Delta_{0}  \in(0, \Delta_{\max}), 0 < \gamma_{1} < 1 < \gamma_{2} , 0 < \eta_{1} < \eta_{2} < 1.``

##### Sorties: 
une approximation de la solution du problème : ``\min _{x \in \mathbb{R}^{n}} f(x).``


##### 1.Tant que le test de convergence est non satisfait :

``\hspace*{1.5cm}`` a.Calculer approximativement ``s_{k}`` solution du sous-problème (2.1).

``\hspace*{1.5cm}`` b.Evaluer ``f\left(x_{k}+s_{k}\right)`` et ``\rho_{k}=\frac{f\left(x_{k}\right)-f\left(x_{k}+s_{k}\right)}{m_{k}\left(x_{k}\right)-m_{k}\left(x_{k}+s_{k}\right)}.``

``\hspace*{1.5cm}`` c. Mettre à jour l’itéré courant :

``\hspace*{2.5cm}``   ``x_{k+1}=\left\{\begin{array}{ll} x_{k}+s_{k} & \text { si } \rho_{k} \geq \eta_{1} \\ x_{k} & \text { sinon. } \end{array}\right.``

``\hspace*{1.5cm}`` d. Mettre à jour la région de confiance : 

``\hspace*{2.5cm}``    ``\Delta_{k+1}=\left\{\begin{array}{cc}\min \{\gamma_{2} \Delta_{k}, \Delta_{\max }\} & \operatorname{si} \rho_{k} \geq \eta_{2} \\ \Delta_{k} & \text{ si } \rho_{k} \in [\eta_{1}, \eta_{2}]. \\\gamma_{1} \Delta_{k} & \text { sinon. } \end{array}\right.``



##### 2.Retourner ``x_{k}``.

Cet algorithme  est un cadre générique. On va s’intéresser à deux raffinages possibles de l’étape a.

## Le pas de cauchy 

``\hspace*{0.5cm}``On considère ici le modèle quadratique ``q_{k}(s)``. Le sous-problème de régions de confiance correspondant peut se révéler difficile à résoudre (parfois autant que le problème de départ).

Il est donc intéressant de se restreindre à une résolution approchée de ce problème.

``\hspace*{0.5cm}``Le pas de Cauchy appartient à la catégorie des solutions approchées. Il s’agit de se
restreindre au sous-espace engendré par le vecteur ``g_{k}`` ; le sous-problème s’écrit alors

``\hspace*{2.5cm}`` ``\left\{\begin{array}{cl} \min & q_{k}(s) \\ s . t . & s=-t g_{k} \\ & t>0 \\ & \|s\| \leq \Delta_{k} \end{array}\right.`` 
``\hspace*{1.5cm}``   (2.3)

## Algorithme du Gradient Conjugué Tronqué

On s’intéresse maintenant à la résolution approchée du problème (2.1) à l’itération k de l’algorithme 2 des Régions de Confiance. On considère pour cela l’algorithme du Gradient Conjugué Tronqué (vu en cours), rappelé ci-après :


###### Algorithme 3

*Algorithme du gradient conjugué tronqué*

###### Données:

``\Delta_{k} > 0, x_{k}, g=\nabla f\left(x_{k}\right), H=\nabla^{2} f\left(x_{k}\right)``

###### Sorties:

le pas ``s`` qui approche la solution du problème : ``\min_{\|s \| \leq \Delta_{k}} q(s)``

où ``q(s)=g^{\top} s+\frac{1}{2} s^{\top} H_{k} s``

###### Initialisations :

``s_{0}=0, g_{0}=g, p_{0}=-g``


**1. Pour** j = 0, 1, 2, . . . , **faire** :

``\hspace*{1.5cm}`` a. ``\hspace*{0.4cm}`` ``\kappa_{j}=p_{j}^{T} H p_{j}``

``\hspace*{1.5cm}`` b.``\hspace*{0.4cm}`` Si ``\kappa_{j} \leq 0`` alors ``\\``
``\hspace*{2.5cm}`` déterminer ``\sigma_{j}`` la racine de l’équation ``\left\|s_{j}+\sigma p_{j}\right\|_{2}=\Delta_{k}\\``
 ``\hspace*{2.7cm}`` pour laquelle la valeur de ``q\left(s_{j}+\sigma p_{j}\right)`` est la plus petite.

``\hspace*{2.5cm}`` Poser ``s=s_{j}+\sigma_{j} p_{j}`` et sortir de la boucle.``\\``
``\hspace*{1.5cm}`` Fin Si

``\hspace*{1.5cm}`` c. ``\hspace*{0.4cm}`` ``\alpha_{j}=g_{j}^{T} g_{j} / \kappa_{j}\\``

``\hspace*{1.5cm}`` d.``\hspace*{0.4cm}`` Si ``\left\|s_{j}+\alpha_{j} p_{j}\right\|_{2} \geq \Delta_{k}`` alors

``\hspace*{2.5cm}`` déterminer ``\sigma_{j}`` la racine positive de l’équation ``\left\|s_{j}+\sigma p_{j}\right\|_{2}=\Delta_{k}\\``

``\hspace*{2.5cm}`` Poser ``s=s_{j}+\sigma_{j} p_{j}`` et sortir de la boucle.``\\``
``\hspace*{1.5cm}`` Fin Si


``\hspace*{1.5cm}`` e. ``\hspace*{0.4cm}`` ``s_{j+1}=s_{j}+\alpha_{j} p_{j}\\``
``\hspace*{1.5cm}`` f. ``\hspace*{0.4cm}`` ``g_{j+1}=g_{j}+\alpha_{j} H p_{j}\\`` 
``\hspace*{1.5cm}`` g. ``\hspace*{0.4cm}`` ``\beta_{j}=g_{j+1}^{T} g_{j+1} / g_{j}^{T} g_{j}\\``
``\hspace*{1.5cm}`` h. ``\hspace*{0.4cm}`` ``p_{j+1}=-g_{j+1}+\beta_{j} p_{j}\\``
``\hspace*{1.5cm}`` i. ``\hspace*{0.4cm}`` Si la convergence est suffisante, poser ``s=s_{j+1}`` et sortir de la boucle.

###### Retourner ``s``.
