#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>
#include "readcmd.h"
#include "display_shell.h"
#include "linked_list.h"

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
void stop(pid_t pid, List process_list) {
    kill(pid, SIGSTOP);
    update_status(process_list, &pid, SUSPENDED);
}

/** Resume a suspended process in the background */
void bg(pid_t pid, List process_list) {
    kill(pid, SIGCONT);
    delete_node(process_list, &pid);
}


/** Resume a suspended process in the forground. */
void fg(pid_t pid, List process_list) {
    waitpid(pid, 0, 0);
}

/* Execute cmd if it is an internal command. */
void exec_internal_cmd(List head, struct cmdline *cmd, int *process, List process_list) {
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
	stop(pid, process_list);
	*process = 2;
    }
    else if (strcmp(cmd->seq[0][0], "bg") == 0) {
	pid_t pid = atoi(cmd->seq[0][1]);
	bg(pid, process_list);
    	*process = 2;
    }
    else if (strcmp(cmd->seq[0][0], "fg") == 0) {
	pid_t pid = atoi(cmd->seq[0][1]);
	fg(pid, process_list);
	*process = 2;
    }
}
