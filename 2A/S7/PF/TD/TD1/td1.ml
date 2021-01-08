module Exo1 = 
 struct

  (* Get the second item. *)
  let second l =
    match l with
    | _ :: x :: _ -> x
    | _ -> failwith "list should have at least 2 items" ;;
   
  let%test _ = second [1; 2; 3] = 2
  let%test _ = second ['a'; 'b'] = 'b'

  (* Generate a list from n to zero. *)
  let rec n_to_zero n =
    if n < 0 then
      []
    else
      n :: (n_to_zero (n - 1)) ;;
  
  (* Generate a list from zero to n.*)
  let inv l =
    let rec aux acc = function
      | [] -> acc
      | h :: t -> aux (h :: acc) t 
    in aux [] l ;;
  
  (* Generate a list from n to zero.*)
  let zero_to_n_v1 n =
    inv (n_to_zero n) ;;
    
  (* Generate a list from n to zero.*)
  let zero_to_n_v2 n =
    let rec aux i =
      if i == n then
        [n]
      else
        i :: aux (i + 1)
    in aux 0 ;;

end

module Exo2 = struct

  (* Apply f to each element of list. *)
  let rec map_v1 f l =
    match l with 
    | [] -> []
    | h :: t -> (f h) :: (map_v1 f t) ;;
  
  (* Apply f to each element of list using fold_right. *)
  let rec map_v2 f l =
    List.fold_right (fun h acc -> f h :: acc) l [] ;;
    
end