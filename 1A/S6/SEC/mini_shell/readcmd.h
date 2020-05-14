#ifndef __READCMD_H
#define __READCMD_H

/* Lit une ligne de commande depuis l'entrée standard.
 * Remarque :
 * Dans le cas où suffisamment de mémoire ne peut être allouée pour le résultat,
 * affiche un message d'erreur et appelle exit().
 */
struct cmdline *readcmd(void);


/* Structure retournée par readcmd() */
struct cmdline {
	char *err;	/* Si non null : message d'erreur à afficher. 
				 * Dans ce cas, les autres champs sont nuls. */
	char *in;	/* Si non null : nom du fichier vers lequel l'entrée doit être redirigée. */
	char *out;	/* Si non null : nom du fichier vers lequel la sortie doit être redirigée. */
	char *backgrounded; /* Si non null : commande en tâche de fond */ 
	char ***seq;	/* Une ligne de commande est une suite de commandes liées par des tubes
					 * Ainsi, 
					 * - une commande est un tableau de chaînes de caractères (char **).
                     *   Chaque élément de ce tableau est en effet une chaîne (char *)
                     *   correspondant à un argument de la commande.
					 *   Le dernier pointeur du tableau est suivi d'un pointeur null, qui
                     *   marque la fin du tableau.
					 * - seq est un tableau de commandes (char ***), chaque commande de ce
                     *   tableau correspondant à une commande élémentaire du pipeline.
					 *   Le dernier élément (char **) du tableau est ici aussi suivi d'un pointeur null.
					 * - Dans le cas particulier où une ligne vide est saisie, le pointeur référencé par
                     *   seq vaut directement NULL : puisque le tableau n'a aucun élément, le marqueur
                     *   de fin de tableau se trouve référencé par seq, ce que l'on peut écrire 
                     *   (*seq == NULL) 
                     *   (ou (seq[0] == NULL), mais cela peut prêter à confusion, seq[0] n'existant pas)
					 */
};
#endif

