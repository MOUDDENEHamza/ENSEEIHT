(* Template to write your own non relational abstract domain. *)

(* To implement your own non relational abstract domain,
 * first give the type of its elements, *)
type t = Bot | Itv of int option * int option

(* a printing function (useful for debuging), *)
let fprint ff = function
  | (Bot) -> Format.fprintf ff "(bottom)"
  | Itv(Some i , Some j) -> Format.fprintf ff "(%i, %i)" i j 
  | Itv (Some i, None) ->  Format.fprintf ff "(%i, +oo)" i
  | Itv (None, Some i) ->  Format.fprintf ff "(-oo, %i)" i
  | Itv (None, None) -> Format.fprintf ff "(-oo, +oo)"


(* the order of the lattice. *)
let order x y = 
match x, y with
  | Bot, _ -> true
  | Itv(None, None), _ -> false
  | _, Itv(None, None) -> true
  | Itv(None, Some x), Itv(None, Some y) -> x <= y
  | Itv(Some x, None), Itv(Some y, None) -> y <= x
  | Itv (None, Some _), Itv (Some _, _) -> false
  | Itv (Some _, Some x), Itv (None, Some y) -> x <= y
  | Itv (_, _), Bot -> false
  | Itv (Some _, None), Itv (_, Some _) -> false
  | Itv (Some x, Some _), Itv (Some y, None) -> x >= y
  | Itv(Some n1, Some n2), Itv(Some p1, Some p2) ->
    if n1 == p1 then
      n2 < p2
    else 
      if n1 < p1 then
        false
      else
        true

let top = (Itv(None, None))
let bottom = (Bot)

(* Extension de <= `a Z U {-oo}. *)
let leq_minf x y = match x, y with
| None, _ -> true (* -oo <= y *)
| _, None -> false (* x > -oo (x != -oo) *)
| Some x, Some y -> x <= y

(* Extension de <= `a Z U {+oo}. *)
let leq_pinf x y = match x, y with
| _, None -> true (* x <= +oo *)
| None, _ -> false (* +oo > y (y != +oo) *)
| Some x, Some y -> x <= y

let mk_itv o1 o2 = match o1, o2 with
| None, _ | _, None -> Itv (o1, o2)
| Some n1, Some n2 -> if n1 > n2 then Bot else Itv (o1, o2)

let mmapt t a b = match a, b with
| None, _ | _, None -> None
| Some x, Some y -> Some (t x y)

let max_minf x y = match x, y with
 | Some x, None -> Some x
 | None, Some y -> Some y
 | Some x, Some y-> if x >= y then Some x else Some y
 | None, None -> None

 let min_pinf x y = match x, y with
 | None, None -> None
 | Some x, None -> Some x
 | None, Some y -> Some y
 | Some x, Some y-> if x >= y then Some y else Some x

(* All the functions below are safe overapproximations.
 * You can keep them as this in a first implementation,
 * then refine them only when you need it to improve
 * the precision of your analyses. *)

let join x y = 
match x, y with
  (*| Itv(None, None), _ -> top
  | Itv(None, _), Itv(_, None) -> top
  | Itv (None, Some b), Itv (_, Some d) -> if b > d then Itv(None, Some b) else Itv(None, Some d) 
  | Bot, Bot -> bottom
  | Bot, Itv(None, None) -> Itv(None, None)
  | Bot, Itv(None, Some y) | Itv(None, Some y), Bot -> Itv(None, Some y)
  | Bot, Itv(Some x, None) | Itv(Some x, None), Bot -> Itv(Some x, None)
  | Bot, Itv(Some x, Some y) | Itv(Some x, Some y), Bot -> Itv(Some x, Some y)
  | Itv(Some a, Some b), Itv(Some c, Some d) ->
    if (a <= c && b >= d) then
      Itv(Some a, Some b)
    else if (a <= c && b < d) then
        Itv(Some a, None)
    else if (a > c && b >= d) then
        Itv(None, Some b)
    else
        top
  *)
  | Bot, Bot -> bottom
  | Bot, Itv(None, None) | Itv(None, None), Bot -> Itv(None, None)
  | Bot, Itv(None, Some y) | Itv(None, Some y), Bot -> Itv(None, Some y)
  | Bot, Itv(Some x, None) | Itv(Some x, None), Bot -> Itv(Some x, None)
  | Bot, Itv(Some x, Some y) | Itv(Some x, Some y), Bot -> Itv(Some x, Some y)
  | Itv (Some a, Some b), Itv (Some c, Some d) -> Itv (mmapt min (Some a) (Some c), mmapt max (Some b) (Some d))

let meet x y =
match x, y with
  (*| Itv(None, None), Bot | Bot, Itv(None, None) -> bottom
  | Itv(None, None), Itv(None, Some y) | Itv(None, Some y), Itv(None, None) -> Itv(None, Some y)
  | Itv(None, None), Itv(Some x, None) | Itv(Some x, None), Itv(None, None) -> Itv(Some x, None)
  | Itv(None, None), Itv(Some x, Some y) | Itv(Some x, Some y), Itv(None, None) -> Itv(Some x, Some y)
  | Itv(None, None), Itv(None, None) -> top
  | Itv(None, Some y), Itv(Some x, None) -> Itv(Some x, Some y)
  | Itv (None, Some b), Itv (None, Some d) -> if b > d then Itv(None, Some d) else Itv(None, Some b)
  | Itv (None, Some b), Itv (Some c, Some d) -> if b > d then Itv(Some c, Some d) else Itv(Some c, Some b)
  | Bot, Bot -> bottom
  | Bot, Itv(_, _) | Itv(_, _), Bot -> Bot
  | Itv(Some a, Some b), Itv(Some c, Some d) ->
    if (a <= c && b >= d) then
      Itv(Some c, Some d)
    else if (a <= c && b < d) then
        Itv(Some c, Some b)
    else if (a > c && b >= d) then
        Itv(Some c, Some d)
    else
        top
    *)
    | Bot , _ | _, Bot -> Bot
    | Itv (Some a, Some b), Itv (Some c, Some d) -> mk_itv (max_minf (Some a) (Some c)) (min_pinf (Some b) (Some d))

let widening = join  (* Ok, maybe you'll need to implement this one if your
                      * lattice has infinite ascending chains and you want
                      * your analyses to terminate. *)

let sem_itv n1 n2 =
  if n1 == n2 then
    Itv (Some n1, Some n2)
  else if n1 > n2 then
    top
  else 
    bottom


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