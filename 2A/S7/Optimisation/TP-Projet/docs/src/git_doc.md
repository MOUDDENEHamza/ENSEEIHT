## Créer un module en Julia et définir ses fonctions
Pour générer un nouveau module, utilisez `pkg> generate Toto`,
deux fichiers seront crées : `Project.toml` qui contient le nom du package, son UUID unique, sa version, l'auteur et les éventuelles dépendances 
et le fichier `src/Toto.jl` :

```julia
module Toto

greet() = print("Hello World!")
include("Fonctions.jl")

end # module
```
Dans ce fichier `Toto.jl`, on définit les fonctions du module.
Dans l'exemple ci-dessus la fonction "greet()" et toutes les fonctions définies dans le fichier "Fonctions.jl" seront accessibles pour les utilisateurs du module.


## Définir les tests du module :

Pour ajouter des tests à ce module :

* Créez un nouveau dossier `/test` (pas `/tests` !)
* dedans créez un nouveau fichier `runtests.jl` (pas `runtest.jl` !)

!! tous les tests devraient être inclus (avec des `include`) dans ce fichier. 


## Créer un dépôt Git

Pour créer un dépôt sur Github:

* Rendez-vous sur [github.com](github.com)
* Créez un compte si vous en avez pas
* [Créez un dépôt](https://github.com/new), il est recommandé de prendre le même nom que le Module (`Toto` dans notre cas).
!!! warning "Avertissement"
    
    * Ne cochez PAS *Initialize this repository with a README* !, mais si vous l'avez déja fait n'utilisez PAS la méthode suivante, mais plutôt la méthode **Git clone** ci-dessous.
    * Pour les authentifications, utilisez votre identifiant Github.

* Ensuite,recupérez le lien de votre dépôt:

| [![](https://sansnom.org/activities/discussions/documentation/free-software/pull-request/clone_https.png)]() |

* Lancez un terminal dans le dossier (`Toto` dans notre cas) contenant votre Module:
```
git init 
git add .  
git commit -m "first commit" 
git remote add origin https://le_lien_du_dépôt.git 
git push -u origin master
```
Dans la suite vous n'aurez plus besoin d'utiliser toute la commande `git push -u origin master`,mais juste `git push` pour pousser vos modifs.
#### Git clone
* Pour ajouter vos fichier si vous avez initialisé votre dépôt lancez un terminal dans un dossier à coté du dossier contenant votre Module:
```
git clone https://le_lien_du_dépôt.git 
```
* Un dossier au nom du dépôt sera crée, ajouter vos fichiers dedans,(`Project.toml`,`Manifest.toml`,`src/`,...)
!!! warning "Avertissement"
    
    Ajoutez les fichiers et pas le dossier contenant le module !
    
* Maintenant,allez dans le dossier du dépôt et dans un terminal :

```
git add .  
git commit -m "first commit" 
git push
```

Consultez [cette page](https://guides.github.com/activities/hello-world/) pour savoir plus sur Git/Github.


## Utilisation du module

* Vous pouvez maintenant importé votre module:

```julia
julia> ]
pkg> add https://le_lien_du_dépôt.git
```
* pour le tester: 

```julia
pkg> test Toto
```
* pour l'utiliser:

```julia
julia> using Toto
```
