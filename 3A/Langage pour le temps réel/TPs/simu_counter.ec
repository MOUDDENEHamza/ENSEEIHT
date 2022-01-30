node simu_counter
  (RAZ: bool)
returns
  (Top: bool);

var
  V53_cpt: int;

let
  Top = (V53_cpt = 4);
  V53_cpt = (if RAZ then 0 else (0 -> ((pre V53_cpt) + 1)));
tel

