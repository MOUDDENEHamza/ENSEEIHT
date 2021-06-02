(* La seule différence avec Intervals1 est la fonction widening. *)

type t = Bot | Itv of int option * int option

let delay = 1 

let fprint ff = function
  | Bot -> Format.fprintf ff "⊥"
  | Itv (None, None) -> Format.fprintf ff "(-oo, +oo)"
  | Itv (None, Some b) -> Format.fprintf ff "(-oo, %d]" b
  | Itv (Some a, None) -> Format.fprintf ff "[%d, +oo)" a
  | Itv (Some a, Some b) -> Format.fprintf ff "[%d, %d]" a b

(* Extension de <= à Z U {-oo}. *)
let leq_minf x y = match x, y with
  | None, _ -> true  (* -oo <= y *)
  | _, None -> false  (* x > -oo (x != -oo) *)
  | Some x, Some y -> x <= y

(* Extension de <= à Z U {+oo}. *)
let leq_pinf x y = match x, y with
  | _, None -> true  (* x <= +oo *)
  | None, _ -> false  (* +oo > y (y != +oo) *)
  | Some x, Some y -> x <= y

let order x y = match x, y with
  | Bot, _ -> true
  | _, Bot -> false
  | Itv (a, b), Itv (c, d) -> leq_minf c a && leq_pinf b d

let top = Itv (None, None)
let bottom = Bot

