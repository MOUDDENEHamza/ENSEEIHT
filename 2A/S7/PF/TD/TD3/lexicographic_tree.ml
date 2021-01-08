(** 
   the type 'a tree representing the tree structure: multiway tree with
   booleans in nodes and ’a in branches. 
*)
type tree = Node of bool * ((char * tree) list);;

let tree = (Node(false, []))

(* exist : 'a list -> 'a tree -> bool
Function that tests if a given item is in the tree.
Parameter tree : the lexicographic tree we will test.
Parameter item : the item we search in the tree.
Result : true if it exists, otherwise false.
*)
let rec exist item (Node(value, subtree)) = 
    match item with
    | [] -> value
    | h :: t ->
        match () with 
        | None -> false
        | Some a -> exist t a

let%test _ = exist ['x']  tree

(* add : 'a tree -> 'a list -> bool
Add an item to the tree.
Parameter tree : the lexicographic tree we will append.
Parameter item : the item we will add.
Result : the multiway tree with the added word.
*)
let rec add item (Node (value, subtree)) = 
    match item with
    | [] -> (Node (true, subtree))
    | h::t ->
        let tmp = 
            let belongs = (exist h subtree) in
                match belongs with
                    | false   -> Node (false, [])
                    | Some a -> a
            in Node (b, maj h  (add t tmp) subtree)

(**
    this type is triplet of tree and two functions.
 *)
type ('a, 'b) sort = Sort of ('a tree) * ('b -> 'a list) * ('a list -> 'b)

let rec appartient mot trie = 
    match trie with 
    | Trie(Noeud(b, lf), fd, fr) -> 
        match (fd mot) with 
        | [] -> b
        | c::q -> 
            match (recherche c lf) with 
            | None -> false
            | Some sa -> appartient (fr q) (Trie(sa, fd, fr))

let ajout mot (Trie(arbre, decompose, recompose)) = 
    Trie (ajout_arbre (decompose mot) arbre,decompose,recompose)