## Intérêt
L'utilisation des fonctions des modules, sans avoir accès aux modules ni faire des `using`,
à partir d'un fichier binaire qui contient des versions précompilées de ces modules.

## Génération du fichier binaire
##### Ajout du PackageCompiler en local
```linux
~$ julia
```
```julia
julia > ]
(v1.4) pkg> add PackageCompiler
```

##### Création d'un nouvel environnement et ajout des modules à compiler
Dans un dossier `NouveauEnv` je crée un nouvel environnement julia
```linux
~$ mkdir NouveauEnv
~$ cd NouveauEnv
~$ julia
```
```julia
julia> ]
pkg> activate .
(NouveauEnv) pkg> add https://github.com/mathn7/TestOptinum.git
(NouveauEnv) pkg> add https://github.com/mathn7/optinum.git
(NouveauEnv) pkg> add LinearAlgebra #je rajoute autant que je veux des modules
```

##### Génération du fichier binaire
Avant de procéder à la génération du fichier binaire il faut créer un fichier julia (dans le dossier NouveauEnv)
qui utilise les modules pour pouvoir exporter les fonctions.
Le contenu de (NouveauEnv/Exemple.jl) sera : 


```linux
~/NouveauEnv
❯ cat Exemple.jl
using LinearAlgebra ;using TestOptinum;using Optinum;
```
 
```linux
~$julia
```
```julia
julia> ]
pkg> activate .
(NouveauEnv) pkg>
julia> using PackageCompiler
julia> PackageCompiler.create_sysimage([:LinearAlgebra , :TestOptinum ,:Optinum]; sysimage_path="ExamplePrecompile.so",
                                         precompile_execution_file="Exemple.jl")
```
les paramètres de la fonction `create_sysimage`, utilisés sont :

premier paramètre : liste des modules à compiler (dans notre exemple : LinearAlgebra,TestOptinum,Optinum)

deuxième paramètre (sysimage_path) : nom du fichier binaire à générer (on peut spécifier le chemin également)

troisième paramètre (precompile\_execution\_file) : nom du fichier à compiler

## Utilisation du fichier binaire
Après la génération du fichier binaire `ExamplePrecompile.so` on peut utiliser
les fonctions précompilées (qui se trouvaient dans Exemple.jl) sans faire des `using`
```linux
~$julia -q -JExamplePrecompile.so
```
```julia
julia> LinearAlgebra.norm([4 5],2)
6.4031242374328485

julia>TestOptinum.tester_algo_newton(true,Optinum.Algorithme_De_Newton)
Test Summary:    | Pass  Total
L'algo de Newton |    4      4

```

