# Julia vs MatLab

Cette page se veut une description sommaire des différences entre les languages de programmation MatLab et Julia. Cette page ne se veut pas être une revue exhaustive ni complète des différences entre ces deux langages, mais un sommaire permettant à un utilisateur habitué à MatLab de pouvoir être minimalement fonctionnel sur Julia. Un complément d'informations peut être trouvé sur cette page web de la documentation de Julia [Noteworthy Differences from other Languages](https://docs.julialang.org/en/v1/manual/noteworthy-differences/).

## Quelques fonctions usuelles

Le tableau suivant se veut un recensement non-exhaustif de certaines commandes
usuelles sur MatLab et Julia.

| Opération                     | MatLab    | Julia     | Librairie requise     |
| :---:                         | :---:     | :--:      | :--:                  |
| Vecteur linéairement espacé   | linspace  | LinRange  |                       |
| Valeur maximale d'un array    | max       | maximum   |                       |
| Valeur minimale d'un array    | min       | minimum   |                       |
| Résolution système linéaire   | \         | \         | LinearAlgebra         |
| Norme d'un vecteur            | norm      | norm      | LinearAlgebra         |
| Norm d'une matrice            | norm      | opnorm    | LinearAlgebra         |
| Affichage sur la console      | fprintf   | @printf   | Printf                |
| Moyenne d'un array            | mean      | mean      | Statistics            |
| Affichage d'un graphique      | plot      | plot      | Plots                 |


Une des différences majeures entre Julia et MatLab est que MatLab représente par
défaut ces données dans dans des matrices contenant des `Float64`, tandis que
Julia type *fortement* ces variables. Notamment, Julia distingue les `integer` et
les `float` à l'aide d'un point `.` suivant immédiatemment le nombre. Par exemple,
la commande suivante crée un `integer` (`Int64` sur la majorité des machines):

```@repl 1
a = 3
typeof(a)
```
Alors que la syntaxe suivante crée un `float` (`Float64` sur la majorité des machines):

```@repl 1
b = 3.
typeof(b)
```

Aussi, Julia fait la différence
entre une variable de type `Float64` et un vecteur contenant des `Float64`.

```@repl 1
c = -1.
d = [-1.]
```

Ceci engendre donc des différences dans l'utilisation de certaines fonctions.
Par exemple, si l'on veut calculer les valeurs absolues d'un `Float64` et les
valeurs absolues des éléments d'un vecteur (ou d'une matrice), on obtient les
résultats suivants:

```@repl 1
abs(c)
abs(d)
```

Il sera indiqué à la section [`Opérations sur des vecteurs et des matrices`](@ref creation_vec_mat)
comment effectuer cette opération simple à effectuer sur MatLab.

## Création de vecteurs et de matrices

La première différence notable avec MatLab est le fait que Julia distingue les
vecteurs des matrices. Les vecteurs sont des `array` de dimension 1, alors que
les matrices sont des `array` dimension 2. En Julia, la convention adoptée est
de type *column-major order*, les vecteurs sont de type colonne. Afin de créer
un vecteur sur Julia, on emploie les crochets `[]` et on sépare les éléments par
des virgules ou des point-virgules `;`.

```@repl 2
x = [1,2,3]
y = [1;2;3]
```

Les matrices sont quant à elles créées encore à l'aide de crochets `[]`, mais
les éléments sur une même ligne doivent être séparés pas des espaces et un saut
de ligne s'indique par le point-virgule `;`.

```@repl 2
A = [1 2 3; 4 5 6]
```

!!! note
    La commande suivante créera un `array` de dimension 2 possédant une ligne
    et 3 colonnes au lieu d'un vecteur

    ```@repl 2
    z = [1 2 3]
    ```

## [Opérations sur des vecteurs et des matrices](@id creation_vec_mat)

Julia récupère quelques éléments syntaxiques de MatLab concernant les opérations
sur *arrays*, mais diffère sur quelques points. Comme dans
MatLab, les opérations *élément par élément* s'effectuent à l'aide du point `.`.
Ainsi, les opérations suivantes sont les mêmes que sur MatLab.

```@repl 3
v=[1,2]
B=[1 2 ; 3 4]
C=[5 -6 ; -7 8]

B*C
B.*C

B^2
B.^2

B*v
B.*v
```

