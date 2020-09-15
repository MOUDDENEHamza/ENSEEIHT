/* version 0.2 (PM, 12/5/19) :
	La discussion est un tableau de messages, couplé en mémoire partagée.
	Un message comporte un auteur, un texte et un numéro d'ordre (croissant).
	Le numéro d'ordre permet à chaque participant de détecter si la discussion a évolué
	depuis la dernière fois qu'il l'a affichée.
	La discussion est couplée à un fichier dont le nom est fourni en premier argument
	de la commande, le second étant le pseudo du participant.
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h> /* définit mmap  */
#include <signal.h>

#define TAILLE_AUTEUR 25
#define TAILLE_TEXTE 128
#define NB_LIGNES 20

/* message : numéro d'ordre, auteur (25 caractères max), texte (128 caractères max) */
struct message {
    int numero;
    char auteur [TAILLE_AUTEUR];
    char texte [TAILLE_TEXTE];
};

/* discussion (20 derniers messages) (la mémoire nécessaire est allouée via mmap(-)) */
struct message * discussion;

/* dernier message en position 0 */
int dernier0 = 0 ;

/* afficher la discussion */
void afficher() {
    int i;
    system("clear");  /* nettoyage de l'affichage simple, à défaut d'être efficace */
    printf("==============================(discussion)==============================\n");
    for (i=1; i<NB_LIGNES; i++) {
        printf("[%s] : %s\n", discussion[i].auteur, discussion[i].texte);
    }
    printf("------------------------------------------------------------------------\n");
}

/* traitant : rafraichir la discussion, s'il y a lieu, toutes les secondes */
void traitant (int sig) {
  int i;
  for (i=0; i<(NB_LIGNES-1); i++) {
    discussion[i]=discussion[i+1];
  }
}


int main (int argc, char *argv[]) {
    struct message m;
    int i,taille,fdisc;
    char qq [1];
    FILE * fdf;

    if (argc != 3) {
        printf("usage: %s <discussion> <participant>\n", argv[0]);
        exit(1);
    }

    /* ouvrir et coupler discussion */
    if ((fdisc = open (argv[1], O_RDWR | O_CREAT, 0666)) == -1) {
        printf("erreur ouverture discussion\n");
        exit(2);
    }

    /*	mmap ne spécifie pas quel est le resultat d'une ecriture *apres* la fin d'un fichier
    couple (SIGBUS est une possibilite, frequente). Il faut donc fixer la taille du fichier
    destination à la taille du fichier source avant le couplage. Le plus simple serait
    d'utiliser truncate, mais ici on prefere lseek(a la taille du fichier source) + write
    d'un octet, qui sont deja connus des etudiants */
    qq[0]='x';
    taille = sizeof(struct message)*NB_LIGNES;
    lseek (fdisc, taille, SEEK_SET);
    write (fdisc, qq, 1);
    
    /**Couplage en lecture et en ecriture en mode partagé **/ 
    
    discussion = mmap(NULL, taille, PROT_READ|PROT_WRITE, MAP_SHARED, fdisc, 0);
	if (discussion == MAP_FAILED) {
		perror("Couplage echoué");
		exit(1);
	}
	
	/** Initialisation du nom **/
	strcpy(m.auteur,argv[2]);
	discussion[0].numero = 0;
	//signal(SIGUSR1,traitant);
	while (1) {
		bzero(m.texte, TAILLE_TEXTE);
		int rd = read(0,m.texte, TAILLE_TEXTE);
		if (rd == -1) {
			perror("Erreur lecture saisie");
			exit(1);
		}
		/** Rafraichissement de la discussion **/
        traitant(1);
        m.numero = (dernier0) + 1;
		discussion[NB_LIGNES-1] = m;
        afficher();
        dernier0 = m.numero;
	  }
        

 		/* à compléter : 
 			- couplage et initialisations
 			- boucle : lire une ligne au clavier, décaler la discussion d'une ligne vers le haut
       et insérer la ligne sasie en fin. 
      - Note : le rafraîchissement peut être géré par un traitant.
     */

    close(fdisc);
    exit(0);
}
