#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/types.h>
#include <errno.h>

#define LMAX 64

int desc_non_bloquant(int desc) {
    /* -icanon : pour quitter le mode canonique, ie ne pas attendre
     * le retour-chariot
     * min : nombre de caracteres a recevoir au minimum avant de
     * les transmettre au processus les lisant */
    system("stty -icanon min 1");
    return(fcntl(desc, F_SETFL, fcntl(desc, F_GETFL) | O_NONBLOCK));
}

int main(void) {
    char buf[LMAX];
    int flag, nlu;
    flag= fcntl(0, F_GETFL, 0);
    printf("flag initial : %d\n", flag);
    if (desc_non_bloquant(0) == -1) {
	fprintf(stderr,"Impossible de passer en non bloquant\n");
	exit(1);
    }
    flag= fcntl(0, F_GETFL, 0);
    printf("flag apres modification : %d\n", flag);
    printf("Une p’tite attente\n");
    sleep(3);
    printf("C’est parti\n");
    while(1) {
	nlu= read(0,buf,LMAX);
	if ( nlu <= 0 ) {
	    write(1, "attente...\n", 11);
	    sleep(1);
	} else {
	    write(1, buf, nlu);
	}
    }
    return(0);
}