La multiplication d'un vecteur ou une matrice par un nombre est définie comme sur
MatLab.

```@repl 3
2.5*v
2.5*B
C/3
```

Les opérations différentes concernent notamment les opérations d'addition/soustraction
et les comparaison logique. L'addition/soustraction d'un nombre et d'un vecteur/matrice
n'est pas définie en Julia, il faut donc utiliser le `.`.

```@repl 3
2 + B
2 .+ B
B - C
B .- C
```

Pour les opérateurs logiques, il faut aussi employer le `.` afin de comparer
*éléments par éléments*.

```@repl 3
2 == B
2 .== B
2 .<= B

B<C
B.<C
```

!!! warning "Important"
    Étant donné que le point `.` permet à la fois de définir un `float` et d'effectuer
    les opérations *éléments par éléments*, il faut mettre des espaces entre les
    points afin de pouvoir distinguer la signification de chaque point `.`. La
    commande suivante:

    ```repl
    5.+[1,2]
    ```
    produira le message d'erreur suivant:

    ```repl
    ERROR: syntax: invalid syntax "5.*"; add space(s) to clarify
    ```

    Il faut alors utiliser la syntaxe suivante:

    ```
    5. .+ [1,2]
    ```

Les fonctions mathématiques standards définies sur ``\mathbb{R}`` n'acceptent
pas des vecteurs sous Julia. Il faut donc employer le point `.` immédiatemment
après le nom de la fonction afin d'appliquer la fonction *élément par élément*.

```@repl 3
cos(v)
cos.(v)
mod(B,3)
mod.(B,3)
```

Cette syntaxe s'applique à toute les fonctions écrit sur Julia, que cela soit
les fonctions des librairies standards de Julia ou des fonctions créées par
l'utilisateur.


!!! warning "Avertissement"

    Certaines fonctions mathématiques sont définies sur des matrices carrés, tels
    les fonctions trigonométriques, l'exponentiation et la puissance. Il faut
    donc faire attention à savoir si l'on veut effectuer ces opérations sur la
    matrice ou sur les éléments de la matrice. L'exemple suivant illustre ces
    différences:

    ```repl
    M=[0 1 ; 2 -1]
    exp(M)
    ```
    produit le résultat suivant:

    ```repl
    2×2 Array{Float64,2}:
    1.8573   0.860982
    1.72196  0.996317
    ```

    Alors que la commande suivante:

    ```repl
    exp.(M)
    ```

    effectue l'exponentiation *élément par élément*:

    ```repl
    2×2 Array{Float64,2}:
    1.0      2.71828
    7.38906  0.367879
    ```



## Indexation, *slices* et concaténation de vecteurs et de matrices

On accède aux éléments d'un vecteur ou d'une matrice à l'aide des crochets `[]`
comparativement à MatLab ou l'on accède aux éléments avec les parenthèse `()`.
Le reste de la syntaxe est identique à celle de MatLab, la numérotation commence
à 1 et le dernier élément peut être extrait avec `end`. Les dimensions sont aussi
séparées par des virgules `,`.

```@repl 4
w=[-1,2,3]
E=[1 2 3 ; 4 5 6 ; 7 8 9]

w[2:end]
E[[1,3],1:2]
E[[1,3],[1:2]]
```

La dernière commande engendre une erreur, ce qui permet d'illustrer une subtile
différence entre Julia et MatLab. MatLab interprète la commande `[1:2]` en créant
un vecteur contenant `[1,2]`, alors que Julia crée un *array* d'*array*, ce qui
génère l'erreur.

La concaténation s'effectue selon la même logique que la création d'une matrice,
on emploie l'espace pour concaténer horizontalement et le point-virgule `;` pour concaténer
verticalement  

```@repl 4
[E E]
[E;E]
[w E]
[E ; w']
```

La syntaxe pour modifier un ou des éléments d'un vecteur ou d'une matrice est
la même que sur MatLab. Toutefois, puisque Julia est *fortement typé*, les
commandes suivantes produisent des erreurs étant donné que les types ne concordent pas.

```@repl 4
E[1,1] = [-1]
E[2:3,[1,3]] = -4
```

