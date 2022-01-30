node verification
  (X: bool)
returns
  (Y: bool);

var
  V10_P1: bool;
  V11_P2: bool;
  V60_X: bool;
  V62_X: bool;
  V75_X: bool;

let
  Y = (V10_P1 and V11_P2);
  V10_P1 = ((X -> (X and (not (pre X)))) = (V60_X -> (V60_X and (not (pre V60_X
  )))));
  V11_P2 = ((V62_X -> (V62_X and (not (pre V62_X)))) = (V75_X -> (V75_X and 
  (not (pre V75_X)))));
  V60_X = (not (not X));
  V62_X = (not X);
  V75_X = (not X);
tel

