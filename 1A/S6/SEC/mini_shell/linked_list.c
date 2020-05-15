#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "linked_list.h"
#include "readcmd.h"

/** The structure handling the list of process. */
struct list {
    int id; 	    	    // ID of the current process.
    pid_t pid;      	    // The pid of the current process.
    Status status;  	    // The status of the current process.
    char* cmd;    	    // The command line.
    List next;	    	    // Pointer the the next process.
};

/** Constructor of an empty list of process. */
List new_list(void) {
    return NULL;
}

/** Get the id of the current process. */
int get_id(List list) {
    return list->id;
}

/** Get the pid of the current process. */
pid_t get_pid(List list) {
    return list->pid;
}

/** Get the status of the current process. */
Status get_status(List list) {
    return list->status;
}

/** Get the command line of the current of the current process. */
char* get_cmd(List list) {
    return list->cmd;
}

/** Get the next process of the current process. */
List get_next(List list) {
    return list->next;
}

/** Set the id of the current process. */
void set_id(List list, int *id) {
    list->id = *id;
}

/** Set the pid of the current process. */
void set_pid(List list, pid_t *pid) {
    list->pid = *pid;
}

/** Set the status of the current process. */
void set_status(List list, Status status) {
    list->status = status;
}

/** Set the next process of the current process. */
void set_next(List list, List next) {
    list->next = next;
}

/** Create a new process. */
List create_process(int *id, pid_t *pid, Status status, char* cmd) {
    List p = malloc(sizeof(struct list));
    p->id = *id;
    p->pid = *pid;
    p->status = status;
    p->cmd = (char *) malloc(sizeof(char *));
    strcpy(p->cmd, cmd);
    p->next = NULL;
    return p;
}

/** Get a process in the process list from it pid. */
List get_node(List head, pid_t *pid) {
    List tmp = head;
    while (tmp != NULL) {
	if (tmp->pid == *pid) {
	    return tmp;
	}
	tmp = get_next(tmp);
    }
    return NULL;
}

/** Update the status of a process from it pid. */
void update_status(List head, pid_t *pid, Status status) {
    List tmp = head;
    while (tmp != NULL) {
	if (tmp->pid == *pid) {
	    set_status(tmp, status);
	    return;
	}
	tmp = get_next(tmp);
    }
}

/** Add a new process at the end of the process list. */
List add_node(List head, List new_node) {
    List tmp;
    if (head == NULL){
	head = new_node;
    }
    else{
	tmp  = head;
	while(get_next(tmp) != NULL){
	    tmp = get_next(tmp);
	}
	set_next(tmp, new_node);
    }
    return head;
}

/** Delete a node from the process list. */
List delete_node(List head, pid_t *pid) {
    List tmp = head, prev;
    if (tmp != NULL && tmp->pid == *pid) {
	free(tmp);
	tmp = NULL;
	return NULL;
    }
    while (tmp != NULL && tmp->pid != *pid) {
	prev = tmp;
	tmp = get_next(tmp);
    }
    if (tmp == NULL) {
	return head;
    }
    set_next(prev, get_next(tmp));
    free(tmp);
    tmp = NULL;
    return head;
}

/** Get the status in string format. */
static char* get_status_string(Status status) {
    if(status == ACTIVE) {
	return "ACTIVE\t";
    } else {
	return "SUSPENDED";
    }
}

/** Traverse the process list. */
void traverse(List head) {
    List tmp = head;
    printf("ID\t\tPID\t\tSTATUS\t\t\tCMD\n");
    while (tmp != NULL) {
	printf("%d\t\t%d\t\t%s\t\t%s\n", tmp->id, tmp->pid, get_status_string(tmp->status), tmp->cmd);
	tmp = get_next(tmp);
    }
}
