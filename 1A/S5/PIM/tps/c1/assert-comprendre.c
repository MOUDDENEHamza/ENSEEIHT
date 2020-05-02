#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

void assert_ok() {
    int n = 10;
    assert(n > 0);
    printf("(assert_ok) n = %d\n", n);
}


void assert_erreur() {
    int n = 10;
    assert(n <= 0);
    printf("(assert_erreur) n = %d\n", n);
}


int main(void) {
    assert_ok();
    assert_erreur();
    return EXIT_SUCCESS;
}
