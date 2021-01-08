module Power_set = struct
  
  (** 
  From item e and sets {E1,... ,En} and returns {E1, {e}UE1,... ,En, {e}UEn}. 
  *)
  let add e p =
    List.flatten (List.map (fun subset -> [subset; e :: subset]) p)  

end