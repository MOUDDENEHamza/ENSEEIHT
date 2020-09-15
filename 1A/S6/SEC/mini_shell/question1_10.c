/* Question 6 */

#include <stdio.h>    /* entrées sorties */
#include <unistd.h>   /* pimitives de base : fork, ...*/
#include <stdlib.h>   /* exit */
#include <sys/wait.h> /* wait */
#include <signal.h>   /* signaux */
#include <string.h>   /* manipulation des chaines */
#include "readcmd.c"  /* lecture et analyse de la ligne de commande */
#include <stdbool.h>  /* les booléens */
#include <fcntl.h>
#include <sys/types.h>

#define L 20
#define NB_FILS 1

/* Déclaration d'un type pour représenter la liste de processus */
typedef struct liste_processus *liste_proc; 

/* Variables globales */
int retour, pidFils; 
int nb_fils_termines;
struct cmdline *cmd; // la ligne saisie
char ***seq;         // tubes de la ligne saisie 
liste_proc list = NULL;    // pointeur sur une liste de processus
struct sigaction sa_sigchld;
struct sigaction sa_sigint;
struct sigaction sa_sigtstp;


/* Création d'une liste de processus */

enum Etat {A, S}; // A pour ACtif, S pour supendu
typedef enum Etat Etat;


struct liste_processus {
    
    int id;              // identifiant propre au mini shell // Nombre d'éléments 
    int pid;             // pid du processus  
    Etat etat;           // processus actif ou suspendu
    char cmd[L]; // ligne de commande lancée
    liste_proc suivant; 
};



/* Opérations sur liste_proc */
    /* Savoir si un processu est déja présent ou non dans la liste */
bool estPresent(int pid, liste_proc liste) {
    bool present = false;

    if (liste != NULL) {
        if ((liste -> pid) == pid) {
            present = true;
        } else {
            present = estPresent(pid, liste -> suivant);
        } 
    }
    return present;
}
    /* Ajouter un processus de la liste */
void ajouter(int pid, Etat etat, char *cmd, liste_proc *liste) {
    // On crée le nouvel élément
    liste_proc nliste = malloc(sizeof(struct liste_processus));
    if ((*liste) == NULL) {
        nliste -> id = 1;
    } else {
        // on ajoute les éléments en début de chaîne
        // donc le premier élément (*liste) l'identifiant
        // le plus élevé
        nliste -> id = ((*liste) -> id) + 1;
    }
    nliste -> pid = pid;
    nliste -> etat = etat;
    // nliste -> cmd = cmd;
    strncpy(nliste -> cmd, cmd, L); 
    nliste -> suivant = NULL;
    // On ajoute en début de chaîne
    nliste -> suivant = (*liste);
    (*liste) = nliste; 

}
    
    /* Supprimer un processus de la liste */
void supprimer(int pid, liste_proc *liste) {
    if (estPresent(pid, *liste)) { // inclut la condition liste != NULL
        if ((*liste) -> pid == pid) {
            (*liste) = (*liste)->suivant;
            // on libère l'espace mémoire
            //free(liste); 
        } else { // on recherche l'endroit où est l'élément dans la liste de processus
            while ((*liste) -> suivant != NULL && (*liste) -> suivant -> pid != pid) {
                (*liste) = (*liste) -> suivant; 
              }
             if ((*liste) -> suivant != NULL) {
                (*liste) -> suivant = (*liste) -> suivant->suivant;
                //free(liste -> suivant); 
             }
                   
        }
    }
}
 
    /* Changer l'état d'un processus dans la liste */
void changerEtat(int pid, Etat etat, liste_proc (*liste)) {
     if (estPresent(pid, *liste)) {
        if ((*liste)->pid == pid) {
            (*liste)->etat = etat;
        } else {
            changerEtat(pid, etat, &((*liste) -> suivant));
        }
        
     }
}
    /* Obtenir le pid à partir de l'identifiant */
