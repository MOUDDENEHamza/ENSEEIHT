type t = Bot | Cst of int | Top

let fprint ff = function
  | Bot -> Format.fprintf ff "⊥"
  | Cst n -> Format.fprintf ff "%d" n
  | Top -> Format.fprintf ff "⊤"

let order x y = match x, y with
  | Bot, _ -> true
  | _, Top -> true
  | Cst n1, Cst n2 -> n1 = n2
  | _ -> false

let top = Top
let bottom = Bot
let join x y = match x, y with
  | Top, _ | _, Top -> Top
  | Bot, _ -> y
  | _, Bot -> x
  | Cst n1, Cst n2 -> if n1 = n2 then x else Top
let meet x y = match x, y with
  | Bot, _ | _, Bot -> Bot
  | Top, _ -> y
  | _, Top -> x
  | Cst n1, Cst n2 -> if n1 = n2 then x else Bot
let widening = join

let sem_itv n1 n2 = if n1 > n2 then Bot else if n1 = n2 then Cst n1 else Top
let sem_guard = function
  | Bot -> Bot
  | (Cst n) as c -> if n > 0 then c else Bot
  | Top -> Top
let sem_op op x y = match x, y with
  | Bot, _ | _, Bot -> Bot
  | Top, _ | _, Top -> Top
  | Cst n1, Cst n2 -> Cst (op n1 n2)
let sem_plus = sem_op ( + )
let sem_minus = sem_op ( - )
let sem_times = sem_op ( * )
let sem_div x y =
  try sem_op ( / ) x y
  with Division_by_zero -> Bot
(* We could have more precise backward abstract semantics,
 * but that would be completely useless. *)
let backsem_op x y r = match x, y, r with
  | Bot, _, _ | _, Bot, _ | _, _, Bot -> Bot, Bot
  | _ -> x, y
let backsem_plus = backsem_op
let backsem_minus = backsem_op
let backsem_times = backsem_op
let backsem_div = backsem_op