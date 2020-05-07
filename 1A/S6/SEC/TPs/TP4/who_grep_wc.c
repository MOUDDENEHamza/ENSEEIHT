/** 
 * Get the number of line of who command wich contains the username given in
 * commandline.
 * Commandline : who | grep username | wc -l
 * Author : Hamza MOUDDENE
 */

#include <stdio.h>    /* Input & Output */
#include <stdlib.h>   /* exit */
#include <unistd.h>   /* Basic primitives : fork, read, write, ...*/

/** Main function. */
int main (int argc, char** argv) {
    // Local variables.
    int i;		        // Index of the loop.
    pid_t child;	 	// The process child.
    pid_t grand_son;		// The grandson process.
    int pipe_s2f[2];      	// Pipe to communicate from child to father.
    int pipe_ss2s[2];           // Pipe to cimmunacate from grandson to son.

    // If the command line is wrong.
    if (argc != 2) {
	printf("[WRONG USAGE] Error : ./main username\n");
	exit(1);
    }

    // Create the first pipe, handle systematically errors due to pipe.
    if (pipe (pipe_s2f) == -1) { 
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
	// Close the extremity 1, the child is reading.
        close(pipe_s2f[0]);

        // Redirect what the child will write to stdout.
        if (dup2 (pipe_s2f[1], 1) == -1) {
            perror ("[DUP2] Error ");
            exit (1);
        }

        // Close the extremity 0 : End of reading.
        close (pipe_s2f[1]);

	// Create the second pipe, handle systematically errors due to pipe.
    	if (pipe (pipe_ss2s) == -1) {
        	perror ("[PIPE] Error ");
        	exit (1);
    	}
        
	// Create grandson process.
    	grand_son = fork();

    	// If the fork failed.
    	if (grand_son < 0) {
        	perror ("[FORK] Error ") ;
        	exit (1);
    	}

	// If grandson is created with success.
	if (grand_son == 0) {
	    // Close extremity 0, the grandson will write in the pipe.
	    close (pipe_ss2s[0]) ;

	    // Redirect what the grandson will write to stdout.
	    if (dup2 (pipe_ss2s[1], 1) == -1) {
		perror ("[DUP2] Error ");
		exit (1);
	    }
	    
	    // Close the extremity 1 : End of sending.
	    close (pipe_ss2s[1]);

	    // Execute the command who.
	    if (execlp ("who", "who", NULL) < 0) {
		perror ("Error ");
		exit (1);
	    }
	}

	// The child process
	else {
	    // Close the extremity 1,the child will read in the pipe.
	    close (pipe_ss2s[1]) ;

	    // Redirect what the child will read to stdin.
	    if (dup2 (pipe_ss2s[0], 0) == -1) {
		perror ("[DUP2] Error ");
		exit (1);
	    }

	    // Close the extremity 0 : End of reading.
	    close (pipe_ss2s[0]);

	    // Execute the command grep.
	    if (execlp ("grep", "grep", argv[1], NULL) < 0) {
		perror ("Error ");
		exit (1);
	    }
	}

	exit (0);
    }

    // Parent process.
    else {
	// Close the extremity 1, the father is reading.
	close(pipe_s2f[1]);

	// Read what the child sent.
	if (dup2 (pipe_s2f[0], 0) == -1) {
	    perror ("[DUP2] Error ");
	    exit (1);
	}

	// Close the extremity 0 : End of reading.
	close (pipe_s2f[0]);

	// Execute the command wc.
	if (execlp ("wc", "wc", "-l", NULL) < 0) {
	    perror ("Error ");
	    exit (1);
	}
    }

    return EXIT_SUCCESS ;
} /** End of main function. */
