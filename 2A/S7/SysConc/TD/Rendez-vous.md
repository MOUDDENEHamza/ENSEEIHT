# TD : Rendez-vous

## Voie unique (Brinch Hansen)

/////////////////// Méthodologie ///////////////////
1. Déterminer les variables d'état qui modélisent le système
2. Déterminer les canaux nécessaires pour réaliser les rdvs
3. Écrire les méthodes des clients
4. Écrire le code du serveur
NOUVEAU
/////////////////// Voie unique : un seul train ///////////////////
1. Variables d'état 
libre : bool := true
2. Canaux :
- un canal pour les demandes d'entrée : C_entrée
- un canal pour les demandes de sortie : C_sortie
3. Méthodes des clients :
Entrer(maDirection):
Sortir():
4. Code du serveur (voie unique) :
while(true)
  select
    when libre:
        accept DemanderEntrée;
        libre = false;
    when !libre:
        accept DemanderSortie:
        libre = true;
   fin select
fin while
/////////////////// Voie unique : nombre illimité de trains dans la même direction ///////////////////
1. Variables d'état :
sens : direction := ? (OE ou EO)
nbTrains : entier := 0
2. Canaux :




