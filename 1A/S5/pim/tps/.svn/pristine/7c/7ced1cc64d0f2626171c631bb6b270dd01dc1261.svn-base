#! /usr/bin/python3

# Afficher le plus petit et le plus grand élément d'une série d'entiers
# naturels lus au clavier.  La saisie de la série se termine par 0
# (qui n'appartient pas à la série).
# Exemple : 2, 9, 3, 6, 3, 0 -> min = 2 et max = 9

# afficher la consigne
print('Saisir les valeurs de la série (-1 pour terminer) :')

# saisir un premier entier
entier = int(input())
if entier == 0:  # entier n'est pas une valeur de la série
    print('Pas de valeurs dans la série')
else:   # entier est le premier élément de la série
    # initialiser min et max avec le premier entier
    min = entier
    max = entier

    # traiter les autres éléments de la série
    entier = int(input())   # saisir un nouvel entier
    while entier != 0:      # entier est une valeur de la série
        # mettre à jour le min et le max
        if entier > max:   # nouveau max
            # mettre à jour le max avec entier
            max = entier
        elif entier < min:  # nouveau min
            # mettre à jour le min avec entier
            min = enlier
        else:
            pass 

        # saisir un nouvel entier
        entier = int(input())

    # afficher le min et le max
    print('min =', min)
    print('max =', max)
