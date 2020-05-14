#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "display_shell.h"

#define RED "\x1B[31m"
#define GREEN "\x1B[32m"
#define BLUE "\x1B[34m"
#define RESET "\x1B[0m"

/** Clear the screen. */
void clear_screen(void) {
        printf("\e[1;1H\e[2J");
}

/** Display the init bar. */
void init_bar(void) {
    clear_screen();
    printf("           _       _ __ _          _ _ \n"); 
    printf(" _ __ ___ (_)_ __ (_) _\\ |__   ___| | |\n");
    printf("| '_ ` _ \\| | '_ \\| \\ \\| '_ \\ / _ \\ | |\n");
    printf("| | | | | | | | | | |\\ \\ | | |  __/ | |\n");
    printf("|_| |_| |_|_|_| |_|_\\__/_| |_|\\___|_|_|\n\n");
}

/** Function to replace a string with another string. */
char *replaceWord(const char *s, const char *oldW, const char *newW) {
    char *result;
    int i, cnt = 0;
    int newWlen = strlen(newW);
    int oldWlen = strlen(oldW);

    // Counting the number of times old word
    // occur in the string
    for (i = 0; s[i] != '\0'; i++)
    {
        if (strstr(&s[i], oldW) == &s[i])
        {
            cnt++;

            // Jumping to index after the old word.
            i += oldWlen - 1;
        }
    }

    // Making new string of enough length
    result = (char *)malloc(i + cnt * (newWlen - oldWlen) + 1);

    i = 0;
    while (*s)
    {
        // compare the substring with the result
        if (strstr(s, oldW) == s)
        {
            strcpy(&result[i], newW);
            i += newWlen;
            s += oldWlen;
        }
        else
            result[i++] = *s++;
    }

    result[i] = '\0';
    return result;
}

/** Print the prompt. */
void print_prompt(void) {
	char buf[BUFSIZ];
	char *tmp = replaceWord(getcwd(buf, sizeof(buf)), "/home/hamza", "~");
	printf(GREEN"sh3-2"RESET":"BLUE"%s"RESET"$ ", tmp);
	free(tmp);
}

/** Display the end bar. */
void end_bar(void) {
    printf("\nGOODBYE!\n\n");
}