int getPid(int id, liste_proc liste) { 
    int pid = -1; 
    while (liste->id != id && liste->suivant != NULL) {
        liste = liste->suivant; 
    }
    if (liste != NULL) {
        pid = liste->pid; 
    }
    return pid; 
}
    
    /* Suspendre un processus */
void suspendre(int id, liste_proc (*liste)) {
    int pid = getPid(id, *liste); 
    if (pid > 0) {
        kill(pid, SIGSTOP); 
        changerEtat(pid, S, &(*liste));
    }
}

    /* Reprendre un processus */
void reprendre(int id, liste_proc (*liste)) {
    int pid = getPid(id, *liste); 
    if (pid > 0) {
        kill(pid, SIGCONT); 
        changerEtat(pid, A, &(*liste));
    }
}

    /* afficher tous les processus */
void afficherListeProcessus(liste_proc liste) {
    if (liste == NULL) {
        printf("---  ---  ---  ---\n"); 
    } else {
        char *etat;
        etat = (liste->etat == A) ? "actif" : "suspendu"; 
        printf("%d  %d  %s  %s\n", liste->id, liste->pid, etat, liste->cmd);
        afficherListeProcessus(liste->suivant); 
    }
    // on fait de même pour le processus suivant (s'il existe)

}   

/* Dormir pendant nb_secondes sans être interrompu par un signal */
void dormir(int nb_secondes) {
    int duree = 0;
    while (duree < nb_secondes) {
	sleep(1);
	duree++;
    }
    return;
}



/* Lancer la commande par le processus de pid pid */
void lancerCmd(char ***seq) {
    
    int exe; 

    if (seq[0][0] != NULL) { // la ligne de commande est non vide
        exe = execvp(seq[0][0], seq[0]);
    }
    if (exe == -1) {
        perror("Erreur ");
        exit(0);
    }
    
}

/* Lancer une commande interne (ici soit cd, soit exit) */
void lancerCmdIntCd(char ***seq) {
    
      if (seq[0][1] != NULL) { // un chemin est spécifié
        chdir(seq[0][1]);
       } else { // aucun chemin n'est spécifié
                // On recherche dans la liste des variables
                // environnements une variable nommée home 
         char *racine = getenv("HOME");
         chdir(racine);
       }
}

   
     
/* Traitant du signal SIGCHLD */
void handler_sigchld(int signal_num) {
    int wstatus, fils_termine;
     
    fils_termine = wait(&wstatus);
    nb_fils_termines++;
    if (signal_num == SIGCHLD) {
        while ((fils_termine == (int) waitpid(-1, &wstatus, WNOHANG | WUNTRACED | WCONTINUED)) > 0) {
            if (WIFEXITED(wstatus) | WIFSIGNALED(wstatus)) {   /* fils terminé avec exit ou tué par un signal*/
                nb_fils_termines++;
                // on l'enlève de la liste des processus
                supprimer(fils_termine, &list); 
    
            } else if WIFCONTINUED(wstatus) {
                changerEtat(fils_termine, A, &list);
            } else if WIFSTOPPED(wstatus) {
                changerEtat(fils_termine, S, &list); 

            }
        }
    }
}

/* Traitant du signal SIGINT/Ctrl-C */
void handler_sigint(int signal_num) {
    // Le processus est tué 
    /* Supression de ce processus à la liste de processus */
    if (estPresent(retour, list)) {
        supprimer(retour, &list);
    }
    /* Déclancher la terminaison du processus en avant-plan */
    kill(retour, SIGKILL); 
    /* Retour à la ligne */
    printf("\n"); 
}

/* Traitant du signal SIGTSTP */
void handler_sigtstp(int signal_num) {
    // Le processus est interrompu
    // Il est en "arrière-plan"
    /* Ajout de ce processus à la liste de processus */
    //changerEtat(retour, S, &list); 
    
        ajouter(retour, S, seq[0][0], &list); 
    
    /* Déclancher l'interruption du processus en avant-plan */
    kill(retour, SIGSTOP); 
    /* Retour à la ligne */
    printf("\n"); 
}

