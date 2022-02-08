node prog
  (x: int)
returns
  (y: int);

let
  y = (x -> (pre (x -> (y + (pre y)))));
tel

