fact(0, 1).
fact(N, Y) :- N > 0, M is N - 1, fact(M, X), Y is X * N.