(* [mk_itv o1 o2] retourne l'intervalle Itv (o1, o2) si o1 <= o2, Bot sinon. *)
let mk_itv o1 o2 = match o1, o2 with
  | None, _ | _, None -> Itv (o1, o2)
  | Some n1, Some n2 -> if n1 > n2 then Bot else Itv (o1, o2)

let join x y = match x, y with
  | Bot, _ -> y
  | _, Bot -> x
  | Itv (a, b), Itv (c, d) -> Itv
    ((if leq_minf a c then a else c),  (* min a c *)
     (if leq_pinf b d then d else b))  (* max b d *)
    (* a <= b et c <= d donc min a c <= max b d donc pas besoin de mk_itv *)

let meet x y = match x, y with
  | Bot, _ | _, Bot -> Bot
  | Itv (a, b), Itv (c, d) -> mk_itv
    (if leq_minf a c then c else a)  (* max a c *)
    (if leq_pinf b d then b else d)  (* min b d *)
    (* ici par contre, on peut avoir min b d < max a c,
       donc il faut utiliser mk_itv *)

let widening x y = match x, y with
  | Bot, _ -> y
  | _, Bot -> x
  | Itv (cptx, (a, b)), Itv (cpty, (c, d)) ->
    let cpt = max cptx cpty in
    if cpt < delay then
      (* Les delay premières fois, on fait un join et on le compte (+1). *)
      join (Itv (cpt + 1, (a, b))) (Itv (cpt + 1, (c, d)))
    else
      (* Ensuite on fait un widening normal. *)
      let e = if leq_minf a c then a else None in
      let f = if leq_pinf d b then b else None in
      mk_itv cpt e f

let sem_itv n1 n2 = mk_itv (Some n1) (Some n2)

let sem_plus x y = match x, y with
  | Bot, _ | _, Bot -> Bot
  | Itv (a, b), Itv (c, d) ->
    (* Extension de + à Z U {-oo} ou Z U {+oo}. *)
    let plus_inf x y = match x, y with
      | None, _ | _, None -> None
      (* si x ou y est infini, x+y est infini
         (comme x et y peuvent être soit +oo soit -oo mais jamais un mix
         des deux, il n'y a pas de question sur le signe) *)
      | Some x, Some y -> Some (x + y)  (* sinon on fait la somme *) in
    Itv (plus_inf a c, plus_inf b d)
    (* a <= b et c <= d donc a + c <= b + d donc pas besoin de mk_itv *)

let sem_minus x y = match y with
  | Bot -> Bot
  | Itv (c, d) ->
    (* Extension du - unaire à Z U {-oo} ou Z U {+oo}. *)
    let opp_inf = function None -> None | Some x -> Some (-x) in
    sem_plus x (Itv (opp_inf d, opp_inf c))  (* x - y = x + (-y)
                                                (et -[c, d] = [-d, -c]) *)

(* Fonctions min_inf et max_inf utilisées pour sem_times et sem_div
   qui n'étaient pas demandées. *)
(* (b, Some x) code l'entier x,
   (false, None) code +oo et (true, None) code -oo *)
let min_inf x y = match x, y with
  | (true, None), _ | _, (true, None) -> true, None
  | (false, None), y | y, (false, None) -> y
  | (_, Some x), (_, Some y) -> true, Some (min x y)
let max_inf x y = match x, y with
  | (false, None), _ | _, (false, None) -> false, None
  | (true, None), y | y, (true, None) -> y
  | (_, Some x), (_, Some y) -> true, Some (max x y)

(* sem_times n'était pas demandée. *)
let sem_times x y = match x, y with
  | Bot, _ | _, Bot -> Bot
  | Itv (a, b), Itv (c, d) ->
    let times_inf x y = match x, y with
      | (_, Some x), (_, Some y) -> true, Some (x * y)
      | (sx, None), (sy, None) -> sx <> sy, None
      | (_, None), (_, Some 0)
      | (_, Some 0), (_, None) -> true, Some 0
      | (sx, None), (_, Some y)
      | (_, Some y), (sx, None) -> sx <> (y < 0), None in
    let a = (true, a) in let b = (false, b) in
    let c = (true, c) in let d = (false, d) in
    let ac = times_inf a c in let ad = times_inf a d in
    let bc = times_inf b c in let bd = times_inf b d in
    let e = min_inf (min_inf ac ad) (min_inf bc bd) in
    let f = max_inf (max_inf ac ad) (max_inf bc bd) in
    Itv (snd e, snd f)  (* pas besoin de mk_itv *)

(* sem_div n'était pas demandée. *)
let sem_div x y =
  (* précondition: meet y [0, 0] = ⊥ (i.e. l'intervalle y ne contient pas 0) *)
  let sem_div_without_0 x y = match x, y with
    | Bot, _ | _, Bot -> Bot
    | Itv (a, b), Itv (c, d) ->
      (* précondition y != 0,
         nondet est renvoyé dans les cas non déterminés (+/-oo) / (+/-oo) *)
      let div_inf x y nondet = match x, y with
        | (_, Some x), (_, Some y) -> true, Some (x / y)
        | (sx, None), (sy, None) -> nondet
        | _, (_, None) -> true, Some 0  (* x / (+/-oo) = 0 *)
        | (sx, None), (_, Some y) -> sx <> (y < 0), None in
    let a = (true, a) in let b = (false, b) in
    let c = (true, c) in let d = (false, d) in
    let e =
      let inf = (true, None) in
      min_inf
        (min_inf (div_inf a c inf) (div_inf a d inf))
        (min_inf (div_inf b c inf) (div_inf b d inf)) in
    let f =
      let inf = (false, None) in
      max_inf
        (max_inf (div_inf a c inf) (div_inf a d inf))
        (max_inf (div_inf b c inf) (div_inf b d inf)) in
    Itv (snd e, snd f)  (* pas besoin de mk_itv *) in
  let yneg = meet y (Itv (None, Some (-1))) in
  let ypos = meet y (Itv (Some 1, None)) in
  join (sem_div_without_0 x yneg) (sem_div_without_0 x ypos)

let sem_guard = meet (Itv (Some 1, None))

let backsem_plus x y r = meet x (sem_minus r y), meet y (sem_minus r x)

let backsem_minus x y r = meet x (sem_plus y r), meet y (sem_minus x r)

(* backsem_times n'était pas demandée. *)
let backsem_times x y r =
  let backsem_times_left x y r =
    (* [contains_0 x] renvoie true ssi l'intervalle x contient 0 *)
    let contains_0 x = meet x (Itv (Some 0, Some 0)) <> Bot in
    if contains_0 y && contains_0 r then
      x  (* si y et r peuvent être 0, x * y = r ne nous apprend rien sur x *)
    else
      meet x (sem_div r y) in
  backsem_times_left x y r, backsem_times_left y x r

(* backsem_div n'était pas demandée. *)
let backsem_div x y r =
    (* la division est une division euclidienne, donc x / y = z n'implique pas
       que x = z * y mais plutôt x = z * y + r avec r \in [-|y|+1, |y|-1]*)
    let remaining y = match y with
      | Itv (Some a, Some b) ->
        let c = max (abs a) (abs b) in
        mk_itv (Some (1-c)) (Some (c-1))
      | _ -> top in
    let backsem_div_left x y r =
      meet x (sem_plus (sem_times r y) (remaining y)) in
    let backsem_div_right x y r =
      let x' = sem_plus x (remaining y) in
      meet y (fst (backsem_times y r x')) in
    backsem_div_left x y r, backsem_div_right x y r