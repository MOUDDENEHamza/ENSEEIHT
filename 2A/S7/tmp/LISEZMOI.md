Ce répertoire correspond à l'arborescence de fichiers que doivent **impérativement**
respecter vos rendus

- le répertoire config contient les fichiers d'initialisation pouvant être utiles lors du lancement de la plateforme
- le répertoire data accueille les fichiers de données de l'application
- le répertoire doc accueille les rapports attendus
- le répertoire src contient les codes sources. Ce répertoire contient lui-même les sous-répertoires suivants
  - application, pour le code des applications
  - config, pour les utilitaires de configuration
  - formats, pour la spécification et la réalisation des formats
  - hdfs, pour la mise en œuvre de hdfs
  - ordo pour l'ordonnancement et le contrôle des tâches Map/Reduce
  
En outre,

- le répertoire data contient un fichier d’entrée pour l’application de comptage de mots, ainsi que le fichier résultat correspondant.
**Votre implémentation devra permettre d’exécuter cette application, qui devra obligatoirement donner exactement le même résultat à partir de ce fichier d’entrée.**

- le répertoire src contient des interfaces et des propositions d'ébauche pour certaines classes de la plateforme hidoop :

  - src/application contient les versions itératives et map-reduce du comptage de mots. **La version map-reduce doit pouvoir tourner sur votre plateforme sans avoir à y apporter aucune modification.** Pour pouvoir fonctionner sans modifications, la version itérative de l'application de comptage de mots (Count.java) suppose simplement  l'existence d'un attribut statique PATH d'une classe Projet située dans le répertoire hidoop/src/config. Cet attribut est supposé contenir le chemin d'accès au répertoire hidoop (celui qui contient le fichier LISEZMOI.md/html que vous êtes en train de lire).

  - src/formats contient 
  
      - les interfaces pour la gestion des formats, ainsi que l'implémentation de la classe KV. Ces interfaces doivent être respectées sans aucune modification. Il est toutefois possible d'étendre le type énuméré Format.Type, pour prendre en compte de nouveaux formats.
      - la classe KVFormat, qui implémente le format KV, avec une variante (KVFormatS, moins efficace, mais plus adaptée à la sérialisation)
      - la classe LineFormat, qui implémente le format ligne de texte, avec une variante (LineFormatS, moins efficace, mais plus adaptée à la sérialisation)
  - src/hdfs contient une proposition  (non obligatoire) de squelette pour HdfsClient
  - src/map contient les interfaces pour les tâches Map-Reduce. Ces interfaces doivent être respectées sans aucune modification.
  - src/ordo contient les interfaces Worker et JobInterface, qui doivent être respectées sans aucune modification, ainsi que des propositions pour des interfaces JobInterfaceX  et SortComparator, qui visent à étendre les possibilités de JobInterface, pour permettre de paramétrer la gestion des tâches map et reduce.