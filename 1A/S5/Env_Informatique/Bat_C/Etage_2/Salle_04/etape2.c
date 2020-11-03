#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define TDIM 64

int main(int argc, char * argv[]){

int i, llg, m, code, vct;
char chaine[TDIM];
int val[TDIM];

bzero(chaine,TDIM);
i = getlogin_r(chaine,TDIM);
if (i != 0) {
printf("Entrez votre nom utilisateur (username) : ");
scanf("%s",chaine);
}
llg = strlen(chaine);
m = llg/2;
vct = (int)(chaine[m]);

for (i=0; i<llg; i++) {
if (('a' <= chaine[i]) && (chaine[i] <= 'z')) {
val[i] = (int)(chaine[i] - 'a')  + i;
} 
else {
}
else {
if (('0' <= chaine[i]) && (chaine[i] <= '9')) {
val[i] = (int)(chaine[i] - '0')  + i;
}
else {
val[i] = i;
}
else {
code = val[m];
for (i=0 ; i<llg ; i++) {
code += val[i];
}
printf("votre code est %d \n", code);
}
}
}
}

if (vct != VCTL) {
printf("Erreur : mauvaise constante VCTL\n");
}
return 0;
}  
#define VCTL 100