En comparaison, les commandes suivantes ne produisent pas d'erreurs:

```@repl 4
E[1,1] = -1
E[1:1,1] = [-1]
E[2:3,[1,3]] .= -4
```

## Passer par valeur ou par référence?

Une différence majeure entre MatLab et Julia est le fait que MatLab effectue des
copies de ses variables, alors que Julia effectue parfois le référencement.

```@repl 7
A = [1 2 ; 3 4]
B = A;
B[1,1] = -9;
A
```

La deuxième commande ne crée pas une copie de `A`, mais indique plutôt que `B`
pointe vers le même espace mémoire que `A`. Ainsi, toute modification à `A` ou
à `B` sera effectuée sur les deux variables.

Toutefois, dès qu'une opération de *slices* consistant à extraire un sous-vecteur
d'un *array* est effectuée, une copie est créée.

```@repl 7
A = [1 2 ; 3 4]
C = A[1,:]
A[1,1] = -5;
C
```

Si l'on veut que la variable `C` pointe vers l'espace mémoire de `A`, il faut
plutôt employer la fonction `view`.

```@repl 7
A = [1 2 ; 3 4]
D = view(A,1,1:2)
A[1,1] = -3;
D
```

Lorsqu'un *array* est passé en argument dans une fonction, l'argument est passé
par référence. Ainsi, toute modification de cet *array* dans la fonction se
réflètera à l'extérieur de cette fonction. Ceci constitue une très grosse différence
par rapport à MatLab, où toutes les variables modifiées au sein d'une fonction
sont passées par valeur et non par référence.

```@repl 7
A = [1 2 ; 3 4]
function demo!(M)
    M[1,1] = -11
    T = 1 .+ M
    return T
end

S = demo!(A)
A
```

!!! note
    Par convention, les fonctions modifiant les variables passées en arguments
    sont notées avec un point d'exclamation `!`.

## Création d'une fonction

Sur MatLab, la création de fonctions ne peut s'effectuer qu'à la fin d'un script
ou en écrivant un fichier `.m` contenant la définition d'une fonction. Julia est
plus versatile, car des fonctions peuvent être définies n'importe où dans un script
et même à l'intérieur d'autres fonctions. L'exemple suivant
permet de définir la fonction ``y(x) = x \cos(x) -e^x``.

```@repl 8
function exemple1(x)
    y = x * cos(x) - exp(x)
    return y
end
x = LinRange(0,1,250)
z1 = exemple1.(x)
```

!!! warning "Important"
    la fonction est appellée avec un point étant donné que le veut évaluer la
    fonction sur chaque élément du vecteur `x`.

Cette dernière fonction peut être définie de manière plus compacte ainsi:

```@repl 8
exemple2(x) = x * cos(x) - exp(x)
z2 = exemple2.(x)
```

Voici un exemple d'une fonction permettant de retourner les éléments d'un vecteur
plus petit ou égal à une valeur `p` et les valeurs strictement plus grande que `p`.

```@repl 8
function exemple3(x,p)
    vector_petit = x[x .<= p]
    vector_grand = x[x .> p]
    return vector_petit , vector_grand
end

test = [1,5,-9,3,-5,2,8,12,7]
(vec1,vec2) = exemple3(test,2);
vec1
vec2
```

## Scope/portée des variables

