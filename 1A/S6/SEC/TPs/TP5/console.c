/* version 0.1 (PM, 12/5/19) :
   Le client de conversation
   - crée deux tubes (fifo) d'E/S, nommés par le nom du client, suffixés par _C2S/_S2C
   - demande sa connexion via le tube d'écoute du serveur (nom supposé connu),
   en fournissant le pseudo choisi (max TAILLE_NOM caractères)
   - attend la réponse du serveur sur son tube _C2S
   - effectue une boucle : select sur clavier et S2C.
   - sort de la boucle si la saisie au clavier est "au revoir"
   Protocole
   - les échanges par les tubes se font par blocs de taille fixe TAILLE_MSG,
   - le texte émis via C2S est préfixé par "[pseudo] ", et tronqué à TAILLE_MSG caractères
Notes :
-le  client de pseudo "fin" n'entre pas dans la boucle : il permet juste d'arrêter
proprement la conversation.
 */

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>

#define TAILLE_MSG 128				/* nb caractères message complet ([nom]+texte) */
#define TAILLE_NOM 25					/* nombre de caractères d'un pseudo */
#define NBDESC FD_SETSIZE-1		/* pour le select (macros non definies si >= FD_SETSIZE) */
#define TAILLE_RECEPTION 512	/* capacité du tampon de messages reçus */
#define NB_LIGNES 20
#define TAILLE_SAISIE 512		/* capacité du tampon pour les lignes saisies 
					   (hypothèse : pas de caractère de plus de 4 octets) */

char discussion [NB_LIGNES] [TAILLE_MSG]; /* derniers messages reçus */

void afficher(int depart) { 
    /* affiche les lignes de discussion[] en commençant par la plus ancienne (départ+1 % nbln)
       et en finissant par la plus récente (départ) */
    int i;
    system("clear");  /* nettoyage de l'affichage simple, à défaut d'être efficace (1) */
    printf("==============================(discussion)==============================\n");
    for (i=1; i<=NB_LIGNES; i++) {
	printf("%s\n", discussion[(depart+i)%NB_LIGNES]);
    }
    printf("------------------------------------------------------------------------\n");
}

int main (int argc, char *argv[]) {
    int i,nlus,necrits;
    char * buf0;						/* pour parcourir le contenu reçu d'un tube */

    int ecoute, S2C, C2S;		/* descripteurs tubes de service*/
    int curseur = 0;				/* position (affichage) dernière ligne reçue et affichée */

    fd_set readfds;					/* ensemble de descripteurs écoutés par le select */

    char tubeC2S [TAILLE_NOM+5]; /* chemin tube de service client -> serveur = pseudo_c2s */
    char tubeS2C [TAILLE_NOM+5]; /* chemin tube de service serveur -> client = pseudo_s2c */
    char pseudo [TAILLE_NOM];
    char message [TAILLE_MSG];
    char saisie [TAILLE_SAISIE];	/* tampon recevant la ligne saisie au clavier */
    char buf [TAILLE_RECEPTION];	/* tampon recevant les messages du tube s2c */

    if (!((argc == 2) && (strlen(argv[1]) < TAILLE_NOM*sizeof(char)))) {
	printf("utilisation : %s <pseudo>\n", argv[0]);
	printf("Le pseudo ne doit pas dépasser 25 caractères\n");
	exit(1);
    }

    /* ouverture du tube d'écoute */
    ecoute = open("./ecoute",O_WRONLY);
    if (ecoute==-1) {
	printf("Le serveur doit être lance, et depuis le meme repertoire que le client\n");
	exit(2);
    }

    /* création des tubes de service (à faire) */
    sprintf(tubeC2S, "%s_C2S", argv[1]);
    sprintf(tubeS2C, "%s_S2C", argv[1]);

    /* connexion (à faire) */
    /* Création des tubes nommés en accès écriture et lecture */
    mkfifo(tubeC2S, 0600);
    mkfifo(tubeS2C, 0600);

    /* On envoie le pseudo au serveur */
    write(ecoute, argv[1], strlen(argv[1]) + 1);

    /* Ouverture des tubes */
    if ((C2S = open(tubeC2S, O_WRONLY)) < 0){
	perror("open C2S");
	exit(3);
    }
    if ((S2C = open(tubeS2C, O_RDONLY)) < 0){
	perror("open S2C");
	exit(4);
    }

    if (strcmp(pseudo,"fin")!=0) { /* "console fin" provoque la terminaison du serveur */
	/* client "normal" */

	/* initialisations (à faire) */
	/* ouverture des tubes de service seulement ici  car il faut que la connexion 
	   au serveur ait eu lieu pour qu'il puisse effectuer l'ouverture des tubes de service
	   de son côté, et ainsi permettre au client d'ouvrir les tubes sans être bloqué */

	while (strcmp(saisie,"au revoir")!=0) {
	    /* boucle principale (à faire) :
	     * récupérer les messages reçus éventuels, puis les afficher.
	     - tous les messages comportent TAILLE_MSG caractères, et les constantes
	     sont fixées pour qu'il n'y ait pas de message tronqué, ce qui serait
	     pénible à gérer.
	     - lors de l'affichage, penser à effacer les lignes avant de les affecter
	     pour éviter l'affichages de caractères parasites si l'ancienne ligne est
	     plus longue que la nouvelle.
	     * récupérer la ligne saisie éventuelle, puis l'envoyer
	     */

	    /* Préparation au select a suivre */
	    FD_ZERO(&readfds);
	    FD_SET(S2C, &readfds);
	    FD_SET(0, &readfds);
	    i = select(NBDESC, &readfds, NULL, NULL, NULL);
	    if (i > 0) {
		/* Si un canal est prêt */
		if (FD_ISSET(S2C, &readfds)) {
		    bzero(message, TAILLE_MSG);
		    /* Lecture du message */
		    if ((read(S2C, message, TAILLE_MSG)) < 0) {
			perror("deconnexion serveur");
		    } else {
			/* Affichage du message */
			strcpy(discussion[curseur], message);
			afficher(curseur);
			/* Positionner le curseur */
			if(curseur < NB_LIGNES){
			    curseur++;
			} else {
			    curseur = 0;
			}
		    }
		}
		/* Si l'écran est prêt */
		if (FD_ISSET(0, &readfds)) {
		    /* transmission du message au serveur */
		    bzero(message, TAILLE_MSG);
		    bzero(saisie, TAILLE_SAISIE);
		    read(0, saisie, TAILLE_SAISIE);
		    sprintf(message, "[%s] %s", pseudo, saisie);
		    write(C2S, message, TAILLE_MSG);
		}
	    }
	}
    }
    /* nettoyage des tubes de service (à faire) */
    unlink(tubeC2S);
    unlink(tubeS2C);
    printf("fin client\n");
    exit (0);
}

/* Note
 * (1) :	Pour éviter un appel de system() à chaque affichage, une solution serait,
 à l'initialisation du main(), d'appeler system("clear > nettoie"), pour récupérer
 la séquence spécifique au terminal du client permettant d'effacer l'affichage, 
 puis d'ouvrir nettoie en écriture, pour en écrire le contenu à chaque affichage.
 Cependant, le surcoût n'est pas vraiment critique ici pour l'application.
 Le principe (donné dans le sujet) est que tous les processus ouvrent les tubes
 dans le même ordre, pour éviter un interblocage (méthode des classes ordonnées).
 */
