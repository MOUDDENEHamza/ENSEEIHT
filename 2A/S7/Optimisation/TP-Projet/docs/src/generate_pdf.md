# Génération d'un fichier pdf

Le package [Weave](http://weavejl.mpastell.com/stable/) permet de générer un
rapport sous format pdf d'un script Julia.

Le fichier [gabarit_rapport.jl](../gabarit_rapport.jl) est un gabarit de
rapport. Après avoir édité votre script, vous pouvez publier votre script en
format HTML avec la commande:

```julia
julia> ]
pkg> add Weave
julia> using Weave
julia> weave("gabarit_rapport.jl", doctype = "md2html")
```
Il est important d'imprimer ensuite le fichier [HTML en format pdf](https://www.sejda.com/fr/html-to-pdf) pour la remise
sur Moodle.

!!! warning "Avertissement"

    Les lignes de code précédentes ne doivent pas se retrouver dans votre
    script. Vous devez les éxécuter dans la console de Julia en vous assurant
    d'être dans le dossier contenant le fichier `gabarit_rapport.jl`.
