(* Template to write your own non relational abstract domain. *)

(* To implement your own non relational abstract domain,
 * first give the type of its elements, *)
type t = unit

(* a printing function (useful for debuging), *)
let fprint ff = function
  | () -> Format.fprintf ff "()"

(* the order of the lattice. *)
let order x y = match x, y with
  | (), () -> true

(* and infimums of the lattice. *)
let top = ()
let bottom = ()

(* All the functions below are safe overapproximations.
 * You can keep them as this in a first implementation,
 * then refine them only when you need it to improve
 * the precision of your analyses. *)

let join x y = match x, y with
  | _, _ -> top

let meet x y = match x, y with
  | _, _ -> top

let widening = join  (* Ok, maybe you'll need to implement this one if your
                      * lattice has infinite ascending chains and you want
                      * your analyses to terminate. *)

let sem_itv n1 n2 = top

let sem_plus x y = top
let sem_minus x y = top
let sem_times x y = top
let sem_div x y = top

let sem_guard = function
  | t -> t

let backsem_plus x y r = x, y
let backsem_minus x y r = x, y
let backsem_times x y r = x, y
let backsem_div x y r = x, y
