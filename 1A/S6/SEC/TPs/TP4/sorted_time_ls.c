/**
 *  List in file given in the command line argv[1] the filenames of the current 
 *  directory, in chronological order of last access.
 *  Command line : ls --sort=t > argv[1]
 *  Author : Hamza MOUDDENE
 */

#include <stdio.h>    /* Input & Output */
#include <stdlib.h>   /* exit */
#include <unistd.h>   /* Basic primitives : fork, read, write, ...*/
#include <fcntl.h>    /* Files operations */

/** Main function. */
int main (int argc, char** argv) {
    // Local variables.
    int file_desc;

    // Test if the command line is right.
    if (argc != 2) {
	printf ("[argc] Error : Wrong usage\n");
	exit (1);
    }

    /** Open file argv[1] in write mode, if it doesn't exist it will be created,
      and all the existing content will be erased. */
    file_desc = open (argv[1], O_WRONLY | O_CREAT | O_TRUNC, 0640);

    // Handle systematically errors due to open.
    if (file_desc < 0) {
	perror ("[argv[1] FILE DESCRIPTOR] Error ");
	exit (1);
    }

    // Redirect the stdout argv[1].
    if (dup2 (file_desc, 1) == -1) {
	perror ("[DUP2] Error ");
	exit (1);
    }

    // Close argv[1], and handle systematically errors due to close.
    if (close(file_desc) < 0) {
	perror("[CLOSE] Error ");
	exit(1);
    }

    // Execute the command ls --sort=t > argv[1].
    if (execlp ("ls", "ls", "--sort=t", NULL) < 0) {
	perror ("Error ");
	exit (1);
    }

    return EXIT_SUCCESS ;
} /** End of main function. */
