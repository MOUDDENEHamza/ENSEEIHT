(********************************** NLIST ************************************)

(* ('a, 'n) nlist represents a list containing 'n items of type 'a. *)
type zero = private Dummy1
type _ succ = private Dummy2
type nil = private Dummy3
type (_,_) nlist = 
  | Nil : (_, zero) nlist
  | Cons : 'a * ('a, 'n) nlist -> ('a, 'n succ) nlist 

(*
 Applies function f to a1, ..., an, and builds the list [f a1; ...; f an] with
 the results returned by f.
 Type :  ('a -> 'b) -> ('a, 'n) nlist -> ('b, 'n) nlist
 Parameter : func we will apply on the list.
 Parameter : l the lists we will handle.
 Result : the list [f a1; ...; f an] with the results returned by func.
*)
let rec map : type n . ('a -> 'b) -> ('a, n) nlist -> ('b, n) nlist = 
  fun f -> function
    | Nil -> Nil
    | Cons (hd, tl) -> Cons (f hd, map f tl)

let%test _ = map (fun e -> e) Nil = Nil

let rec snoc : type n . 'a -> ('a, n) nlist -> ('a, n succ) nlist = 
  fun x -> function 
    | Nil -> Cons (x, Nil)
    | Cons (hd, tl) -> Cons (hd, snoc x tl)

let tail : type n . ('a, n succ) nlist -> ('a, n) nlist = function
| Cons (_, tl) -> tl 

let rec rev l =
  failwith "TODO rev";;

let rec insert x l =
  match l with
  | [] -> x::l
  | t :: q -> if t < x then t::insert x q else x :: l ;;

let rec insertion_sort l =
  match l with
  | [] -> []
  | t :: q -> insert t (insertion_sort q );;