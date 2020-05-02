#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h> /* wait */
#include <string.h>

int main(int argc, char *argv[]) {
  int tempsFils, codeTerm;
  pid_t pidFils, idFils;

  while (1){
  
      pidFils = fork();   
      /* bonne pratique : tester systématiquement le retour des appels système */
      if (pidFils == -1) {
        printf("Erreur fork\n");
        exit(1);
        /* par convention, renvoyer une valeur > 0 en cas d'erreur,
         * différente pour chaque cause d'erreur
         */
      }
      if (pidFils == 0) {  /* fils */
        char buf[30]; /*variable pour stocker la commande saisie au clavier*/ 
        char commande[36] = "/bin/";
        printf("Entrer le nom de la commande (sans paramètre) de moins de 30 caractères à éxecuter :\n");
        scanf("\%s",buf);
        strcat(commande,buf);
        execl(commande,"",NULL);

        /* on se retrouve ici si exec échoue, on affiche l'erreur*/
        perror("Erreur d'exécution ");
        exit(1);
      }
      else {   /* père */
        idFils=wait(&codeTerm);
        if (idFils == -1) {
          perror("wait ");
          exit(2);
        }
        if (codeTerm == 0) {
          printf("La commande a été bien exécutée !\n");
        } else {
          printf("La commande n'a pas été bien exécutée !\n");
        }
      }
  }
}
