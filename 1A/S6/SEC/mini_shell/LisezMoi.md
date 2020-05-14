Introduction
------------
Le code fourni a pour but de vous décharger du travail d'analyse d'une ligne de commande,
avant son interprétation par le shell. Il propose une fonction `readcmd()` qui fournit
le résultat de cette analyse.

Le source est fourni non pas à titre d'exemple (il n'est pas d'une clarté éblouissante),
mais à titre de documentation (et de spécification :)) ;  il n'est ni
 nécessaire, ni conseillé de le modifier pour réaliser le travail demandé : l'analyse
 réalisée est suffisante pour la syntaxe des commandes que votre shell doit interpréter.
 
 Ce code est a priori tout à fait fiable, mais n'hésitez cependant pas à nous signaler 
 ce qui vous apparaîtrait comme des anomalies, ou des lacunes dans la documentation.

La structure `cmdline`
----------------------
L'appel à readcmd() retourne une structure cmdline, qui contient le résultat de l'analyse
de la ligne de commande pour le shell.
Cette structure contient notamment :

- l'indication du fait que la commande doit être lancée en tâche de fond ou non
- les redirections éventuelles
- la décomposition de la ligne de commande en commandes élémentaires, et la décomposition
 de chaque commande en mots. Le champ `seq` référence le résultat de cette décomposition,
 qui est vu comme un tableau à deux dimensions [commandes élémentaires, mots de la commande]
 
 **Pour plus de détails, voir le fichier d'en-tête `readcmd.h`.**
 
**Exemples :**

- "ls -l" : seq[0][0] = "ls", seq[0][1] = "-l", seq[0][2] = NULL, seq[1] = NULL, backgrounded = NULL, in = NULL, out = NULL
- "ls -l > toto" : seq[0][0] = "ls", seq[0][1] = "-l", seq[0][2] = NULL,
 seq[1] = NULL, backgrounded = NULL, in = NULL, out => "toto"
- "ls | grep toto | wc -l" : seq[0][0] = "ls", seq[0][1] = NULL, 
seq[1][0] = "grep", seq[1][1] = "toto",  seq[1][2] = NULL, 
seq[2][0] = "wc", seq[0][1] = "-l", seq[0][2] = NULL,
seq[3] = NULL, backgrounded = NULL, in = NULL, out = NULL
- "sleep 100 &" : seq[0][0] = "sleep", seq[0][1] = "20",  backgrounded != NULL, in = NULL, out = NULL