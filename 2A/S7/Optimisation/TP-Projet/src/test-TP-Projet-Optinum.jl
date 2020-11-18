#using Pkg; Pkg.add("LinearAlgebra"); Pkg.add("Markdown")
# using Documenter
using LinearAlgebra
using Markdown                             # Pour que les docstrings en début des fonctions ne posent
                                           # pas de soucis. Ces docstrings sont utiles pour générer 
                                           # la documentation sous GitHub
include("Algorithme_De_Newton.jl")

# Affichage les sorties de l'algorithme des Régions de confiance
function my_afficher_resultats(algo,nom_fct,point_init,xmin,fxmin,flag,sol_exacte,nbiters)
	println("-------------------------------------------------------------------------")
	printstyled("Résultats de : ",algo, " appliqué à ",nom_fct, " au point initial ", point_init, ":\n",bold=true,color=:blue)
	println("  * xsol = ",xmin)
	println("  * f(xsol) = ",fxmin)
	println("  * nb_iters = ",nbiters)
	println("  * flag = ",flag)
	println("  * sol_exacte : ", sol_exacte)
end

# Fonction f0
# -----------
f0(x) =  sin(x)
# la gradient de la fonction f0
grad_f0(x) = cos(x)
# la hessienne de la fonction f0
hess_f0(x) = -sin(x)
sol_exacte = -pi/2
options = []

x0 = sol_exacte
xmin,f_min,flag,nb_iters = Algorithme_De_Newton(f0,grad_f0,hess_f0,x0,options)
my_afficher_resultats("Newton","f0",x0,xmin,f_min,flag,sol_exacte,nb_iters)
x0 = -pi/2+0.5
xmin,f_min,flag,nb_iters = Algorithme_De_Newton(f0,grad_f0,hess_f0,x0,options)
my_afficher_resultats("Newton","f0",x0,xmin,f_min,flag,sol_exacte,nb_iters)
x0 = pi/2
xmin,f_min,flag,nb_iters = Algorithme_De_Newton(f0,grad_f0,hess_f0,x0,options)
my_afficher_resultats("Newton","f0",x0,xmin,f_min,flag,sol_exacte,nb_iters)
