#ifndef _LINKED_LIST_H_
#define _LINKED_LIST_H_

/** enumaration containing process status. */
typedef enum {ACTIVE, SUSPENDED} Status;

/** The structure handling the list of process. */
typedef struct list *List;

/** Constructor of an empty list of process. */
List new_list(void);

/** Get the id of the current process. */
int get_id(List list);

/** Get the pid of the current process. */
pid_t get_pid(List list);

/** Get the status of the current process. */
Status get_status(List list);

/** Get the command line of the current of the current process. */
char* get_cmd(List list);

/** Get the next process of the current process. */
List get_next(List list);

/** Set the id of the current process. */
void set_id(List list, int *id);

/** Set the pid of the current process. */
void set_pid(List list, pid_t *pid);

/** Set the status of the current process. */
void set_status(List list, Status status);

/** Set the next process of the current process. */
void set_next(List list, List next);

/** Create a new process. */
List create_process(int *id, pid_t *pid, Status status, char* cmd);

/** Get a process in the process list from it pid. */
List get_node(List head, pid_t *pid);

/** Update the status of a process from it pid. */
void update_status(List head, pid_t *pid, Status status);

/** Add a new process at the end of the process list. */
List add_node(List head, List new_node);

/** Delete a node from the process list. */
List delete_node(List head, pid_t *pid);

/** Traverse the process list. */
void traverse(List head);

#endif
