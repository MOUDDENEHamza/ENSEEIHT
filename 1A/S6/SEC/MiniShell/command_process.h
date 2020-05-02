#ifndef _COMMAND_PROCESS_H_
#define _COMMAND_PROCESS_H_

#include "readcmd.h"

/** Change the directory. */
void change_dir(char *destination);

/** Suspend a process linking to a giving pid in parameter. */
void stop(pid_t pid, List process_list);

/** Resume a suspended process in the background */
void bg(pid_t pid, List process_list);

/** Resume a suspended process in the forground. */
void fg(pid_t pid, List process_list);

/** Execute cmd if it is an internal command. */
void exec_internal_cmd(List head, struct cmdline *cmd, int *process, List process_list);

#endif
