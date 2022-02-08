node fibonacci
  ()
returns
  (u: int);

let
  u = ((1 -> (pre u)) + (0 -> (pre (0 -> (pre u)))));
tel

