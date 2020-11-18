# Principe

La méthode du lagrangien augmenté appartient à une classe d'algorithme qui
permettent la résolution des problèmes avec contraintes. Elle s'apparente aux méthodes de
pénalisation, dans lesquelles on résout le problème avec contraintes à travers une suite de
problèmes sans contraintes.

#  Algorithme du Lagrangien augmenté pour contraintes d'égalité

  On s'intéresse ici au cas où l'ensemble ``C`` est défini par un ensemble des contraintes d'égalités.
  Le problème se met ainsi sous la forme :
  
  ``\min _{c(x) = 0; x \in \mathbb{R}^{n}} f(x)``
  
où ``c : \mathbb{R}^{n} \rightarrow  \mathbb{R}^{m}``. 
L'algorithme suivant est obtenu de  Bierlaire, *Introduction à l'optimisation différentiable*.
  
 
### Données : 
``\mu_{0} > 0, \tau > 0, \hat{\eta}_{0}=0.1258925[^1] ,  \alpha=0.1, \beta=0.9, \epsilon_{0}=1 ,  \mu_{0}, \eta_{0}=\hat{\eta}_{0} / \mu_{0}^{\alpha}`` , et un point de départ du Lagrangien ``(x_{0},\lambda_{0})``. On pose ``k = 0``

### Sorties :
une approximation de la solution du problème avec contraintes.

### 1. Tant qu'il n'y a pas convergence, répéter
   a. Calculer approximation un minimiseur ``x_{k+1}`` du problème sans contraintes suivant :
   
   ``\min _{x \in \mathbb{R}^{n}} L_{A}\left(x, \lambda_{k}, \mu_{k}\right)=f(x)+\lambda_{k}^{T} c(x)+\frac{\mu_{k}}{2}\|c(x)\|^{2},``
   
avec ``x_{k}`` comme point de départ, en terminant lorsque ``\| \nabla_{x} L_{A}\left(x, \lambda_{k}, \mu_{k}\right) \| \leq \epsilon_{k}``.
Si convergence de l'algorithme global, s'arrêter , sinon aller en b

  b. Si ``\|c(x_{k+1})\| \leq \eta_{k}``, mettre à jour (entre autres) les multiplicateurs :
  
``\left\{\begin{array}{l}\lambda_{k+1}=\lambda_{k}+\mu_{k} c\left(x_{k+1}\right) \\ \mu_{k+1}=\mu_{k} \\\epsilon_{k+1}=\epsilon_{k} / \mu_{k} \\\eta_{k+1}=\eta_{k} / \mu_{k}^{\beta} \\k=k+1\end{array}\right.``
  
  c. Autrement, mettre à jour (entre autres) le paramétre de pénalité :
  
``\left\{\begin{array}{l}\lambda_{k+1} =\lambda_{k} \\\mu_{k+1} =\tau \mu_{k} \\\epsilon_{k+1} =\epsilon_{0} / \mu_{k+1} \\\eta_{k+1} =\hat{\eta}_{0} / \mu_{k+1}^{\alpha} \\k=k+1\end{array}\right.``
  
### 2. Retourner ``x_{k},\lambda_{k},\mu_{k}`` . 

[^1] : Pour que ``\eta_0=0.1``.