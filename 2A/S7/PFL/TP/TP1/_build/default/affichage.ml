(* ouverture des modules a utiliser			*)
open Graphics

let dessine_segment (xa,ya) (xb,yb) =
  moveto xa ya;
  lineto xb yb
