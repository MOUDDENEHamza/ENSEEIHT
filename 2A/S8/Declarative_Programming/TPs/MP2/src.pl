% Hamza Mouddene
% Oussama Echcherqaoui
% Anass Tyoubi

:- include(libtp2).

%**************************** Modèle basique *********************************%

% 1)- solve(Num, Xs, Ys) qui résolve l’instance Num et affecte les listes de
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

solve_v1(Num, Xs, Ys, B) :-
    data(Num, T, Ts),
    length(Ts, N),
    length(Xs, N),
    length(Ys, N),
    definition(Xs, T, Ts),
    definition(Ys, T, Ts),
    chevauchement(Xs, Ys, Ts),
    fd_labeling(Xs, [backtracks(B)]),
    fd_labeling(Ys, [backtracks(B)]),
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

% 2)- Pour solve_v1 (sans les contraintes redondantes)  pour la première
%     instance on obtient B = 2.
%     Pour solve_v2 (avec les contraintes redondantes)  pour la première
%     instance on obtient B = 0.
%     Effectivement, les contraintes redondantes ont baissé le nombre de
%     backtracks, ceci montre la cohérence de ces contraintes et prouve
%     qu'elles servent à rafiner et élaborer le traitement du problème.

%************************* Stratégie de recherche ****************************%

% Pour résoudre les instances les plus grandes, il faut également utiliser une
% stratégie de sélection des variables qui choisit la variable de plus petite
% valeur minimale, mais de manière plus dynamique qu’avec le prédicat
% fd_labeling.

solve_v3(Num, Xs, Ys, Goal, minmin, B, NbSol) :-
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
    
    labeling(Xs, Ys, Goal, minmin, B, NbSol),
    printsol('tiles.txt', Xs, Ys, Ts). 

% 2)- Pour solve_v3 (assign) pour la deuxième instance on obtient B = 805.
%     Pour solve_v3 (indomain) pour la deuxième instance on obtient B = 9038.


%********************************* Symétries *********************************%

rompre_symetrie_v1([_], [_], [_]).
rompre_symetrie_v1([X , XX | Q1], [Y, YY | Q2], [T , TT | Q3]) :-
    (T #\= TT) #\/ (X #< XX) #\/ (Y #< YY),
    rompre_symetrie_v1([XX | Q1], [YY | Q2], [TT | Q3]).

rompre_symetrie_v2([_], [_], [_]).
rompre_symetrie_v2([X , XX | Q1], [Y, YY | Q2], [T , TT | Q3]) :-
    (T #\= TT) #\/ ((X #< XX #\/ Y #< YY) #/\ X #=< XX),
    rompre_symetrie_v2([XX | Q1], [YY | Q2], [TT | Q3]).
    
solve_v4(Num, Xs, Ys, Goal, minmin, B, NbSol) :-
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
    
    rompre_symetrie_v2(Xs, Ys, Ts),

    labeling(Xs, Ys, Goal, minmin, B, NbSol),
    printsol('tiles.txt', Xs, Ys, Ts). 

% 1)- Le nombre de solutions possible pour la première instances est 480 .En
%     supprimant la symétrie de permutation, le nombre de solutions restantes
%     est 30.

% 2)- Il reste 4 solutions pour la première instance et 10216 solutions pour
%     la deuxième instance.
