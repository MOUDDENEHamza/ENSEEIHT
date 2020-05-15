#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h> /* wait */
#include <signal.h>
#include <fcntl.h>    /* Files operations */
#include "display_shell.h"
#include "readcmd.h"
#include "linked_list.h"
#include "command_process.h"

/** Global variables. */
pid_t child;         // The child process. 
List process_list;   // The list containing the whole process.
int id;              // The id of the process.

/** Handle ctrl + c SIGINT signal. */
void handler_SIGINT(int sig) {
}

/** Handler of SIGCHLD signal. */
void handler_SIGCHLD (int signal_num) {
    int child_status;
    pid_t pid_child;

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
		// Handle the reboot.exec_redirections(cmd->out, 1);

		update_status(process_list, &pid_child, ACTIVE);
	    } 

	    else if (WIFEXITED(child_status) || (WIFSIGNALED(child_status))) {
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

    /* Display the init bar. */
    init_bar();

    /** Handle ctrl + c, so it will be ignored if there is no process in the 
      foreground. */
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
	    /** Handle SIGCHLD when the status of a child changes. */
    	    signal(SIGCHLD, &handler_SIGCHLD);


	    /** REDIRECTIONS */
	    if (cmd->seq[1] == NULL) {
		// Check if the command line contains >.
		if (cmd->out != NULL) {
			exec_redirections (cmd->out, 1);
		}

		// Check if the command line contains <.
		if (cmd->in != NULL) {
			exec_redirections (cmd->in, 0);
		}

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

	    /** PIPELINES */
	    else {
		exec_pipeline(cmd->seq, 0, 0);
	    }
	}
	// Parent process.
	else {
	    // Set id to 1 if the process list becomes empty.
	    if (process_list == NULL) {
		id = 1;
	    } else {
		id++;
	    }

	    new_process = create_process(&id, &child, ACTIVE, cmd->seq[0][0]);
	    process_list = add_node(process_list, new_process);

	    // Parent process wait the termination of child process.
	    if (cmd->backgrounded == NULL) {
		wait(NULL);
	    }
	}
    }
    
    return -1;
} /* End of main. */
