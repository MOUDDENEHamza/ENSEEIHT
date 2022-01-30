node metronome3
  (rhythm: int;
  freq: int)
returns
  (tic: bool;
  tac: bool;
  toc: bool;
  tut: bool);

var
  V53_cpt: int;
  V54_cpt_freq: int;

let
  tic = (if ((rhythm = 1) and ((V54_cpt_freq mod freq) = 0)) then true else (if 
  ((rhythm <= 4) and (rhythm >= 1)) then (if ((V53_cpt mod rhythm) = 1) then 
  true else false) else false));
  tac = (if (rhythm = 1) then false else (if ((rhythm <= 4) and (rhythm >= 1)) 
  then (if ((((V53_cpt mod rhythm) = 0) and (rhythm = 2)) or (((V53_cpt mod 
  rhythm) = 2) and (rhythm <> 2))) then true else false) else false));
  toc = (if ((rhythm = 1) or (rhythm = 2)) then false else (if ((rhythm <= 4) 
  and (rhythm >= 1)) then (if ((((V53_cpt mod rhythm) = 0) and (rhythm = 3)) or 
  (((V53_cpt mod rhythm) = 3) and (rhythm <> 2))) then true else false) else 
  false));
  tut = (if (((rhythm = 1) or (rhythm = 2)) or (rhythm = 3)) then false else 
  (if ((rhythm <= 4) and (rhythm >= 1)) then (if ((V53_cpt mod rhythm) = 0) 
  then true else false) else false));
  V53_cpt = (1 -> ((pre V53_cpt) + 1));
  V54_cpt_freq = (1 -> ((pre V54_cpt_freq) + 1));
tel

