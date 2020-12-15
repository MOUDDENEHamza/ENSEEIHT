Transactions et mémoire transactionnelle
========================

Cette archive contient

- une classe `Simulator` qui correspond au point d'entrée du simulateur de mémoire transactionnelle. Elle contient la méthode main.
- 2 paquetages `tm` et `simulation`, qui contiennent respectivement les classes des  éléments de mémoire transactionnelle et les classes des différentes simulations.
- un Makefile pour compiler le code source. **Cette approche est recommandée par rapport à l'utilisation d'un IDE comme Eclipse**.
- un dossier `scenarios` qui contient des exemples de scénarios d'accès à une mémoire transactionnelle.
    * `scenario0` est destiné  (uniquement) au simulateur en mode interpréteur (pas à pas)
    *  `scenario1`, `scenario2` et `scenario3` sont destinés (uniquement) au simulateur en mode "simulation complète"

Utilisation du simulateur en mode "Interpréteur (pas à pas)"
---------------------
- *Compilation* : `make`
- *Exécution* : `make shell`
- *Aide (dans le simulateur)* : `help`
- *Lancement d'un scénario (dans le simulateur)* : `run <nom scénario>`

Le fichier `scenario0` correspond au premier scénario de la section 3 du sujet, pour le protocole PP.  
*Note* :  `<nom scénario>` correspond au *chemin d'accès* au fichier. 

Utilisation du simulateur en mode "Simulation complète"
---------------------
- *Compilation* : `make`
- *Exécution* : `make simu SCEN=<nom_scénario>`

Les fichiers `scenario1`, `scenario2` et `scenario3` correspondent
aux scénarios proposés dans la section 4 du sujet.  
*Note* :  `<nom scénario>` correspond au *chemin d'accès* au fichier. 
