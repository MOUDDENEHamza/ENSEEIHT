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
int child_status;

/** Handle ctrl + c SIGINT signal. */
void handler_SIGINT (int sig) {
    kill(child,SIGKILL);
    process_list = delete_node(process_list, &child);
}

/** The main function of this program. */
int main (int argc, char* argv) {
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
	exec_internal_cmd(process_list, cmd, &process);
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
		}
	    } 

	    /** PIPELINES */
	    else {
		exec_pipeline(cmd->seq, 0, 0);
	    }
	    id++;
	    new_process = create_process(&id, &child, ACTIVE, cmd->seq[0][0]);
	    process_list = add_node(process_list, new_process);
	    exit(0);
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
		if (WIFEXITED(child_status) || (WIFSIGNALED(child_status))) {
		    process_list = delete_node(process_list, &child);
		}

	    }
	}
    }

    return -1;
} /* End of main. */
