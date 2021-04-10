

/* ************************************************************************** */
/* 			     Definition de poids/2  			      */
/*   		objet 					poids (kg)            */
/*    morceau du pont Saint Pierre 		            10        	      */
/*    cachous 						    1                 */
/*    stock de ballons de rugueubi 		            7                 */
/*    goodies Airbus et Cité de l’Espace 	 	    6                 */
/*    ordinateur salle TP N7 				    20        	      */
/* ************************************************************************** */
poids(morceau_du_pont_Saint_Pierre, 10).
poids(cachous, 1).
poids(stock_de_ballons_de_rugueubi, 7).
poids(goodies_Airbus_et_Cite_de_l_Espace, 6).
poids(ordinateur_salle_TP_N7, 20).


/* ************************************************************************** */
/*                        Definition de poids_sac/2                           */
/*   poids_sac(S,P) est vrai si P est le poids total de la liste d’objets S   */
/* ************************************************************************** */
poids_sac([morceau_du_pont_Saint_Pierre, cachous, stock_de_ballons_de_rugueubi, goodies_Airbus_et_Cite_de_l_Espace, ordinateur_salle_TP_N7], 44).

/* ************************************************************************** */
/*                        Definition de sous_liste/2                          */
/*   sous_liste(L, M) est vrai si M est une sous-liste de L, c’est-à-dire si  */
/*   tous les éléments de M sont dans L, et s’ils sont rangés dans le même    */
/*   ordre que dans L. Par exemple, les sous-listes de [a, b] sont [], [a],   */
/*   [b], et [a, b]							      */
/* ************************************************************************** */
sous_liste([morceau_du_pont_Saint_Pierre, cachous, stock_de_ballons_de_rugueubi, goodies_Airbus_et_Cite_de_l_Espace, ordinateur_salle_TP_N7], []).
sous_liste([morceau_du_pont_Saint_Pierre, cachous, stock_de_ballons_de_rugueubi, goodies_Airbus_et_Cite_de_l_Espace, ordinateur_salle_TP_N7], [T]) := member(T, [morceau_du_pont_Saint_Pierre, cachous, stock_de_ballons_de_rugueubi, goodies_Airbus_et_Cite_de_l_Espace, ordinateur_salle_TP_N7]).
sous_liste([morceau_du_pont_Saint_Pierre, cachous, stock_de_ballons_de_rugueubi, goodies_Airbus_et_Cite_de_l_Espace, ordinateur_salle_TP_N7], [T | Q]) := 


