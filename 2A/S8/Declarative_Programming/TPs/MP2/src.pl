% Hamza Mouddene

:- include(libtp2).

%**************************** Modèle basique *********************************%

% solve(Num, Xs, Ys) qui résolve l’instance Num et affecte les listes de
% variables de décisions Xs et Ys.
definition([], _, []).
definition([H1 | Q1], T, [H2 | Q2]) :-
    N is T - H2,
    fd_domain(H1, 0, N),
    definition(Q1, T, Q2).

chevauchement_par_paire(_, _, _, [], [], []).
chevauchement_par_paire(X, Y, T, [XX | Q1], [YY | Q2], [TT |Q3]) :-
    X + T #=< XX #\/ XX + TT #=< X #\/ Y + T #=< YY #\/ YY + TT #=< Y,
    chevauchement_par_paire(X, Y, T, Q1, Q2, Q3).
    
chevauchement([], [], []).
chevauchement([X | Q1], [Y | Q2], [T | Q3]) :-
    chevauchement_par_paire(X, Y, T, Q1, Q2, Q3),
    chevauchement(Q1, Q2, Q3).

solve_v1(Num, Xs, Ys) :-
    data(Num, T, Ts),
    length(Ts, N),
    length(Xs, N),
    length(Ys, N),
    definition(Xs, T, Ts),
    definition(Ys, T, Ts),
    chevauchement(Xs, Ys, Ts),
    fd_labeling(Xs),
    fd_labeling(Ys),
    printsol('tiles.txt', Xs, Ys, Ts). 

%************************* Contrainte redondantes ****************************%

% Pour résoudre des instances de plus grande taille, on peut améliorer
% l’efficacité de la propagation de contraintes en ajoutant les contraintes
% redondantes suivantes : la somme des tailles des petits carrés coupés par une
% verticale (ou une horizontale) est égale à la taille du grand carré.

numlist(L, U, Ns) :-
    L =< U,
    numlist_(L, U, Ns).
    numlist_(U, U, List) :-
    !,
    List = [U].
    numlist_(L, U, [L|Ns]) :-
    L2 is L+1,
    numlist_(L2, U, Ns).

somme_liste([], 0).
somme_liste([H | Q], Resultat) :-
    somme_liste(Q, W),
    Resultat #= H + W.

contrainte_redondante_par_unite(_, [] , [], []).
contrainte_redondante_par_unite(Vi, [H | Q1] , [Ti | Q2], [Si | Q3]) :-
    Ci #<=> (H #=< Vi #/\ Vi #< H + Ti),
    Si #= Ti * Ci,
    contrainte_redondante_par_unite(Vi, Q1 , Q2, Q3).

contrainte_redondante([], List, Ts, T).
contrainte_redondante([Vi | Q], List, Ts, T) :-
    contrainte_redondante_par_unite(Vi, List, Ts, S),
    somme_liste(S, Resultat),
    T #= Resultat,    
    contrainte_redondante(Q, List, Ts, T).

solve_v2(Num, Xs, Ys, B) :-
    data(Num, T, Ts),
    length(Ts, N),
    length(Xs, N),
    length(Ys, N),
    definition(Xs, T, Ts),
    definition(Ys, T, Ts),

    M is T - 1,
    numlist(0, M, V),
    contrainte_redondante(V, Xs, Ts, T),
    contrainte_redondante(V, Ys, Ts, T),

    chevauchement(Xs, Ys, Ts),
    
    fd_labeling(Xs, [backtracks(B)]),
    fd_labeling(Ys, [backtracks(B)]),
    printsol('tiles.txt', Xs, Ys, Ts). 

%************************* Stratégie de recherche ****************************%



%********************************* Symétries *********************************%


