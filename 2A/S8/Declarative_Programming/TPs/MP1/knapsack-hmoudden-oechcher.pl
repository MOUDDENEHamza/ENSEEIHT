

/* ************************************************************************** */
/* 			     Definition de poids/2  			                          */
/*   		objet 					            poids (kg)                    */
/*    morceau du pont Saint Pierre 		            10        	              */
/*    cachous 						                1                         */
/*    stock de ballons de rugueubi 		            7                         */
/*    goodies Airbus et Cité de l’Espace 	 	    6                         */
/*    ordinateur salle TP N7 				        20        	              */
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
poids_sac([], 0).
poids_sac([T | Q], P) :- poids_sac(Q, N), poids(T, M), P is M + N.

/* ************************************************************************** */
/*                        Definition de sous_liste/2                          */
/*   sous_liste(L, M) est vrai si M est une sous-liste de L, c’est-à-dire si  */
/*   tous les éléments de M sont dans L, et s’ils sont rangés dans le même    */
/*   ordre que dans L. Par exemple, les sous-listes de [a, b] sont [], [a],   */
/*   [b], et [a, b]							                                  */
/* ************************************************************************** */
sous_liste(L, []).
sous_liste([T | Q1], [T | Q2]) :- sous_liste(Q1, Q2).
sous_liste([ _ | Q1], [T | Q2]) :- sous_liste(Q1, [T | Q2]).

/* ************************************************************************** */
/*                        Definition de acceptable/2                          */
/*   acceptable(L, S) est vrai si S est une liste d’objets choisis dans la    */
/*   liste L, et si le poids total des objets de S ne dépasse pas 20 kg       */
/* ************************************************************************** */
acceptable(L, S) :- sous_liste(L, S), poids_sac(S, P), P =< 20.

/* ************************************************************************** */
/*                        Definition de meilleur_poids/2                      */
/*   meilleur_poids(L, S) est vrai si S est une liste acceptable d’objets,    */
/*   choisis dans la liste L, de poids maximal : il n’y a pas moyen de        */
/*   choisir dans L une autre liste acceptable d’objets de poids total        */
/*   strictement supérieur au poids total des objets de S                     */
/* ************************************************************************** */
poids_maximal([ordinateur_salle_TP_N7]).
poids_maximal([morceau_du_pont_Saint_Pierre, cachous, stock_de_ballons_de_rugueubi]).
poids_maximal([morceau_du_pont_Saint_Pierre, cachous, goodies_Airbus_et_Cite_de_l_Espace]).

poids_max([morceau_du_pont_Saint_Pierre, cachous, stock_de_ballons_de_rugueubi]).
poids_max([morceau_du_pont_Saint_Pierre, cachous, goodies_Airbus_et_Cite_de_l_Espace]).

meilleur_poids(L, S) :- acceptable(L, S), poids_maximal(S), \+ poids_max(S).