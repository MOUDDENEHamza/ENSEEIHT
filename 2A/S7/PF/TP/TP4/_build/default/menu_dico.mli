open Trie

(*                     Module Menu_dico                                       *)

(******************************************************************************)
(*                                                                            *)
(*      fonction de gestion d'un dictionnaire par un menu de commandes        *)
(*                                                                            *)
(******************************************************************************)
val gere_dico :
   (* la fonction qui décompose un mot en caractères*)
        ('a -> 'b list) ->
   (* la fonction qui recompose un mot *)
        ('b list -> 'a) ->
   (* la fonction qui lit un mot *)
        (unit -> 'a) ->
   (* la procédure qui affiche un mot *)
        ('a -> unit) ->
   (* la fonction de création d'un trie *)
        (('a -> 'b list) -> ('b list -> 'a) -> ('a, 'b) trie) ->
   (* la fonction qui teste l'appartenance d'un mot à un trie *)
        ('a -> ('a, 'b) trie -> bool) ->
   (* la fonction qui ajoute un mot à un trie *)
        ('a -> ('a, 'b) trie -> ('a, 'b) trie) ->
   (* la fonction qui retire un mot d'un trie *)
        ('a -> ('a, 'b) trie -> ('a, 'b) trie) ->
   (* la procédure qui affiche un trie *)
        (('a -> unit) -> ('a, 'b) trie -> unit) ->
   (* la liste initiale de mots *)
        ('a list) ->
   unit
