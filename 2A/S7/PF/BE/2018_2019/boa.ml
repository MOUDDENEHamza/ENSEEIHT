(** L’interface correspondant à une règle de réécriture. *)
module type Regle =
sig
  (** tid est le type des identifiants de règles. *)
  type tid = int

  (** td est le type des termes. *)
  type td = char list

  (** Designer le type des identifiants de règles. 
  Signature : id : char list -> int
  Resulat : retourne le type de l'identificateur de la régle
  *)
  val id : tid -> int

  (** 
  Appliquer la règle sur un terme. 
  Signature : appliquer : char list -> char list list
  Resulat : retourne le nouveu terme généré
  *)
  val appliquer : td -> td list
end

module Regle1 : Regle = struct
  type tid = int

  type td = char list
  
  let id tid = 1
  
  let rec appliquer td =
    [List.append td ['A']];;
  
  let%test _ = appliquer ['B';'O'] = [['B'; 'O'; 'A']]

end

module Regle2 : Regle = struct
  type tid = int

  type td = char list
  
  let id tid = 2
  
  let appliquer td =
    [List.append td (List.tl td)]
  
  let%test _ = appliquer ['B'; 'O'; 'A'] = [['B'; 'O'; 'A'; 'O'; 'A']]

end


module Regle3 : Regle = struct
  type tid = int

  type td = char list
  
  let id tid = 3
  
  let rec appliquer lc =  
    match lc with
    | t1 :: t2 :: t3 :: q ->  
      if ((t1 == 'O') && (t2 == 'O') && (t3 =='O')) || ((t1 =='A') && (t2 == 'O') && (t3 == 'A')) then 
        (['A':: q]) @ (List.map (fun l -> t1 :: l) (appliquer (t2 :: t3 :: q)))
      else
        (List.map (fun l -> t1 :: l) (appliquer (t2 :: t3 :: q)))
    | _ -> []

  let%test _ = List.mem ['B'; 'A'; 'O'] (appliquer ['B'; 'O'; 'O'; 'O'; 'O'])
  let%test _ = List.mem ['B'; 'O'; 'A'] (appliquer ['B'; 'O'; 'O'; 'O'; 'O'])
  let%test _ = List.length (appliquer ['B'; 'O'; 'O'; 'O'; 'O']) = 2

end


module Regle4 : Regle = struct
  type tid = int

  type td = char list
  
  let id tid = 4
  
  let rec appliquer td =
    match td with 
    | t1 :: t2 :: q ->  
      if (t1 == 'A') && (t2 == 'A') then 
        [q]
      else
        (List.map (fun l -> t1 :: l) (appliquer (t2 :: q)))
    | _ -> []

  let%test _ = appliquer ['B';'O';'A';'A';'O']  = [['B';'O';'O']]

end

module type ArbreReecriture = sig
  (** tid est le type des identifiants de règles.*)
  type tid = int

  (** td est le type des termes. *)
  type td = char list

  (** 
  le type des arbres n-aires avec des termes dans les nœuds et des
  identifiants de règles sur les branches.
  *)
  type arbre_reecriture = Noeud of td * ((tid * arbre_reecriture) list)

  val creer_noeud : td -> (tid * arbre_reecriture) list -> arbre_reecriture

  val racine : arbre_reecriture -> td

  val fils : arbre_reecriture ->  (tid * arbre_reecriture) list 

  val appartient : td -> arbre_reecriture -> bool

end

module ArbreReecritureBOA : ArbreReecriture = struct
  type tid = int

  type td = char list

  type arbre_reecriture = Noeud of td * ((tid * arbre_reecriture) list)

  let creer_noeud racine fils = Noeud(racine, fils) 

  let racine (Noeud(racine, fils)) = racine

  let fils (Noeud(racine, fils)) = fils

  let appartient terme (Noeud(racine, liste_arbres)) =
    if racine = terme then 
      true 
    else 
      let rec aux terme larb = 
        match larb with 
        | [] -> false 
        | (id, Noeud(nv_rac, nv_liste))::q -> if terme = nv_rac then true else aux terme q || aux terme nv_liste

      in aux terme liste_arbres

  let rec appartient1 td arbre = let Noeud(t,l) = arbre in 
    if t = td then true
    else List.fold_right (fun (_,a) b -> b || (appartient1 td a)) l false

  let exemple1 = Noeud(['B';'O';'O'], [(1, Noeud(['B';'O';'O';'A'], [(1, Noeud(['B'], [])); (2, Noeud(['O'], []))])); (2, Noeud(['B';'O';'O';'O';'O'], []))])
  
  let%test _ = appartient1 ['O'] exemple1 = true

  let%test _ = appartient ['O'] exemple1 = true 
  let%test _ = appartient ['B'] exemple1 = true 
  let%test _ = appartient ['B';'O';'O'] exemple1 = true 
  let%test _ = appartient ['B';'O';'O';'A'] exemple1 = true 
  let%test _ = appartient ['B';'O';'O';'O';'O'] exemple1 = true 

  let%test _ = fils exemple1 = [(1, Noeud(['B';'O';'O';'A'], [(1, Noeud(['B'], [])); (2, Noeud(['O'], []))])); (2, Noeud(['B';'O';'O';'O';'O'], []))]
  let%test _ = racine exemple1 = ['B';'O';'O']

end
