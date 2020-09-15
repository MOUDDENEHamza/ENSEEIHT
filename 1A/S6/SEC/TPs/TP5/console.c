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
    /* Initialisation du pseudo*/
    strcpy(pseudo, argv[1]);

    /* création des tubes de service (à faire) */
    sprintf(tubeC2S, "%s_C2S", pseudo);
    sprintf(tubeS2C, "%s_S2C", pseudo);

    int m1 = mkfifo(tubeC2S, 0600);
    int m2 = mkfifo(tubeS2C, 0600);
    if (m1 == -1) {
	perror("Erreur creation tube client --> serveur\n");
	exit(1);
    }
    if (m2 == -1) {
	perror("Erreur creation tube serveur --> client\n");
	exit(1);
    }
    /* connexion */
    int w = write(ecoute, pseudo, strlen(pseudo) +1);
    if (w == -1 ) {
	perror("Erreur ecriture du pseudo dans le tube\n");
	exit(1);
    }


    if (strcmp(pseudo,"fin")!=0) { 
	/* "console fin" provoque la terminaison du serveur */
	/* client "normal" */

	/* initialisations */
	strcpy(saisie,"");
	C2S = open(tubeC2S, O_WRONLY);
	if (C2S == -1) {
	    perror("Erreur ouverture tube client --> serveur\n");
	    exit(1);
	}
	S2C = open(tubeS2C, O_RDONLY);
	if (S2C == -1) {
	    perror("Erreur ouverture tube serveur --> client\n");
	    exit(1);
	}

	/* ouverture des tubes de service seulement ici  car il faut que la connexion 
	   au serveur ait eu lieu pour qu'il puisse effectuer l'ouverture des tubes de service
	   de son côté, et ainsi permettre au client d'ouvrir les tubes sans être bloqué */
	while (strcmp(saisie,"au revoir")!=0) {
	    /**Preparation du tampon fd_set du select **/
	    FD_ZERO(&readfds);
	    FD_SET(0,&readfds);   //Ajout du descripteur de l'entrée standard (clavier)
	    FD_SET(S2C,&readfds);  // Ajout du descripteur du tube serveur --> client

	    /** Appel de la primitive select **/
	    int val_select = select(NBDESC, &readfds, NULL, NULL, NULL);

	    if (val_select == -1) {
		perror("Erreur appel select dans le client ");
		exit(1);
	    } else if (FD_ISSET(S2C, &readfds)) {
		/** Tube serveur - client pret **/
		bzero(message, TAILLE_MSG);
		nlus = read(S2C,message,TAILLE_MSG);
		if (nlus == -1) {
		    perror("Erreur lecture message");
		    exit(1);
		}
		/** Enregistrement et affichage du message**/
		strcpy(discussion[curseur],message);
		afficher(curseur);
		if (curseur < NB_LIGNES) {
		    curseur++;
		} else {
		    curseur = 0; 
		}

	    } else if (FD_ISSET(0,&readfds)) {
		/**  Ecran pret **/

		/* Vider les tampons de saisie et de message*/
		bzero(message,TAILLE_MSG);
		bzero(saisie,TAILLE_SAISIE);
		nlus = read(0,saisie,TAILLE_SAISIE);
		if (nlus == -1) {
		    perror("Erreur lecture");
		    exit(1);
		}
		/**Envoyer les messages de la saisie au serveur **/
		sprintf(message, "[%s] %s", pseudo, saisie);
		necrits = write(C2S, message, TAILLE_MSG);
		if (necrits == -1) {
		    perror("Erreur ecriture tube");
		    exit(1);
		}
	    }
	}
    }
    /* nettoyage des tubes de service */
    close(S2C);
    close(C2S);
    unlink(S2C);
    unlink(C2S);

}
