node keep
  (x: bool;
  RAZ: bool)
returns
  (y: bool);

let
  y = (false -> (if x then true else (if RAZ then false else (pre y))));
tel

