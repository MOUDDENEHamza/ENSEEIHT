#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h> /* wait */
#include <signal.h>
#include "display_shell.h"
#include "readcmd.h"
#include "linked_list.h"
#include "command_process.h"

/** Global variables. */
pid_t child;         // The child process. 
List process_list;   // The list containing the whole process.
int id;              // The id of the process.
int nb_fils_termines ; 

/** Handle ctrl + z SIGTSTP signal. */
void handler_SIGTSTP(int sig) {
    //kill(getpid(), SIGSTOP);
    //update_status(process_list, getpid(), SUSPENDED);
}

/** Handle ctrl + c SIGINT signal. */
void handler_SIGINT(int sig) {
    //kill(getpid(), SIGKILL);
    //delete_node(process_list, getpid());
    printf("\n");
}

/** Handler of SIGCHLD signal. */
void handler_SIGCHLD (int signal_num) {
    int child_status;
    pid_t pid_child;
   
   printf("test %d", child_status);

    do {
	pid_child = (int) waitpid(-1, &child_status, WNOHANG | WUNTRACED | WCONTINUED);

	if(pid_child == -1) {
	    perror("waitpid");
	    exit(EXIT_FAILURE);
	} 

	else if (pid_child > 0) {
	    if (WIFSTOPPED(child_status)) {
		// Handle the suspension.
		update_status(process_list, &pid_child, SUSPENDED);
	    } 

	    else if (WIFCONTINUED(child_status)) {
		// Handle the reboot.
		update_status(process_list, &pid_child, ACTIVE);
	    } 

	    else if (WIFEXITED(child_status) || (WIFSIGNALED(child_status))) {
		printf("imane\n");
		// Handle the exit termination.
		delete_node(process_list, &pid_child);
	    }
	}

    } while (pid_child > 0);
}

/** The main function of this program. */
int main(int argc, char* argv) {
    /* Local variables. */
    int process = 1;	 // The integer guaranteed the infinite loop.
    struct cmdline *cmd; // The structure containing the command line.
    List new_process;	 // The new process.
	int nb_fils_termines = 0;
    /* Display the init bar. */
    init_bar();
    sigset_t ens_signaux ;
 
      sigemptyset(&ens_signaux) ;
 
      /* ajouter SIGCHLD à ens_signaux */
      sigaddset(&ens_signaux, SIGCHLD) ;
	signal(SIGCHLD, handler_SIGCHLD) ;
    /** Handle ctrl + c  */
    signal(SIGINT, &handler_SIGINT);

    /* Initialize the process list and set the first id to 1. */
    process_list = new_list();
    new_process = new_list();
    id = 1;

    /* Inifinite loop. */
    while (process) {

	// Display the prompt and read the command line.
	do {
	    print_prompt();
	    cmd = readcmd();
	} while (cmd->seq[0] == NULL);

	// if cmd is an internal command, then we will execute cmd. 
	exec_internal_cmd(process_list, cmd, &process, process_list);
	if (process == 2) {
	    process = 1;
	    continue;
	}

	// Create child process.
	child = fork();

	// If the fork failed.
	if (child < 0) {
	    printf("Error: fork failed.\n") ;
	    exit(1);
	}

	// If son is created with success
	else if (child == 0) {
	    // Handle signals.
	    signal(SIGCHLD, &handler_SIGCHLD);

	    // Execute the command.
	    if (execvp(cmd->seq[0][0], cmd->seq[0]) < 0) {
		printf("%s: command not found\n", cmd->seq[0][0]);
		exit(1);

		id++;
		new_process = create_process(&id, &child, ACTIVE, cmd->seq[0][0]);
		process_list = add_node(process_list, new_process);
		exit(0);
	    }
	}
	// Parent process.
	else {
	    // Set id to 1 if the process list becomes empty.
	    if (process_list == NULL) {
		id = 1;
	    }

	    // Parent process wait the termination of child process.
	    if (cmd->backgrounded == NULL) {
		id++;
		new_process = create_process(&id, &child, ACTIVE, cmd->seq[0][0]);
		process_list = add_node(process_list, new_process);
		wait(NULL);
	    } else {
		id++;
		new_process = create_process(&id, &child, ACTIVE, cmd->seq[0][0]);
		process_list = add_node(process_list, new_process);

	    }
	}
    }

    return -1;
} /* End of main. */
