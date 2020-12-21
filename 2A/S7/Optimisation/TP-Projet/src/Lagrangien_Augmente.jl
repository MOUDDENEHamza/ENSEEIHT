@doc doc"""
Résolution des problèmes de minimisation sous contraintes d'égalités

# Syntaxe
```julia
Lagrangien_Augmente(algo,fonc,contrainte,gradfonc,hessfonc,grad_contrainte,
            hess_contrainte,x0,options)
```

# Entrées
      * **algo**    : (String) l'algorithme sans contraintes à utiliser:
    - **"newton"**  : pour l'algorithme de Newton
    - **"cauchy"**  : pour le pas de Cauchy
    - **"gct"**     : pour le gradient conjugué tronqué
      * **fonc**    : (Function) la fonction à minimiser
  * **contrainte**   : (Function) la contrainte [x est dans le domaine des contraintes ssi ``c(x)=0``]
  * **gradfonc**       : (Function) le gradient de la fonction
  * **hessfonc**    : (Function) la hessienne de la fonction
  * **grad_contrainte** : (Function) le gradient de la contrainte
  * **hess_contrainte** : (Function) la hessienne de la contrainte
      * **x0**    : (Array{Float,1}) la première composante du point de départ du Lagrangien
  * **options**   : (Array{Float,1})
    1. **epsilon**    : utilisé dans les critères d'arrêt
    2. **tol**         : la tolérance utilisée dans les critères d'arrêt
    3. **itermax**    : nombre maximal d'itération dans la boucle principale
    4. **lambda0**   : la deuxième composante du point de départ du Lagrangien
    5. **mu0,tho**   : valeurs initiales des variables de l'algorithme

# Sorties
* **xmin**   : (Array{Float,1}) une approximation de la solution du problème avec contraintes
* **fxmin**    : (Float) ``f(x_{min})``
* **flag**   : (Integer) indicateur du déroulement de l'algorithme
   - **0**    : convergence
   - **1**    : nombre maximal d'itération atteint
   - **(-1)** : une erreur s'est produite
* **niters**    : (Integer) nombre d'itérations réalisées

# Exemple d'appel
```julia
using LinearAlgebra
f(x)=100*(x[2]-x[1]^2)^2+(1-x[1])^2
gradf(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]
hessf(x)=[-400*(x[2]-3*x[1]^2)+2  -400*x[1];-400*x[1]  200]
algo = "gct" # ou newton|gct
x0 = [1; 0]
options = []
contrainte(x) =  (x[1]^2) + (x[2]^2) -1.5
grad_contrainte(x) = [2*x[1] ;2*x[2]]
hess_contrainte(x) = [2 0;0 2]
output = Lagrangien_Augmente(algo,f,contrainte,gradf,hessf,grad_contrainte,hess_contrainte,x0,options)
```
"""
function Lagrangien_Augmente(algo, fonc::Function, contrainte::Function, gradfonc::Function,
    hessfonc::Function, grad_contrainte::Function, hess_contrainte::Function, x0, options)

    if options == []
        epsilon = 1e-8
        tol = 1e-15
        itermax = 000
        lambda0 = 2
        mu0 = 100
        tho = 2
    else
        epsilon = options[1]
        tol = options[2]
        itermax = options[3]
        lambda0 = options[4]
        mu0 = options[5]
        tho = options[6]
    end
    
    xk = x0
    xk_1 = x0
    mu = mu0
    lambda = lambda0
    betha = 0.9
    alpha = 0.1
    etha_c = 0.1258925
    epsilon0 = 1
    etha = etha_c / (mu ^ alpha)
    flag = 0
    i = 0

    for i in 1 : itermax
        Lx(x) = fonc(x) + lambda' * contrainte(x) + (mu / 2) * (norm(contrainte(x))) ^ 2
        grad_x_Lx(x) = gradfonc(x) + lambda' * grad_contrainte(x) + mu * grad_contrainte(x) * contrainte(x)
        Hess_x_Lx(x) = hessfonc(x) + lambda' * hess_contrainte(x) + mu * hess_contrainte(x) * contrainte(x) + mu * grad_contrainte(x) * grad_contrainte(x)'
        
        while (norm(grad_x_Lx(xk)) > epsilon)
            a = norm(grad_x_Lx(xk))
            if algo == "newton"
                xk, ~ = Algorithme_De_Newton(Lx, grad_x_Lx, Hess_x_Lx, xk, [])
            elseif algo == "cauchy" || algo == "gct"
                xk, ~ = Regions_De_Confiance(algo, Lx, grad_x_Lx, Hess_x_Lx, xk, [])
            end
            if a == norm(grad_x_Lx(xk))
                break
            end
        end

        gradL(x,l) = gradfonc(x) + l' * grad_contrainte(xk)
        if norm(gradL(xk, lambda)) <= max(tol, tol * norm(gradL(x0, lambda0)))
            flag = 0
            break
        elseif norm(contrainte(xk)) <= max(tol, tol * norm(contrainte(x0)))
            flag = 1
            break
        elseif i == itermax
            flag = 3
            break
        else
            if norm(contrainte(xk)) <= etha
                lambda = lambda + mu * contrainte(xk)
                epsilon = epsilon / mu
                etha = etha / (mu ^ betha)
            else
                mu = tho * mu
                epsilon = epsilon0 / mu
                etha = etha_c / (mu ^ alpha)
            end # if
        end # if

    end
    
    xmin = xk
    fxmin = fonc(xmin)

    return xmin, fxmin, flag, i
end