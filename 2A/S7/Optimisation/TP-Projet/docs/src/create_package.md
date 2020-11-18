## Créer un Module en Julia

Pour générer un nouveau module :
```julia
julia>]
pkg> generate Module
julia>;
shell>cd Module/
```
deux fichiers seront crées : `Project.toml` qui contient le nom du package, son UUID unique, sa version, l'auteur et les éventuelles dépendances 
et le fichier `src/Module.jl` qui contient :

 ```julia
module Module

greet() = print("Hello World!")

end # module
```
ensuite vous pouvez activer le module pour pouvoir l'utiliser en faisant :

```julia
pkg> activate .
julia> import Module

julia> Module.greet()
Hello World!
```
### Ajout des dépendances au Module

Pour ajouter des dépendances au Module (les packages utilisés dans le Module):

```julia
pkg> add Module1 Module2
 Resolving package versions...
 Updating "/Module/Project.toml"
 + ...
 + ...
```
les dépendances résultantes sont ajoutées au fichier `Manifest.toml`

voici un exemple de fichier `Project.toml`:

```julia
name = "Module"
uuid = "d9fbbd2f-b07c-4129-9383-1eb96f1f244d"
authors = [<nom & adresse mail>]
version = "0.1.0"

[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
Markdown = "d6f4376e-aef5-505a-96c1-9c027394607a"
Test = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

```

maintenant on peut faire une mise à jour du fichier `src/Module.jl`:

```julia
module Module

import Module1
import Module2

greet() = print("Hello World!")

end # module
```

### Ajouter des tests

les tests à réaliser doivent être inclus dans le fichier `test/runtests.jl`
une fois fait, on peut lancer les tests : 

```julia
(Module) pkg> test
   Testing Module
 Resolving package versions...
...
   Testing Module tests passed
```
##### Ajouter des dépendances spécifiques aux tests
pour ajouter des dépendances spécifiques aux tests (ou à la génération de la documentation)
il faut activer l'environnement `test/` et ajouter les modules utilisés:

```julia
(Module) pkg> activate ./test
[ Info: activating environment at `/Module/test/Project.toml`.
(test) pkg> add Module3
 Resolving package versions...
  Updating `/Module/test/Project.toml`
  [8dfed614] + Module3
  Updating `/Module/test/Manifest.toml`
  [...]
```
comme pour l'environnement principal les dépendances sont ajoutées dans un fichier `test/Manifest.toml`.

Consultez [cette page](https://julialang.github.io/Pkg.jl/v1/creating-packages/) savoir plus sur la création des packages en Julia.
