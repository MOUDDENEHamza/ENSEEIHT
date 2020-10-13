requin(jacques).

carnivore(requin(X)).

lapin(bugs).

vegetarien(lapin(X)).

omnivore(X) :-
   carnivore(X),
vegetarien(X).
    
