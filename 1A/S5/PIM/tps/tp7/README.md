1. Le type T_Vecteur_Creux est déjà défini. Un invariant spécifie que les 
composantes sont stockées par ordre croissant de leurs indices. Ceci permet 
d’implanter de manière efficace (en temps linéaire) les opérations telles que
le produit scalaire, l’égalité ou la somme de deux vecteurs. Si on prend 
l'exemple de la première fonction qui est le produit scalaire, on ne recherche
pas l'élement qui correspond à l'indice alors ça réduit la compléxité.
