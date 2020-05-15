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

void exec_pipeline(char ***cmd, int index, int old_fd) {
    
    if (cmd[index + 1] == NULL) {
	// Redirect the stdout argv[1].
            if (dup2 (old_fd, 0) == -1) {
                perror ("[DUP2] Error ");
                exit (1);
            }
            if (close(old_fd) < 0) {
                perror("[CLOSE] Error ");
                exit(1);
            }


	if (execvp(cmd[index][0], cmd[index]) < 0) {
	    printf("%s: command not found\n", cmd[index][0]);
	    exit(1);
	}
	exit(0);
    }
    else { /* $ <in_fd cmds[pos] >fd[1] | <fd[0] cmds[pos+1] ... */
	int fd[2]; /* output pipe */
	if (pipe(fd) == -1) {
	    perror ("[PIPE] Error ");
	    exit (1);
	}
	// Create child process.
	int c = fork();

	// If the fork failed.
	if (c < 0) {
	    perror ("[FORK] Error ") ;
	    exit (1);
	}

	// If son is created with success
	else if (c == 0) {
	    // Close argv[1], and handle systematically errors due to close.
	    if (close(fd[0]) < 0) {
		perror("[CLOSE] Error ");
		exit(1);
	    }
	    
	    // Redirect the stdout argv[1].
            if (dup2 (old_fd, 0) == -1) {
                perror ("[DUP2] Error ");
                exit (1);
            }
	    if (close(old_fd) < 0) {
                perror("[CLOSE] Error ");
                exit(1);
            }

	    // Redirect the stdout argv[1].
	    if (dup2 (fd[1], 1) == -1) {
		perror ("[DUP2] Error ");
		exit (1);
	    }
	    if (execvp(cmd[index][0], cmd[index]) < 0) {
		printf("%s: command not found\n", cmd[index][0]);
		exit(1);
	    }
	    exit(0);
	} else {  
	    /* parent: execute the rest of the commands */
	    // Close argv[1], and handle systematically errors due to close.
	    if (close(fd[1]) < 0) {
		perror("[CLOSE] Error ");
		exit(1);
	    }
	    exec_pipeline(cmd, index + 1, fd[0]); /* execute the rest */
	}
    }
}
/** The main function of this program. */
int main(int argc, char* argv) {
    /* Local variables. */
    int process = 1;	 // The integer guaranteed the infinite loop.
    struct cmdline *cmd; // The structure containing the command line.
    List new_process;	 // The new process.
    int file_desc;	 // The file descriptor.

    /* Display the init bar. */
    init_bar();


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

	    // Check if the command line contains >.
	    if (cmd->seq[1] == NULL) {
		if (cmd->out != NULL) {
		    /** Open file out in write mode, if it doesn't exist it will be created,
		      and all the existing content will be erased. */
		    file_desc = open (cmd->out, O_WRONLY | O_CREAT | O_TRUNC, 0640);

		    // Handle systematically errors due to open.
		    if (file_desc < 0) {
			perror ("[OUT] FILE DESCRIPTOR] Error ");
			exit (1);
		    }

		    // Redirect the stdout to out.
		    if (dup2 (file_desc, 1) == -1) {
			perror ("[DUP2] Error ");
			exit (1);
		    }

		    // Close out, and handle systematically errors due to close.
		    if (close(file_desc) < 0) {
			perror("[CLOSE] Error ");
			exit(1);
		    }

		}

		// Check if the command line contains <.
		if (cmd->in != NULL) {
		    /** Open file in in read mode */
		    file_desc = open (cmd->in, O_RDONLY);

		    // Handle systematically errors due to open.
		    if (file_desc < 0) {
			perror ("[IN] FILE DESCRIPTOR] Error ");
			exit (1);
		    }

		    // Redirect the stdin to in.
		    if (dup2 (file_desc, 0) == -1) {
			perror ("[DUP2] Error ");
			exit (1);
		    }

		    // Close out, and handle systematically errors due to close.
		    if (close(file_desc) < 0) {
			perror("[CLOSE] Error ");
			exit(1);
		    }

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
	    } else {
		exec_pipeline(cmd->seq, 0, 0);
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
