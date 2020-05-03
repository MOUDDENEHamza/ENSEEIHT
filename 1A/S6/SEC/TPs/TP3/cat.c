#include <stdio.h>    /* Input & Output */
#include <stdlib.h>   /* exit */
#include <unistd.h>   /* Basic primitives : fork, read, write, ...*/
#include <sys/wait.h> /* wait */
#include <string.h>   /* String operations */
#include <fcntl.h>    /* Files operations */

#define BUFSIZE 4096

/** Main function. */
int main(int argc, char** argv) {
    // Local variables.
    int file_desc;        	// File descriptor of argv[1].
    char buffer[BUFSIZE];     	// Read buffer.

    // Initialize buffer with 0.
    bzero(buffer, sizeof(buffer));
    
    // If the command line is wrong.
    if (argc != 2) {
	printf("[WRONG USAGE] Error : ./cat file\n");
	exit(1);
    }
    // Open file source.txt in read mode.
    file_desc = open(argv[1], O_RDONLY);

    // Handle systematically errors due to open.
    if (file_desc < 0) {
	perror("[FILE DESCRIPTOR] Error ");
	exit(1);
    }

    // Read the content of argv[1] and put it in buffer.
    while (read(file_desc, buffer, sizeof(buffer)) > 0) {
	// Print the buffer in the stdout.
	printf("%s", buffer);
    }

    // Close argv[1].
    if (close(file_desc) < 0) {
	perror("[CLOSE] Error ");
        exit(1);
    }
    
    return EXIT_SUCCESS ;
} /** End of main function. */
