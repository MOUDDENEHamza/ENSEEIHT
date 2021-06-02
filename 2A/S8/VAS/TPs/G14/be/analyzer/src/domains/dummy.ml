(* Template to write your own non relational abstract domain. *)

let name = "dummyInt"

let base_type = Ast.IntT

(* no option *)
let parse_param _ = ()

let fprint_help fmt = Format.fprintf fmt "Dummy abstraction"

(* To implement your own non relational abstract domain,
 * first give the type of its elements, *)
type t = Bot | Top

(* a printing function (useful for debuging), *)
let fprint ff = function
  | Bot -> Format.fprintf ff "⊥"
  | Top -> Format.fprintf ff "⊤"

(* the order of the lattice. *)
let order x y = match x, y with
  | Bot, Bot | Top, Top | Bot, Top -> true
  | _ -> false
     
(* and infimums of the lattice. *)
let top = Top
let bottom = Bot
let is_bottom x = x = Bot
  
(* All the functions below are safe overapproximations.
 * You can keep them as this in a first implementation,
 * then refine them only when you need it to improve
 * the precision of your analyses. *)

let join x y = match x, y with
  | Top, _ | _, Top -> top
  | _ -> bottom

let meet x y = match x, y with
  | Top, Top -> top
  | _ -> Bot

let widening = join  (* Ok, maybe you'll need to implement this one if your
                      * lattice has infinite ascending chains and you want
                      * your analyses to terminate. *)

let sem_itv n1 n2 = top

let sem_plus x y = top
let sem_minus x y = top
let sem_times x y = top
let sem_div x y = top

let sem_geq0 = function
  | t -> t

let sem_call _ _ = top

let backsem_plus x y r = x, y
let backsem_minus x y r = x, y
let backsem_times x y r = x, y
let backsem_div x y r = x, y
