/* version 0.2 (PM, 13/5/19) :
   Le serveur de conversation
   - crée un tube (fifo) d'écoute (avec un nom fixe : ./ecoute)
   - gère un maximum de maxParticipants conversations : select
 * tube d'écoute : accepter le(s) nouveau(x) participant(s) si possible
 -> initialiser et ouvrir les tubes de service (entrée/sortie) fournis
 * tubes (fifo) de service en entrée -> diffuser sur les tubes de service en sortie
 - détecte les déconnexions lors du select
 - se termine à la connexion d'un client de pseudo "fin"
 Protocole
 - suppose que les clients ont créé les tube d'entrée/sortie avant
 la demande de connexion, nommés par le nom du client, suffixés par _C2S/_S2C.
 - les échanges par les tubes se font par blocs de taille fixe, dans l'idée d'éviter
 le mode non bloquant
 */

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>

#include <stdbool.h>
#include <sys/stat.h>

#define MAXPARTICIPANTS 5			/* seuil au delà duquel la prise en compte de nouvelles
						   connexions sera différée */
#define TAILLE_MSG 128				/* nb caractères message complet (nom+texte) */
#define TAILLE_NOM 25					/* nombre de caractères d'un pseudo */
#define NBDESC FD_SETSIZE-1		/* pour le select (macros non definies si >= FD_SETSIZE) */
#define TAILLE_RECEPTION 512	/* capacité du tampon de messages reçus */

typedef struct ptp { 					/* descripteur de participant */
    bool actif;
    char nom [TAILLE_NOM];
    int in;		/* tube d'entrée (C2S) */
    int out;	/* tube de sortie (S2C) */
} participant;


participant participants [MAXPARTICIPANTS];

char buf[TAILLE_RECEPTION]; 	/* tampon de messages reçus/à rediffuser */
int nbactifs = 0;

void effacer(int i) { /* efface le descripteur pour le participant i */
    participants[i].actif = false;
    bzero(participants[i].nom, TAILLE_NOM*sizeof(char));
    participants[i].in = -1;
    participants[i].out = -1;
}

void diffuser(char *dep) { /* envoi du message référencé par dep à tous les actifs */
    int i;
    for (i = 0; i< nbactifs ; i++) {
	int w = write(participants[i].out, dep , TAILLE_MSG*sizeof(char));
	if (w == -1) {
	    perror("Erreur diffusion\n");
	    exit(1);
	}
    }
}

void desactiver (int p) {
    /* traitement d'un participant déconnecté (à faire) */
	int i;

    /* Fermer les tubes */
    close(participants[p].in);
    close(participants[p].out);


    /* Effacer le tube de la table des participants */
    effacer(p);

    /* Mettre a jour la table des participants */
    participants[nbactifs] = participants[p];
    for (i=p; i< nbactifs; i++) {
	participants[i] = participants[i+1];
    }
    unlink(participants[nbactifs-1].in);
    unlink(participants[nbactifs-1].out);
    nbactifs--;	
}

void ajouter(char *dep) { // traite la demande de connexion du pseudo référencé par dep
    /*  Si le participant est "fin", termine le serveur (et gère la terminaison proprement)
	Sinon, ajoute le participant de pseudo référencé par dep
     */
    int cmp = strcmp(dep, "fin");
    if (cmp == 0) {
	// Terminer le serveur
	exit(0);
    } else {
	/* ajouter le participant */
	int C2S, S2C;
	char tubeC2S [TAILLE_NOM+5]; 
	char tubeS2C [TAILLE_NOM+5]; 


	sprintf(tubeC2S, "%s_C2S", dep);
	sprintf(tubeS2C, "%s_S2C", dep);

	// Ouverture
	C2S = open(tubeC2S, O_RDONLY);
	if (C2S == -1) {
	    perror("Erreur d'ouverture du tube client -> serveur\n");
	    exit(1);
	}

	S2C = open(tubeS2C, O_WRONLY);
	if (S2C == -1) {
	    perror("Erreur d'ouverture du tube serveur -> client\n");
	    exit(1);
	}

	nbactifs++;
	participants[nbactifs-1].actif = true;
	strcpy(participants[nbactifs-1].nom, dep);
	participants[nbactifs-1].in = C2S;
	participants[nbactifs-1].out = S2C;

    }
}
int main (int argc, char *argv[]) {
    int i,nlus,necrits,res,k;
    int ecoute;					/* descripteur d'écoute */
    fd_set readfds; 		/* ensemble de descripteurs écoutés par le select */
    char * buf0; 				/* pour parcourir le contenu du tampon de réception */
    char bufDemandes [TAILLE_NOM*sizeof(char)*MAXPARTICIPANTS]; 
    /* tampon requêtes de connexion. Inutile de lire plus de MAXPARTICIPANTS requêtes */
    char pseudo[TAILLE_NOM];	// Pseudo entré

    /* création (puis ouverture) du tube d'écoute */
    mkfifo("./ecoute",S_IRUSR|S_IWUSR); // mmnémoniques sys/stat.h: S_IRUSR|S_IWUSR = 0600
    ecoute=open("./ecoute",O_RDONLY);

    for (i=0; i<= MAXPARTICIPANTS; i++) {
	effacer(i);
    }

    while (true) {
	printf("participants actifs : %d\n",nbactifs);

	// Preparation du tampoon fd_set du SELECT
	FD_ZERO(&readfds);
	FD_SET(ecoute, &readfds);   // Ajout du descripteur d'ecoute
	/** Ajout des descripteurs des participants actifs **/
	for (i=0; i<nbactifs; i++) {
	    FD_SET(participants[i].in, &readfds);
	}

	/** Appel de la primitive select **/
	int val_select = select(NBDESC, &readfds,NULL,NULL,NULL);
	if (val_select == -1) {
	    perror("Erreur appel select serveur\n");
	    exit(1);
	} else if (val_select>0) {
	    if (FD_ISSET(ecoute,&readfds)) {
		/** Message pret dans le tube d'écoute **/
		bzero(pseudo, TAILLE_NOM);   // Vider le tampon de pseudo
		if (nbactifs < MAXPARTICIPANTS) {
		    int rd = read(ecoute,pseudo,TAILLE_NOM);
		    if (rd == -1) {
			perror("Erreur de lecture sur le tube d'écoute\n");
			exit(1);
		    } else {
			ajouter(pseudo); // Ajout du nouveau client
			bzero(buf, TAILLE_MSG);
			sprintf(buf,"%s a rejoint la conversation\n", pseudo);
			diffuser(buf);

		    }
		} else {
		    continue;
		    // Gerer le cas ou le nombre de participants est superieur
		}
	    } else {
		for (k = 0; k<nbactifs; k++) {
		    if (FD_ISSET(participants[k].in, &readfds)) {
			/** Message pret pour un participant**/
			bzero(buf, TAILLE_MSG);
			int rdp = read(participants[k].in, buf, TAILLE_MSG);
			if (rdp == -1) {
			    perror("Erreur lecture message participants");
			    exit(1);
			}
			int b = strlen(participants[k].nom) + 3;
			if (strcmp(&buf[b],"au revoir\n") == 0) {
			    bzero(buf, TAILLE_MSG);
			    sprintf(buf,"%s a quitté la conversation\n", participants[k].nom);
			    diffuser(buf);
			    desactiver(k);
			} else {
			    diffuser(buf);
			}
		    }
		}
	    }
	}
    }
    return 0;
}