/* Gestion erreur des primitives */
void gestionErr(int r, char *message) {
    if (r < 0) {
        perror(message); 
        exit(EXIT_FAILURE); 
    }
}

/* Pouvoir lancer n'importe quelle commande simple */
void lancerCmdGenerale(struct cmdline *cmd, char ***seq, char *background, int p[2], int q[2], liste_proc liste) {
    int pid, r; 
    int nb_processus = 0;
    nb_fils_termines = 0;

    if (seq[0] != NULL) {
            if (strcmp(seq[0][0], "exit") == 0) { // la commande entrée est exit
                exit(0);
            } else if (strcmp(seq[0][0], "cd") == 0) { // la commande entrée est cd
                lancerCmdIntCd(seq);
            } else if ((strcmp(seq[0][0], "list")) == 0) { // la commande entrée est list
                afficherListeProcessus(list); 
            } else if ((strcmp(seq[0][0], "stop")) == 0) { // la commande entrée est stop
                suspendre(atoi(seq[0][1]), &list); 
            } else if ((strcmp(seq[0][0], "bg")) == 0) { // la commande entrée est bg
                reprendre(atoi(seq[0][0]), &list); 
            } else if ((strcmp(seq[0][0], "fg")) == 0) { // la commande entrée est fg
                 pid = getPid(atoi(seq[0][0]), list); 
                if (pid != -1) {
		    
		            kill(pid, SIGCONT);
		            supprimer(pid, &list);
		            retour = pid;
		    
		            waitpid(pid,NULL,WUNTRACED);
                }   
            } else {
                 //sa_sigtstp.sa_handler = handler_sigtstp;
                // sigaction(SIGTSTP, &sa_sigtstp, NULL);
                // sa_sigint.sa_handler = handler_sigint;
                 //sigaction(SIGINT, &sa_sigtstp, NULL); 
                 //sa_sigchld.sa_handler = handler_sigchld;
                 //sigaction(SIGCHLD, &sa_sigchld, NULL); 
                 /* Création d'un processus fils */
                 retour = fork();
                 nb_processus++;

        
                 if (retour < 0) {   /* échec du fork */
                    printf("Erreur fork\n");
                 /* Convention : s'arrêter avec une valeur > 0 en cas d'erreur */
                    exit(1);
                  }

                  /* fils */
                  if (retour == 0) {
                     /* Bloquer les signaux pour ne pas que que readcmd() renvoie null */
                    //struct sigaction sa_ignore; 
                    //sa_ignore.sa_handler = SIG_IGN; 
                    //sigemptyset(&sa_ignore.sa_mask); 
                    //sigaction(SIGTSTP, &sa_ignore, NULL); 
                    //sigaction(SIGINT, &sa_ignore, NULL); 
                    sa_sigtstp.sa_handler = handler_sigtstp;
                    sigaction(SIGTSTP, &sa_sigtstp, NULL);
                    sa_sigint.sa_handler = handler_sigint;
                    sigaction(SIGINT, &sa_sigtstp, NULL); 
                    sa_sigchld.sa_handler = handler_sigchld;
                    sigaction(SIGCHLD, &sa_sigchld, NULL); 
                    //sigprocmask(SIG_BLOCK, &sa_sigint.sa_mask, NULL); 
                   // sigprocmask(SIG_BLOCK, &sa_sigtstp.sa_mask, NULL); 
        
                    /* Gérer les extrémités ouvertes */
                    /*if (p[1] > 1) { // entrée du premier pipe : elle est ouverte
                        r = close(p[1]);
                        gestionErr(r, "close p[1]"); 
                    }
                    if (q[0] > 1) { // sortie du deuxième pipe : elle est ouverte
                        r = close(q[0]);
                        gestionErr(r, "close q[0]");
                    }*/

                    /* Associer les descripteurs aux sortie et entrée standards */
                        /* Pour l'entrée */
                    r = dup2(p[0], 0); 
                    gestionErr(r, "dup2 entrée standard"); 

                        /* POur la sortie */
                    r = dup2(q[1], 1); 
                    gestionErr(r, "dup2 sortie standard");
                     /* Lancement de la commande par le processus fils */
                     
                     lancerCmd(seq);
                     
                     //exit(0); 

                  /* père */
                  } else {  
                       //ajouter(retour, A, seq[0][0], &list);
                      /* Traitement du cas où on veut lancer une commande en tâche de fond */
                      if ((cmd->backgrounded) == NULL) {
                        // On ne peut pas saisir de nouvelle commande
                        // tant que le processus fils est toujours actif
                        // essayer de bloquer SIG_CHLD
                        //int status;  
                        //waitpid(retour,&status,WUNTRACED);	
	                    sa_sigchld.sa_handler = handler_sigchld;
                        sigaction(SIGCHLD, &sa_sigchld, NULL);
						
                        do {
                            sleep(1); 
                        } while (nb_fils_termines < NB_FILS); 
                        
			//if (WIFEXITED(status)) {
						//	supprimer(retour, &list);
					    //}
                        /* Gestion des commandes en avant-plan : le père attend*/
                        /* Bloquer le signal SIGCHLD classique */
                        //sigset_t ens_chld; 
                        //sigemptyset(&ens_chld); 
                       // sigaddset(&ens_chld, SIGCHLD); 
                       // sigprocmask(SIG_BLOCK, &ens_chld, NULL); 
                        
                        // int status;  
                        //waitpid(retour,&status,WUNTRACED | WNOHANG | WCONTINUED);	
                        //waitpid(retour,&status,WUNTRACED);	
	                    
                        //if (WIFEXITED(status)) {
						//	supprimer(retour, &list);
					    //}               
                       // if (WIFEXITED(status) | WIFSIGNALED(status)) {
	                   //     supprimer(retour, &list);
                       // } else if WIFCONTINUED(status) {
                        //    changerEtat(retour, A, &list);
                       // } else if WIFSTOPPED(status) {
                       //      changerEtat(retour, S, &list);
                       // }
                        //sleep(1); 
                        /* Réactiver SIGCHLD */
                       // sigprocmask(SIG_UNBLOCK, &ens_chld, NULL); 
   
                           
                      }  else {   
                         // Que le processus fils soit actif ou non,
                         // le processus père peut toujours traiter
                         // une nouvelle commande

                         /* Ajout du processus créé à la liste */
                         ajouter(retour, A, seq[0][0], &list);
                         printf("[%d] %d\n", nb_processus, retour);
                        //sleep(1); 
                        
                      }
                   }
                  
            }
        } 
        
     
}
    

