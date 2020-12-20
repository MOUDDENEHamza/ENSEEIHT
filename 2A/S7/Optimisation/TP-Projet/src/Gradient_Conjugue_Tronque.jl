@doc doc"""
Minimise le problème : ``min_{||s||< \delta_{k}} q_k(s) = s^{t}g + (1/2)s^{t}Hs``
                        pour la ``k^{ème}`` itération de l'algorithme des régions de confiance

# Syntaxe
```julia
sk = Gradient_Conjugue_Tronque(fk,gradfk,hessfk,option)
```

# Entrées :   
   * **gradfk**           : (Array{Float,1}) le gradient de la fonction f appliqué au point xk
   * **hessfk**           : (Array{Float,2}) la Hessienne de la fonction f appliqué au point xk
   * **options**          : (Array{Float,1})
      - **delta**    : le rayon de la région de confiance
      - **max_iter** : le nombre maximal d'iterations
      - **tol**      : la tolérance pour la condition d'arrêt sur le gradient


# Sorties:
   * **s** : (Array{Float,1}) le pas s qui approche la solution du problème : ``min_{||s||< \delta_{k}} q(s)``

# Exemple d'appel:
```julia
gradf(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]
hessf(x)=[-400*(x[2]-3*x[1]^2)+2  -400*x[1];-400*x[1]  200]
xk = [1; 0]
options = []
s = Gradient_Conjugue_Tronque(gradf(xk),hessf(xk),options)
```
"""
function Gradient_Conjugue_Tronque(gradfk,hessfk,options)

    "# Si option est vide on initialise les 3 paramètres par défaut"
    if options == []
        deltak = 2
        max_iter = 100
        tol = 1e-6
    else
        deltak = options[1]
        max_iter = options[2]
        tol = options[3]
    end

   n = length(gradfk)
   s = zeros(n)
   q(s) = gradfk' * s + (1/2)*transpose(s)*hessfk*s

   sj = zeros(n)
   gj = gradfk
   pj = -gradfk

   for j = 1:max_iter
       kj = pj' * hessfk * pj
       if kj<0
           "on écrit ||sj+rho*pj||=deltak sous forme de ax^2 +bx+c=0"
           a = norm(pj)^2
           b = 2*sj'*pj
           c = norm(sj)^2 - deltak^2
           d = sqrt(b^2 - 4a*c)
           rho1, rho2 = (-b-d)/(2a), (-b+d)/(2a)

           if q(sj+rho1*pj)>q(sj+rho2*pj)
               rho = rho2
           else
               rho = rho1
           end # if
           s = sj+rho*pj
           break
       end # if

       alphaj = (gj' * gj)/kj

       "Cas où : ||sj+alpha*pj||>deltak"
       if norm(sj + alphaj * pj) > deltak
           "on écrit ||sj+alpha*pj||=deltak sous forme de ax^2 +bx+c=0"
           a = norm(pj)^2
           b = 2*sj'*pj
           c = norm(sj)^2 - deltak^2

           d = sqrt(b^2 - 4a*c)
           alpha1, alpha2 = (-b-d)/(2a), (-b+d)/(2a)

           if alpha1>0
               alpha = alpha1
           elseif alpha2>0
               alpha = alpha2
               s = sj+alpha*pj
               break
           end # if
       end # if

       sj = sj + alphaj * pj
       gj_1 = gj+alphaj*hessfk*pj
       betaj = (gj_1'*gj_1)/(gj'*gj)
       pj = -gj_1 + betaj*pj

       if norm(gj_1)<=tol*norm(gradfk)
           s = sj
           break
       end # if
       gj = gj_1
   end # for

   return s
end
