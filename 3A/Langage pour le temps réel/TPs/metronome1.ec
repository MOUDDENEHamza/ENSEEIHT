node metronome1
  (rhythm: int)
returns
  (tic: bool;
  tac: bool;
  toc: bool;
  tut: bool);

let
  tic = (if (rhythm = 1) then true else (if (rhythm = 2) then (if (true -> (pre 
  tac)) then true else false) else (if (rhythm = 3) then (if (true -> (pre toc)
  ) then true else false) else (if (true -> (pre tut)) then true else false))))
  ;
  tac = (if (rhythm = 1) then false else (if (false -> (pre tic)) then true 
  else false));
  toc = (if ((rhythm = 1) or (rhythm = 2)) then false else (if (false -> (pre 
  tac)) then true else false));
  tut = (if (((rhythm = 1) or (rhythm = 2)) or (rhythm = 3)) then false else 
  (if (false -> (pre toc)) then true else false));
tel

