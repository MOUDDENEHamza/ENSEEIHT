#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>    /* Files operations */
#include "readcmd.h"
#include "display_shell.h"
#include "linked_list.h"

// Gloabal variables.
extern List process_list;

/* Change the directory. */
void change_dir(char *destination) {
    if (destination == NULL) {
	chdir(getenv("HOME"));
    }
    else {
	if (chdir(destination) == -1) {;
	    printf("bash: cd: %s: No such file or directory\n", destination);
	}
    }
}

/** Suspend a process linking to a giving pid in parameter. */
void stop(pid_t pid) {
    kill(pid, SIGSTOP);
    update_status(process_list, &pid, SUSPENDED);
}

/** Resume a suspended process in the background */
void bg(pid_t pid) {
    kill(pid, SIGCONT);
    update_status(process_list, &pid, ACTIVE);
}


/** Resume a suspended process in the forground. */
void fg(pid_t pid) {
    waitpid(pid, 0, 0);
}

/* Execute cmd if it is an internal command. */
void exec_internal_cmd(List head, struct cmdline *cmd, int *process) {
    if (strcmp(cmd->seq[0][0], "cd") == 0) {
	change_dir(cmd->seq[0][1]);
	*process = 2;
    }
    else if (strcmp(cmd->seq[0][0], "clear") == 0) {
	init_bar();
	*process = 2;
    } 
    else if (strcmp(cmd->seq[0][0], "exit") == 0 || strcmp(cmd->seq[0][0], "quit" ) == 0) {
	end_bar();
	exit(0);
    }
    else if (strcmp(cmd->seq[0][0], "list") == 0) {
	traverse(head);
	*process = 2;
    }
    else if (strcmp(cmd->seq[0][0], "stop") == 0) {
	pid_t pid = atoi(cmd->seq[0][1]);
	stop(pid);
	*process = 2;
    }
    else if (strcmp(cmd->seq[0][0], "bg") == 0) {
	pid_t pid = atoi(cmd->seq[0][1]);
	bg(pid);
	*process = 2;
    }
    else if (strcmp(cmd->seq[0][0], "fg") == 0) {
	pid_t pid = atoi(cmd->seq[0][1]);
	fg(pid);
	*process = 2;
    }
}

/** Execute cmd with redirections. */
void exec_redirections(char* file_name, int to) {
    int file_desc;       // The file descriptor.

    if (to == 1) {
	/** Open file out in write mode, if it doesn't exist it will be created                     , and all the existing content will be erased. */
	file_desc = open (file_name, O_WRONLY | O_CREAT | O_TRUNC, 0640);
    } else {
	/** Open file in in read mode */
	file_desc = open (file_name, O_RDONLY);
    }
    // Handle systematically errors due to open.
    if (file_desc < 0) {
	perror ("[IN] FILE DESCRIPTOR] Error ");
	exit (1);
    }

    // Redirect the to to file_desc.
    if (dup2 (file_desc, to) == -1) {
	perror ("[DUP2] Error ");
	exit (1);
    }

    // Close out, and handle systematically errors due to close.
    if (close(file_desc) < 0) {
	perror("[CLOSE] Error ");
	exit(1);
    }
}

/** Execute a commandline containing pipelines */
void exec_pipeline(char ***cmd, int index, int old_fd) {
    // execute the last command, after the last pipe.
    if (cmd[index + 1] == NULL) {
	// Redirect old_fd to stdin.
	if (dup2 (old_fd, 0) == -1) {
	    perror ("[DUP2] Error ");
	    exit (1);
	}

	// Close old_fd, and handle systematically errors due to close.
	if (close (old_fd) < 0) {
	    perror ("[CLOSE] Error ");
	    exit (1);
	}

	// Execute the last command.
	if (execvp (cmd[index][0], cmd[index]) < 0) {
	    printf ("%s: command not found\n", cmd[index][0]);
	    exit (1);
	}
	exit (0);
    }

    // If we still have pipes
    else { 
	pid_t child;	 	// The process child.
	int pipe_s2f[2];      	// Pipe to communicate from child to father.

	// Create pipe, handle systematically errors due to pipe.
	if (pipe(pipe_s2f) == -1) {
	    perror ("[PIPE] Error ");
	    exit (1);
	}

	// Create child process.
	child = fork();

	// If the fork failed.
	if (child < 0) {
	    perror ("[FORK] Error ") ;
	    exit (1);
	}

	// If son is created with success
	else if (child == 0) {
	    // Close pipe_s2f[0], and handle systematically errors due to close.
	    if (close(pipe_s2f[0]) < 0) {
		perror("[CLOSE] Error ");
		exit(1);
	    }

	    // Redirect old_fd to stdin.
	    if (dup2 (old_fd, 0) == -1) {
		perror ("[DUP2] Error ");
		exit (1);
	    }

	    // Close old_fd, and handle systematically errors due to close.
	    if (close(old_fd) < 0) {
		perror("[CLOSE] Error ");
		exit(1);
	    }

	    // Redirect pipe_s2f[1] to stdout.
	    if (dup2 (pipe_s2f[1], 1) == -1) {
		perror ("[DUP2] Error ");
		exit (1);
	    }

	    // Execute the current command
	    if (execvp(cmd[index][0], cmd[index]) < 0) {
		printf("%s: command not found\n", cmd[index][0]);
		exit(1);
	    }
	    exit(0);
	} 

	// Parent process.
	else {
	    // Close pipe_s2f[1], and handle systematically errors due to close.
	    if (close(pipe_s2f[1]) < 0) {
		perror("[CLOSE] Error ");
		exit(1);
	    }

	    // Execute the rest of the commandline.
	    exec_pipeline(cmd, index + 1, pipe_s2f[0]);
	}
    }
}

