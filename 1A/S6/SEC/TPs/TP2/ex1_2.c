#include <stdio.h>    
#include <unistd.h>  
#include <stdlib.h>  
#include <signal.h>   
  
  
      /* Traitant du signal SIGUSR1 et SIGURS2 */
      void handler_sigusr1(int signal_num) {
          printf("\n  Processus de pid %d : J'ai reçu le signal %d\n", 
                               getpid(),signal_num) ;
          return ;
      }
   

     /* dormir pendant nb_secondes secondes  */
     /* à utiliser à la palce de sleep(duree), car sleep s'arrête */
      /* dès qu'un signal non ignoré est reçu */

      void dormir(int nb_secondes){
          int duree = 0 ;
          while (duree < nb_secondes) {
              sleep(1) ;
              duree++ ;
          }
      }
  
      int main(){
          sigset_t ens1, ens2;  
          sigemptyset(&ens2) ;
          sigemptyset(&ens1) ;

          /* ajouter SIGINT à ens2 */
           sigaddset(&ens2, SIGINT) ;
     
          /* ajouter SIGUSR1 à ens1 */
           sigaddset(&ens1, SIGUSR1) ;
      
          /* associer un traitant au signal SIGUSR1 */
           signal(SIGUSR1, handler_sigusr1) ;
            
          /* associer un traitant au signal SIGUSR2 */
           signal(SIGUSR2, handler_sigusr1) ;

           printf("\nJe suis le processus principal de pid %d\n", getpid()) ;


          /* période durant laquelle on ne veut pas être embêté par SIGINT*/
           printf("\n Je masque SIGINT\n", getpid()) ;
          /* masquer les signaux définis dans ens2 : SIGINT */
           sigprocmask(SIG_BLOCK, &ens2, NULL) ;

          /* période durant laquelle on ne veut pas être embêté par SIGUSR1 */
           printf("\n Je masque SIGUSR1\n", getpid()) ;
           /* masquer les signaux définis dans ens2 : SIGUSR1 */      
           sigprocmask(SIG_BLOCK, &ens1, NULL);


            /* l'envoie des signaux*/
            kill(getpid(),SIGUSR1);
            kill(getpid(),SIGUSR1);
            dormir(5);
            kill(getpid(),SIGUSR2);
            kill(getpid(),SIGUSR2);
            dormir(10);

            /* période durant laquelle on peut traiter le signal SIGUSR1 */
            printf("\n Je démasque SIGUSR1\n", getpid()) ;
            /* démasquer les signaux définis dans ens1*/
            sigprocmask(SIG_UNBLOCK, &ens1, NULL);
		    dormir(10);
	    printf("\n Je démasque SIGINT\n", getpid()) ;
            
            sigprocmask(SIG_UNBLOCK, &ens2, NULL);

		    printf("\nTeminaison du programme\n");  

            return EXIT_SUCCESS ;
      }
