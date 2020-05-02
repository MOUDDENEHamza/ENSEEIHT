#include "main.h"
#include <stdio.h>
#include <stdlib.h>
#include <assert.h> 

bool est_presente_main(t_main main, carte c){
    int i = 0;
    while (i < main.nb && !est_egale(main.main[i], c)) {
        i++;
    }
    return !(i == main.nb);
}

bool init_main(t_main* la_main, int N){
    assert(N <= (NB_CARTES-1)/2);
    la_main->main = malloc(N*sizeof(carte));
    la_main->nb = N;
    return (la_main==NULL); //allocation réussie ?
}

void afficher_main(t_main la_main){
    for (int k=0; k<la_main.nb; k++){
        afficher_carte(la_main.main[k]);
    }
    printf("\n");
}
