/*
 *  Auteur :  Xavier CREGUT
 *  Date :    07/09/98, 11:21:58
 *
 *  Objectif :
 *	Test des files
 *
 *  Changements :
 *
 *  	$Log$
 */

#include "file.h"
#include <stdlib.h>
#include <assert.h>

int main ()
{
    File f;
    char val;
    initialiser (&f);
    assert(0 == longueur(f));


    inserer (&f, 'O');
    assert(1 == longueur(f));
    assert('O' == tete(f));

    inserer (&f, 'K');
    assert(2 == longueur(f));
    assert('O' == tete(f));

    inserer (&f, '?');
    assert(3 == longueur(f));
    assert('O' == tete(f));

    extraire (&f, &val);
    assert('O' == val);
    assert(2 == longueur(f));
    assert('K' == tete(f));

    extraire (&f, &val);
    assert('K' == val);
    assert(1 == longueur(f));
    assert('?' == tete(f));

    extraire (&f, &val);
    assert('?' == val);
    assert(0 == longueur(f));

    // Tester l'ajout dans une file vidée
    inserer (&f, 'Y');
    assert(1 == longueur(f));
    assert('Y' == tete(f));

    detruire(&f);

    return EXIT_SUCCESS;
}
