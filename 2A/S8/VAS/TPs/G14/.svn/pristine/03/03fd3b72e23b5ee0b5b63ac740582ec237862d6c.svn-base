(* Template to write your own non relational abstract domain. *)

(* To implement your own non relational abstract domain,
 * first give the type of its elements, *)
type t = T | B | Some of int 

(* a printing function (useful for debuging), *)
let fprint ff = function
  | T -> Format.fprintf ff "(top)"
  | B -> Format.fprintf ff "(bottom)"
  | Some x -> Format.fprintf ff "(%d)" x

(* the order of the lattice. *)
let order x y = 
match x, y with
  | B, _ -> true
  | _, T -> true
  | Some x, Some y -> x = y
  | _ -> false

(* and infimums of the lattice. *)
let top = (T)
let bottom = (B)

(* All the functions below are safe overapproximations.
 * You can keep them as this in a first implementation,
 * then refine them only when you need it to improve
 * the precision of your analyses. *)

let join x y = 
match x, y with
  | B, x | x, B -> x
  | T, y | y, T -> T
  | Some x, Some y -> if x == y then Some x else T

let meet x y = 
match x, y with
  | B, x | x, B -> B
  | T, y | y, T -> y
  | Some x, Some y -> if x == y then Some x else B

let widening = join  (* Ok, maybe you'll need to implement this one if your
                      * lattice has infinite ascending chains and you want
                      * your analyses to terminate. *)

let sem_itv n1 n2 = 
if n1 == n2 then
  Some n1
else
  if n1 > n2 then
    B
  else
    T

let sem_plus x y =
match x, y with
| B, _ | _, B -> B
| T, _ | _, T -> T
| Some x, Some y -> Some (x + y)

let sem_minus x y =
match x, y with
| B, _ | _, B -> B
| T, _ | _, T -> T
| Some x, Some y -> Some (x - y)

let sem_times x y =
match x, y with
| B, _ | _, B -> B
| T, _ | _, T -> T
| Some x, Some y -> Some (x * y)

let sem_div x y =
match x, y with
| B, _ | _, B -> B
| T, _ | _, T -> T
| _, Some 0 -> B
| Some x, Some y -> Some (x / y)

let sem_guard = function
  | B -> B
  | (Some n) as c ->
    if n > 0 then
      c
    else
      B
  | T -> T

let backsem_op x y r =
match x, y, r with
  | B, _, _ | _, B, _ | _, _, B -> B, B
  | _ -> x, y

let backsem_plus x y r = (meet x (sem_minus r y)), (meet y (sem_minus r x))

let backsem_minus x y r = (meet x (sem_plus r y)), (meet y (sem_plus r x))

let backsem_times x y r = (meet x (sem_div r y)), (meet y (sem_div r x))

let backsem_div x y r = (meet x (sem_times r y)), (meet y (sem_times r x)) 
