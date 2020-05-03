#include <stdio.h>    /* Input & Output */
#include <stdlib.h>   /* exit */
#include <unistd.h>   /* Basic primitives : fork, read, write, ...*/
#include <sys/wait.h> /* wait */
#include <string.h>   /* String operations */
#include <fcntl.h>    /* Files operations */

/** Main function. */
int main(int argc, char** argv) {
    // Local variables.
    int file_desc;                // File descriptor of temp.txt.
    int i;                        // Index of loop.
    char file[] = "temp.txt";	  // Path file.
    pid_t pid;		  	  // The pid of the process.  
    int n;			  // The integer will store the result of read.

    // Create child process.
    pid = fork();

    // If the fork failed.
    if (pid < 0) {
	perror("[FORK] Error ") ;
	exit(1);
    }

    // If son is created with success.
    if (pid == 0) {
	// Open file temp.txt in write mode.
	file_desc = open(file, O_WRONLY|O_CREAT|O_TRUNC, 0640);

	// Handle systematically errors due to open.
	if (file_desc < 0) {
	    perror("[OPEN] temp.txt ");
	    exit(1);
	}
	// Start loop.
	for (i = 1; i <= 30; i++) {
	    // Shift all the writings of a second.
	    sleep(1);
	    // write the current integer in temp.txt
	    if (write(file_desc, &i, sizeof(int)) < 0) {
		perror("[WRITE] Error ");
		exit(1);
	    }
	    printf("CHILD = %d\n", i);
	    if (i == 10 || i == 20) {
		if (lseek(file_desc, 0, SEEK_SET) < 0) {
		    perror("[LSEEK] Error ");
		    exit(1);
		}
	    }
	}

	// Close temp.txt.
	if (close(file_desc) < 0) {
	    perror("[CLOSE] temp.txt ");
	    exit(1);
	}

	exit(0);
    }

    // Parent process.
    if (pid > 0) {
	// Open file temp.txt in write mode.
	file_desc = open(file, O_RDONLY|O_CREAT, 0640);

	// Handle systematically errors due to open.
	if (file_desc < 0) {
	    perror("[OPEN] temp.txt ");
	    exit(1);
	}

	// Start loop.
	sleep(1);
	for (i = 1; i <= 3; i++) {
	    sleep(10);
	    while(read(file_desc, &n, sizeof(int))) {
		printf("%d\n", n);
	    }
	    if (lseek(file_desc, 0, SEEK_SET) < 0) {
		perror("[LSEEK] Error ");
		exit(1);
	    }
	}

	// Close temp.txt.
	if (close(file_desc) < 0) {
	    perror("[CLOSE] temp.txt ");
	    exit(1);
	}

    }
    return EXIT_SUCCESS;
}/** End of main function. */
