/** 
 * Print the content of a given file argv[1] in argv[2].
 * Commandline : cat argv[1] > argv[2] or cp argv[1] argv[2]
 * Author : Hamza MOUDDENE
 */

#include <stdio.h>    /* Input & Output */
#include <stdlib.h>   /* exit */
#include <unistd.h>   /* Basic primitives : fork, read, write, ...*/
#include <sys/wait.h> /* wait */
#include <string.h>   /* String operations */
#include <fcntl.h>    /* Files operations */

/** Main function. */
int main(int argc, char** argv) {
    // Local variables.
    int file_desc;        	// File descriptor of argv[1].

    // If the command line is wrong.
    if (argc != 3) {
	printf("[WRONG USAGE] Error : ./cat file1 file2\n");
	exit(1);
    }

    /** Open file argv[2] in write mode, if it doesn't exist it will be created,
      and all the existing content will be erased. */
    file_desc = open(argv[2], O_WRONLY | O_CREAT | O_TRUNC, 0640);

    // Handle systematically errors due to open.
    if (file_desc < 0) {
	perror("[FILE DESCRIPTOR] Error ");
	exit(1);
    }

    // Redirect the stdout to argv[2].
    if (dup2 (file_desc, 1) == -1) {
        perror ("[DUP2] Error ");
        exit (1);
    }

    // Close argv[1].
    if (close(file_desc) < 0) {
	perror("[CLOSE] Error ");
	exit(1);
    }

    // Execute the command cat argv[1] > argv[2].
    if (execlp ("cat", "cat", argv[1], NULL) < 0) {
	perror ("Error ");
	exit (1);
    }

    return EXIT_SUCCESS ;
} /** End of main function. */
