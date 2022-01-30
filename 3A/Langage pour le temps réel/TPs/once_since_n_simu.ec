node once_since_n_simu
  (RAZ: bool)
returns
  (y: bool);

var
  V74_cpt: int;
  V75_tmp: bool;

let
  y = (V75_tmp and (V74_cpt <= 3));
  V74_cpt = (if V75_tmp then (if RAZ then 0 else ((pre V74_cpt) + 1)) else 0);
  V75_tmp = (false -> (RAZ or (pre y)));
tel