Une autre différence majeure entre MatLab et Julia réside dans la portée/scope
des variables. Sur MatLab, les variables globales doivent être déclarées à la
fois dans le script et dans les fonctions employant ces variables. Ces variables
peuvent être modifiées et ces modifications seront accessibles partout. Sur Julia,
les variables globales sont celles définies dans un script, le REPL ou dans un module.
Les variables globales dans Julia peuvent seulement être modifiées dans le *scope*
global (changer des éléments d'un *array* ne consiste pas à changer la variable).
Les fonctions et les boucles `for/while` introduisent un *scope* local qui hérite
de toutes les variables du *scope parent* (qu'elles soient globales ou locales).
Si une variable introduite dans le *scope* local possède le même nom qu'une
variable globale, une nouvelle variable possédant le même nom sera créée, mais
sa portée sera restreint qu'au *scope* local (c'est pourquoi, dans l'exemple suivant,
 la variable `c` n'est pas définie en dehors de la boucle `for`).

```@repl 11
b = 1
for t=1:5
    b = -2
    c = t + b
    println(c)
end
b
c

function test1()
    b = 3
    println(b)
end
test1()
b
```

Le script suivant produit une erreur étant donné que la variable `b` dans le
*scope* de la boucle `for` ne correspond pas au `b` du scope global. Une nouvelle
variable `b` est alors créée dans le scope de la boucle `for`, ce qui engendre
une erreur puisque cette variable n'est pas initialisée.

```@repl 11
b = 1

for t=1:10
    b = b + 1
end
```

Les variables locales sont aussi passées aux *scopes enfants*. Ces variables
peuvent toutefois être modifiées à l'intérieur de ces *scopes enfants*,
contrairement aux variables globales.

```@repl 11
b = 1
function test2()
    x = 2
    function test_in()
        x = 3
        return x + b
    end
    return test_in() + x
end
test2()
```


## Affichage de textes et de tableaux sur la console

Afin d'afficher une ligne de texte sur MatLab, on emploie la commande `fprintf`,
alors que sur Julia, il faut utiliser la macro `@printf`. Cette macro se retrouve
dans le package `Printf` qui doit être importé. Le reste de la syntaxe reste
néanmoins similaire à celle de MatLab.

```@repl 9
using Printf

n = 1:6; v1 = 2 .^ n; v2 = 2 .^ (1 ./ n);

@printf("n   2^n   2^(1/n)\n")
for t=1:length(n)
    @printf("%2d   %2d   %16.15e\n",n[t],v1[t],v2[t])
end
```

## Affichage de graphiques

Afin d'afficher des graphiques avec Julia, il faut utiliser le *package* [Plots](http://docs.juliaplots.org/latest/),
en employant la commande `using Plots`. Les attributs spécifiant les propriétés
des courbes et des graphiques doivent être décrites lors de la création de
ces mêmes courbes, comparativement à Matlab. L'exemple suivant permet de créer
une courbe rouge représentant la fonction sin et une courbe bleue représentant
la fonction cos.

```@repl 10
using Plots

x = LinRange(-2*pi,2*pi,250); y1 = sin.(x); y2 = cos.(x);

plot(x,y1,label="sin(x)",color="red")
plot!(x,y2,label="cos(x)",color="blue",xlabel="x",ylabel="y",title="Un premier graphique")

plot!([],[],label="",size=(400,300)); savefig("tutorial-plot1.png"); nothing # hide
```

![Graphique #1](tutorial-plot1.png)

Le titre de chaque courbe est spécifié avec l'attribut `label` et la couleur
avec l'attribut `color`. Pour afficher plusieurs courbes sur le même graphique,
il faut utiliser la commande terminée par un `!` (ici la commande est `plot!`).
Finalement, le titre des axes et du graphiques sont spécifiés.

Afin d'afficher des points sur un graphique, on change l'attribut `linetype`
pour `scatter`.

```@repl 10
y3 = 2 .* rand(length(x)) .- 1;

plot!(x,y3,label="random",color="green",linetype="scatter")

plot!([],[],label="",size=(400,300)); savefig("tutorial-plot2.png"); nothing # hide
```

![Graphique #1](tutorial-plot2.png)

Afin de créer un graphique avec des axes en base logarithmique, il faut employer
l'attribut `xscale=:log10` pour l'axe x ou `yscale=:log10` pour l'axe y. Le
package `Plots` génèrera toutefois des erreurs si des éléments sont nuls ou
négatifs lorsque l'on emploie des axes logarithmiques. Il faut donc seulement
selectionner les éléments strictement plus grand que 0.

```@repl 10
data_x = 1:5;
data_y = [1e-3,1e-7,-1e-4,1e-5,0];

plot(data_x[data_y.>0],data_y[data_y.>0],yscale=:log10,title="Graphique avec axe y de type log")

plot!([],[],label="",size=(400,300)); savefig("tutorial-plot3.png"); nothing # hide
```

![Graphique #2](tutorial-plot3.png)

La description complète des attributs des graphiques est disponible à ce lien: [http://docs.juliaplots.org/latest/attributes/](http://docs.juliaplots.org/latest/attributes/).