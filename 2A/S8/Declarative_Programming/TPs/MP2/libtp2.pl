% 2SNL Informatique -- PDL/PPC
% Donnees et predicats pour le TP2
% 2020/2021
% Nicolas Barnier

data(1, 3, [2,1,1,1,1,1]).
data(2, 19, [10,9,7,6,4,4,3,3,3,3,3,2,2,2,1,1,1,1,1,1]).
data(3, 112, [50,42,37,35,33,29,27,25,24,19,18,17,16,15,11,9,8,7,6,4,2]).
data(4, 175, [81,64,56,55,51,43,39,38,35,33,31,30,29,20,18,16,14,9,8,5,4,3,2,1]).

printall([], [], [], _).
printall([X|Xs], [Y|Ys], [T|Ts], S):-
	XT is X+T,
	YT is Y+T,
	format(S, "%d %d\n%d %d\n%d %d\n%d %d\n%d %d\n\n", [X,Y,XT,Y,XT,YT,X,YT,X,Y]),
        printall(Xs, Ys, Ts, S).

printsol(Sink, Xs, Ys, Ts):-
	open(Sink, write, S),
	printall(Xs, Ys, Ts, S),
	close(S).

indomain(X):-
        non_fd_var(X), !.
indomain(X):-
        fd_min(X, MinX),
        (X #= MinX; (g_inc(bt), X #\= MinX, indomain(X))).

assign(X):-
        non_fd_var(X), !.
assign(X):-
        fd_min(X, MinX),
        (X #= MinX; (g_inc(bt), X #\= MinX)).

labeling1([], _, _):- !.
labeling1(Vars, Goal, Criterion):-
        skipcst(Vars, Unks),
        Unks = [_|_] ->
        (mincrit(Unks, Criterion, Best, Rest),
	G =.. [Goal, Best],
	call(G),
        labeling1([Best|Rest], Goal, Criterion));
        true.

labeling(Xs, Ys, Goal, Criterion, B, NbSol):-
	g_assign(bt, 0),
	g_assign(nbsol, 0),
	labeling1(Xs, Goal, Criterion),
	labeling1(Ys, Goal, Criterion),
	g_inc(nbsol, NbSol),
	g_read(bt, B).

skipcst([], []).
skipcst([X|Xs], Vars):-
	non_fd_var(X), !,
	skipcst(Xs, Vars).
skipcst([X|Xs], [X|Vs]):-
	skipcst(Xs, Vs).

mincritrec([], _, _, Best, Rest, Best, Rest).
mincritrec([X|Xs], Criterion, BC, BX, Rest, B, R):-
        non_fd_var(X), !,
        mincritrec(Xs, Criterion, BC, BX, Rest, B, R).
mincritrec([X|Xs], Criterion, BC, BX, Rest, B, R):-
        GC =.. [Criterion,X,C],
        call(GC),
        C @< BC -> mincritrec(Xs, Criterion, C, X, [BX|Rest], B, R);
        mincritrec(Xs, Criterion, BC, BX, [X|Rest], B, R).


mincrit([X|Xs], Criterion, Best, Rest):-
	GC =.. [Criterion,X,C],
	call(GC),
        mincritrec(Xs, Criterion, C, X, [], Best, Rest).

minsizemin(V, [S, M]):-
        fd_size(V, S),
        fd_min(V, M).

minmin(V, M):-
        fd_min(V, M).
