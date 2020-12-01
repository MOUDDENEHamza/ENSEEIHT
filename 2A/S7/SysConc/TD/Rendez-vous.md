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
- demandes d'entrée EO : C_entréeEO
- demandes d'entrée OE : C_entréeOE
- demandes de sorties : C_sortie
3. Méthodes des clients :
Entrer(maDirection):
  if maDirection == OE
    DemanderEntréeOE // Demande d'entrer sur C_entréeOE
  else if maDirection == EO
    DemanderEntréeEO // Demande d'entrer sur C_entréeEO
  fin if

Sortir():
  DemanderSortie // Demander de sortir sur C_sortie (prévenir qu'on sort)
4. Code du serveur (voie unique) :
`while(true)
  select
    when etat == EO:
      accept DemanderEntréeEO; nbTrains++;
  or
    when etat == OE:
      accept DemanderEntréeOE; nbTrains++;
  or
    when etat == libre:
      select
          accept DemanderEntréeEO;
          etat = EO;
      or
          accept DemanderEntréeOE;
          etat = OE;
      fin select
      nbTrains++;
  or 
    when nbTrains > 0:
      accept DemanderSortir;
      nbTrains- -;
      if nbTrains == 0:
        etat = libre;
      fin if
  fin select
fin while
while(true)
  select // Le serveur se bloque là
    when etat == EO ou etat == libre:
      // Le serveur ne se bloque pas ici
      accept DemanderEntréeEO; nbTrains++; etat = EO;
      // Le serveur se bloque là
      accept DemanderEntréeEO; nbTrains++; etat = EO;
      // Le serveur se bloque là
      accept DemanderEntréeEO; nbTrains++; etat = EO;
  or
    when etat == OE ou etat == libre:
      accept DemanderEntréeOE; nbTrains++; etat = OE;
  or
    when etat == OE ou etat == EO :
      accept DemanderSortir;
      nbTrains- -;
      if nbTrains == 0:
        etat = libre;
      fin if
  fin select
fin while

case (etat)
  toto =>
  select
    accept tutu;
  or 
    accept tata;
  fin select
fin case

while (true)
  case (etat)
    libre => 
      select
        accept DemanderEntréeEO; nbTrains++; etat = EO;
      or
        accept DemanderEntréeOE; nbTrains++; etat = OE;
      fin select
    EO =>
      select
        accept DemanderEntréeEO; nbTrains++;
      or
        accept DemanderSortie; nbTrains- -;
        if nbTrains == 0
          etat = libre;
        fin if
      fin select
     OE =>
      select
        accept DemanderEntréeOE; nbTrains++;
      or
        accept DemanderSortie; nbTrains- -;
        if nbTrains == 0
          etat = libre;
        fin if
      fin select
   fin case
 fin while`
 
## Un album sociofinancé
 
 1. Variables d'états:
reçu : entier := 0;
 2. Canaux :

- canaux pour les paiements : C_payer(edited)

- canaux pour les écoutes : C_écouter

3. Méthodes des clients :

Payer(p : entier naturel)
  DemanderPayer(p)

Ecouter()
  DemanderEcouter

4. Méthodes des clients :
`while (true)
   select
     when reçu < S:
       accept DemanderPayer(p) do
         reçu += p;
       fin accept
   or
     when reçu >= S:
        accept DemanderEcouter;
   fin select
fin while`

## Un tournoi de bridge

1. Variables d'état:
ne : joueurs en attente d'entrée := 0
ns : joueurs en attente de sortie := 0
(a) ne >= 1 et ns >= 1
(b) ne >= 1 et ns >= 1 (avec ne dans [0,3] et ns dans [0,3])
(c) ns == 0
(d) ne == 0
(e) ne + ns <= 4