/* Gérer les pipes et les redirections */
void lancerCmdAvecPipe(struct cmdline *cmdl, liste_proc list) {
    /* Définir les deux pipes */
    int p[2]; 
    int q[2]; 

    /* Définir les descripteurs d'entrée et de sortie par défaut */
    int desc_in = STDIN_FILENO; 
    int desc_out = STDOUT_FILENO; 

    /* Gérer les redirections */
        /* Si l'entrée est redirigée */
    if(cmdl->in != NULL) {
        desc_in = open(cmdl->in, O_RDONLY); 
        gestionErr(desc_in, "open desc_in");
    }
        /* Si la sortie est redirigée */
     if(cmdl->out != NULL) {
        desc_out = open(cmdl->out, O_WRONLY | O_CREAT, 0640); 
        gestionErr(desc_out, "open desc_out");
      }

    /* Gérer les pipes */
        /* Initialisation de la commande avec la première */
    char **commande = cmdl->seq[0]; 
    char ***seql = cmdl->seq; 
    
        /* Gérer la première commande */
    p[1] = -1; 
    p[0] = desc_in; // 0 ou le fichier

        /* Gérer toutes les autres commandes, sauf la dernière */
    int i = 1;
    int flag = 0;
    int r; // pour la gestion des erreurs
    while (cmdl->seq[i]) { // Tant qu'il y a des commandes*
        /* Création du pipe d'après */
        r = pipe(q); 
        gestionErr(r, "pipe sortie");
      	printf("%d\n", flag++); 
	/* Executer la commande voulue */
        lancerCmdGenerale(cmdl, seql, cmdl->backgrounded, p, q, list); 
        printf("%d\n", flag);

	/* Passer à l'autre commande */
        commande = cmdl->seq[i]; 
        /* Fermeture des entrées et sorties ouvertes */
        if (p[0] > 1) {
            r = close(p[0]);
            gestionErr(r, "close entrée"); 
        }
        if (q[1] > 1) {
            r = close(q[1]);
            gestionErr(r, "close sortie"); 
        }
        p[0] = q[0]; 
        p[1] = q[1]; 
        printf("test\n");
	i = i + 1; 
    }

        /* Gérer la dernière commande */
    int ferme = q[0]; // celui avant changement
    /*if (q[1] > 1) {
        r = close(q[1]); 
        gestionErr(r, "close entrée"); 
    }*/
        
    q[0] = -1; 
    q[1] = desc_out; 
    
        /* Executer la commande voulue */
    lancerCmdGenerale(cmdl, seql, cmdl->backgrounded, p, q, list); 

        /* Gérer toutes les fermetures restantes */
    /**if (ferme > 1) {
        r = close(ferme); 
        gestionErr(r, "close dernière sortie"); 
    }
     if (p[0] > 1) {
        r = close(p[0]); 
        gestionErr(r, "close avant dernière sortie"); 
    }
    if (p[1] > 1) {
        r = close(p[1]); 
        gestionErr(r, "close avant dernière entrée"); 
    }*/
    if (desc_in > 1) {
        r = close(desc_in); 
        gestionErr(r, "close desc_in"); 
    }
    if (desc_out > 1) {
        r = close(desc_out); 
        gestionErr(r, "close desc_out"); 
    }
    
   
}
    
