------------------------------- MODULE vchan_model1 -------------------------------
(* Uniquement pour utiliser TLC en ligne de commande ou avec vscode.
 * Ne sert à rien avec la toolbox TLA+.
 *)

EXTENDS vchan

CONSTANT  \* for model-checking
  MaxByte,
  MaxSent

ByteOverride == 1..MaxByte

LenConstraint == Len(Sent) < MaxSent

================================================================
