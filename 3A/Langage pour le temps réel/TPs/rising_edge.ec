node rising_edge
  (X: bool)
returns
  (Y: bool);

let
  Y = (X -> (X and (not (pre X))));
tel

