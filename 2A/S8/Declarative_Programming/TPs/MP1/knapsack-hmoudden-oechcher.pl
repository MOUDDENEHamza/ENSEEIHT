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

utilite(morceau_du_pont_Saint_Pierre, 1).
utilite(cachous, 2).
utilite(stock_de_ballons_de_rugueubi, 3).
utilite(goodies_Airbus_et_Cite_de_l_Espace, 4).
utilite(ordinateur_salle_TP_N7, 5).

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
/*   meilleur_poids(L, S) (NÉGATION PAR ÉCHEC) est vrai si S est une          */
/*   liste acceptable d’objets, choisis dans la liste L, de poids             */
/*   maximal : il n’y a pas moyen de choisir dans L une autre liste           */
/*   acceptable d’objets de poids total strictement supérieur au poids        */
/*   total des objets de S                                                    */
/* ************************************************************************** */
meilleur_poids(L, S1) :- acceptable(L, S1), poids_sac(S1, P1),
                        \+ (acceptable(L, S2), poids_sac(S2, P2), P1 < P2).

/* ************************************************************************** */
/*                        Definition de meilleur_utilite/2                    */
/*   meilleure_utilite(L, S) est vrai si S est une liste d’objets de poids    */
/*   maximal et d’utilité maximale                                            */
/* ************************************************************************** */
somme_utilite([], 0).
somme_utilite([T | Q], U) :- somme_utilite(Q, N), utilite(T, M), U is M + N.

meilleure_utilite(L, S1) :- acceptable(L, S1), somme_utilite(S1, U1),
                            \+ (acceptable(L, S2), somme_utilite(S2, U2), U1 < U2).

/* ************************************************************************** */
/*                   q([],_,_) :- fail.                                       */
/*                   q([X|_],[],[X]).                                         */
/*                   q([X|RR],[X|RC],S) :- q(RR,RC,S).                        */
/*                   q([X|_],[Y|RC],S) :- X \= Y, S = [X,Y|RC].               */
/*                   p(R,C,[C]) :- \+ (q(R,C,_)).                             */
/*                   p(R,C,[C|V]) :- q(R,C,S), p(R,S,V).                      */
/* ************************************************************************** */
/* Le prédicat p est un prédicat d'arité 3, tels que le premier paramètre est */
/* une liste qui contient plusieurs élements, le deuxième paramètre est un    */
/* marqueur dans la première liste(1er paramètre) et le dernier paramètre     */
/* est l'ensemble des parties partant du deuxième paramètre dans la liste     */
/* initiale, par exemple: p([a,b],[],X) est vrai si et seulement si           */
/* X = [[], [a], [b], [a, b]], p([a,b],[a],X) est vrai si et seulement si     */
/* X = [[a], [b], [a, b]], p([a,b],[b],X) est vrai si et seulement si         */
/* X = [[b], [a, b]] et p([a,b],[a, b],X) est vrai si et seulement si         */
/* X = [[a, b]]                                                               */ 
/* ************************************************************************** */
q([],_,_) :- fail.
q([X|_],[],[X]).
q([X|RR],[X|RC],S) :- q(RR,RC,S).
q([X|_],[Y|RC],S) :- X \= Y, S = [X,Y|RC].
p(R,C,[C]) :- \+ (q(R,C,_)).
p(R,C,[C|V]) :- q(R,C,S), p(R,S,V).

/* ************************************************************************** */
/*                        Definition de meilleur_poids_v2/2                   */
/*   meilleur_poids_v2(L, S) est vrai si S est une liste acceptable d’objets, */
/*   choisis dans la liste L, de poids maximal : il n’y a pas moyen de        */
/*   choisir dans L une autre liste acceptable d’objets de poids total        */
/*   strictement supérieur au poids total des objets de S                     */
/* ************************************************************************** */
check([], P1).
check([T | Q], P1) :- poids_sac(T, P2), P1 =< P2, check(Q, P1). 

meilleur_poids_v2(L, S1) :- acceptable(L, S1), poids_sac(S1, P1),
                            p(L, [], X), check(X, P1).