int main() {
    
    int nb_processus = 0;
    nb_fils_termines; 

    /* Associer les signaux à des traitants*/
    /* Pour SIGCHLD */
    //struct sigaction sa_sigchld; 
    //sa_sigchld.sa_handler = handler_sigchld; 
    sa_sigchld.sa_handler = SIG_IGN; 
    sigemptyset(&sa_sigchld.sa_mask); // on ne veut pas masquer de signaux pendant le traitement de ce signal
    sa_sigchld.sa_flags = 0;
    sigaction(SIGCHLD, &sa_sigchld, NULL); 

    /* Pour SIGTSTP */
    //struct sigaction sa_sigtstp; 
    //sa_sigtstp.sa_handler = handler_sigtstp; 
    sa_sigtstp.sa_handler = SIG_IGN; 
    sigemptyset(&sa_sigtstp.sa_mask); 
    sa_sigtstp.sa_flags = 0;
    sigaction(SIGTSTP, &sa_sigtstp, NULL);
    /* Pour SIGINT */
    //struct sigaction sa_sigint; 
    sa_sigint.sa_handler = SIG_IGN; 
    sigemptyset(&sa_sigint.sa_mask); 
    sa_sigint.sa_flags = 0;
    sigaction(SIGINT, &sa_sigint, NULL); 
    

    /* Créer un ensemble de signaux */
   sigset_t ens_signaux;
   sigemptyset(&ens_signaux);
   sigaddset(&ens_signaux, SIGINT);
   sigaddset(&ens_signaux, SIGTSTP);

    while (true) { 

        printf("> ");

        /* Lecture d'une ligne sur l'entrée standard */
        /* Interprétation comme une commande */
        cmd = readcmd();
        //seq = cmd -> seq;
        lancerCmdAvecPipe(cmd, list); 
     }
     return(EXIT_SUCCESS);
 }
