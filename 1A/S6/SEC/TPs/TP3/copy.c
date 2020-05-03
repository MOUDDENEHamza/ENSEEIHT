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
    int file_descriptor_1;	  // File descriptor of argv[0].
    int file_descriptor_2;        // File descriptor of argv[1].
    char buffer[BUFSIZE];     	  // Read buffer.

    // Initialize buffer with 0.
    bzero(buffer, sizeof(buffer));

    // Open file source.txt in read mode.
    file_descriptor_1 = open(argv[1], O_RDONLY);

    // Handle systematically errors due to open.
    if (file_descriptor_1 < 0) {
	perror("source.txt ");
	exit(1);
    }

    // Open file cible.txt in write mode.
    file_descriptor_2 = open(argv[2], O_CREAT|O_WRONLY, 0640);

    // Handle systematically errors due to open.
    if (file_descriptor_2 < 0) {
	perror("cible.txt ");
	exit(1);
    }

    // Read the content of source.txt and put it in buffer.
    while (read(file_descriptor_1, buffer, sizeof(buffer)) > 0) {

	// Write the content of buffer in cible.txt.
	if (write(file_descriptor_2, buffer, sizeof(buffer)) < 0) {
		perror("write ");
        	exit(1);
	} 
        
	// Initialize buffer with 0.
    	bzero(buffer, sizeof(buffer));
    }

    // Close the files.
    if (close(file_descriptor_1) < 0) {
	perror("close source.txt ");
        exit(1);
    }
    if (close(file_descriptor_2) < 0) {
        perror("close cible.txt ");
        exit(1);
    }


    return EXIT_SUCCESS ;
} /** End of main function. */
