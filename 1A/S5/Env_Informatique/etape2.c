#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define TDIM 64
#define VCTL 100

int main(int argc, char * argv[]){

	int i, llg, m, code, vct;
	char  logs[TDIM];
	int val[TDIM];

	bzero( logs,TDIM);
	i = getlogin_r( logs,TDIM);
	if (i != 0) {
		printf("Entrez votre nom utilisateur (username) : ");
		scanf("%s", logs);
	}
	llg = strlen( logs);
	m = llg/2;
	vct = (int)( logs[m]);

	for (i=0; i<llg; i++) {
		if (('a' <=  logs[i]) && ( logs[i] <= 'z')) {
			val[i] = (int)( logs[i] - 'a')  + i;
		} 
		else {
			if (('A' <= logs[i]) && (logs[i] <= 'Z')) {
				val[i] = (int)(logs[i] - 'A')  + i;
			}
			else {
				if (('0' <=  logs[i]) && ( logs[i] <= '9')) {
					val[i] = (int)( logs[i] - '0')  + i;
				}
				else {
					val[i] = i;
				}
			}
		}
	}
	if (vct != VCTL) {
		printf("Erreur : mauvaise constante VCTL\n");
	}
	else {
		code = val[m];
		for (i=0 ; i<llg ; i++) {
			code += val[i];
		}
		printf("votre code est %d \n", code);
		return 0;
	}
}
