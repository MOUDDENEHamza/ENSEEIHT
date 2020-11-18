# Génération de la documentation d'un dépot git

### 1/ Créer un répertoire `docs/` au niveau de la racine du projet

### 2/ En se plaçant au niveau du répertoire `docs/`

### 2-1/ Création du fichier `make.jl`

Ce programme utilise `Documenter.makedocs()` pour générer les pages html et `Documenter.deploydocs()` pour la dépoloyer dans les Github-pages:

```julia
using Documenter
using *le module*

makedocs(    
    modules = [*le module*],
    sitename = "le nom du site",
    authors = "author 1, author 2, ...",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    pages = [ 
             *Ici vous listez vos pages de la façon suivante*
             "Le nom de la page 1 " => "page1.md",
             "Le nom de la page 2 " => "page2.md",
                                    .
                                    .
                                    .
            ]
    )

deploydocs(repo = "*Le lien du dépôt git*")
```
### 2-2/- Ajouter les dépendances spécifiques à la génération de la doc

Au niveau du répertoire *docs* vous tapez sur un terminal

```linux
/docs$ julia
```
```Julia
julia> ]
pkg> activate .
(docs) pkg> add Documenter
(docs) pkg> add *Le lien git du module*
```

### 2-3/ ajout des fichiers

Créez un docs `src/` ensuite `src/assets/` le premier contiendra `les fichiers.md` et le deuxième contiendra les éventuels images, logo et autres. (pour ajouter un logo mettez l'image sous le nom `logo.<extension>` dans `assets/`.

### 2-4/ index des fonctions

```julia

```

### 3/- Génération de la docs


Pour en savoir plus, consultez [cette page](https://juliadocs.github.io/Documenter.jl/stable/lib/public/#Documenter). 
