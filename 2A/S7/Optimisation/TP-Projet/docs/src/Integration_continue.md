# Intégration continue avec Travis CI

### L'Intégration continue
[L'intégration continue](https://en.wikipedia.org/wiki/Continuous_integration) est un ensemble de pratiques utilisées en génie logiciel consistant à vérifier à chaque modification de code source que le résultat des modifications ne produit pas de régression dans l'application développée, Le principal but de cette pratique est de détecter les problèmes d'intégration au plus tôt lors du développement. De plus, elle permet d'automatiser l'exécution des suites de tests et de voir l'évolution du développement du logiciel.

* Les principaux avantages d'une telle technique de développement sont :

   * le test immédiat des modifications 
   * la notification rapide en cas de code incompatible ou manquant 
   * les problèmes d'intégration sont détectés et réparés de façon continue, évitant les problèmes de dernière minute 
   * une version est toujours disponible pour un test, une démonstration ou une distribution.
  
### Travis CI

[**Travis CI**](http://travis-ci.com) est un logiciel libre d'intégration continue. Il fournit un service en ligne utilisé pour compiler, tester et déployer le code source des logiciels développés, notamment en lien avec le service d'hébergement du code source GitHub. Le logiciel est publié sous [licence MIT](https://fr.wikipedia.org/wiki/Licence_MIT). Sa configuration s'effectue en [YAML](https://fr.wikipedia.org/wiki/YAML).

 ### Lancement des jobs sur Travis CI

 Pour lancer des jobs sur Travis : 

1. Allez sur [Travis CI](travis-ci.com) ensuite *Sign up with GitHub*.
2. Acceptez l'autorisation de Travis CI. Vous serez redirigé vers GitHub.
3. Cliquez sur votre photo de profil en haut à droite de votre tableau de bord Travis, cliquez sur Paramètres puis sur le bouton vert *Activate button* et sélectionnez les dépôts que vous souhaitez utiliser avec Travis CI.
4. Maintenant , il ne reste que d'ajouter un fichier `.travis.yml` dans la racine de votre dépôt.
   ce fichier doit contenir les informations suivantes : le langage utilisé et les versions sur lequels vous voulez lancer les tests.
   par exemple : 

```yml
language: julia
os:
  - osx
  - linux
  - windows 
julia:
  - 1.0.5
  - 1.4
  - 1.5 
```
le job des tests est configuré par défaut, mais il faudra avoir un fichier `runtests.jl` dans le dossier `test` sinon vous devrez personnaliser votre test, par exemple :

```yml
language: julia
os:
  - osx
  - linux
  - windows 
julia:
  - 1.0.5
  - 1.4
  - 1.5 
script:
  - julia -e 'using Pkg; Pkg.instantiate(); Pkg.develop(PackageSpec(path=pwd()))'
  - julia test/test1.jl
  - julia test/test2.jl
``` 

Travis CI peut être utilisé pour deployer votre documentation dans les [Github pages](https://docs.travis-ci.com/user/deployment/pages/).
pour se faire, créez un job spécifique pour la documentation : 

```yml
jobs:
  include:
    - stage: Documentation
      julia: 1.4
      os: linux
      script:        
        - julia --project=docs -e 'using Pkg; Pkg.instantiate(); Pkg.develop(PackageSpec(path=pwd()))'        
        - julia --project=docs docs/make.jl
      after_success: skip
```

- Dans ce script on utilise un `stage` ("Documentation" n'est qu'un nom), pour en savoir plus [consultez cette page](https://docs.travis-ci.com/user/build-stages/).
- Pour personnaliser les notifications de Travis, [consultez cette page](https://docs.travis-ci.com/user/notifications/).
- Pour lancer des applications sur Heroku, [consultez cette page](https://docs.travis-ci.com/user/deployment/heroku/).
- Pour personnaliser votre build, [consultez cette page](https://docs.travis-ci.com/user/customizing-the-build)

### Déploiement de la documentation 

Si vous voulez déployer votre doc sur *Github pages*, vous devez avoir dans votre fichier `docs/make.jl`, dans le cas de Julia, un appel à la fonction [`deploydocs()`](https://juliadocs.github.io/Documenter.jl/stable/lib/public/#Documenter.deploydocs) du package [`Documenter`](https://juliadocs.github.io/Documenter.jl/stable/lib/public/#Documenter) en donnant comme paramètre le dépôt surlequel vous voulez déployer, exemple :
```julia
deploydocs(repo   = "github.com/username/myrepo.git")
```
la branche de déploiement est par défaut `branch = "gh-pages"`, et celle du développement est `devbranch="master"`,consultez la documentation de la fonction [`deploydocs()`](https://juliadocs.github.io/Documenter.jl/stable/lib/public/#Documenter.deploydocs) pour en savoir plus.

À chaque `push` ou `pull request` Travis-CI va exécuter ce fichier, et pour lui donner les droits à faire des modifications dans votre branche du dépoiement (`gh-pages` par défaut) suivez les étapes suivantes : 

- Dans le dossier contenant votre module Julia, dans la console julia utilisez la fonction [`genkeys(MonModule)`](https://juliadocs.github.io/Documenter.jl/stable/lib/public/#DocumenterTools.genkeys) du package `DocumenterTools` pour récuperer la clé ssh et la clé de sécurité: 

```julia
julia> using MonModule # s'il ne trouve pas le module, faites activate ./ dans la racine de votre module
julia> using DocumenterTools
julia> DocumenterTools.genkeys(MonModule)
```
Ensuite,

- Allez sur `https://github.com/username/myrepo/settings/keys` et àjoutez la clé ssh ("ssh-rsa ...") à votre dépôt,mettez comme nom `documenter` et **cochez** *read/write access*.

- Allez sur `https://travis-ci.com/github/username/myrepo/settings` ajoutez une *secure environment variable* avec le nom `DOCUMENTER_KEY` en donnant comme valeur la deuxième clé ().

!!! warning "Note"

    - Vous devez avoir suffisamment de droits pour pouvoir effectuer ces modifications. 
    - Evitez de copier un espace de plus en récupérant les deux clés.
