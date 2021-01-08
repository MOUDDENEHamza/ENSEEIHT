module Exo1 = 
 struct

  (* Get the second item. *)
  let second list =
    match list with
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
  let inv list =
    let rec aux acc = function
      | [] -> acc
      | h :: t -> aux (h :: acc) t 
    in aux [] list ;;
  
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