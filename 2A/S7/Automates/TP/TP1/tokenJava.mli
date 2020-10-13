(* Type déclarent les différentes unités lexicales possibles *)

type token =
(* Identificateurs *)
  | IDENT of string
  | TYPEIDENT of string
(* Mots cles : types *)
  | INT
  | FLOAT
  | BOOL
  | CHAR
  | VOID
  | STRING
(* Structure de blocs *)
  | ACCOUV
  | ACCFER
  | PAROUV
  | PARFER
  | CROOUV
  | CROFER
(* Separateurs *)
  | PTVIRG
  | VIRG
(* Mots cles : Instructions *)
  | SI
  | SINON
  | TANTQUE
  | RETOUR
(* Valeurs *)
  | ENTIER of int
  | FLOTTANT of float
  | BOOLEEN of bool
  | CARACTERE of char
  | CHAINE of string
  | VIDE
(* Operateurs *)
  | NOUVEAU
  | ASSIGN
  | OPPT
(* Comparaison *)
  | OPNONEG
  | OPEG
  | OPSUPEG
  | OPINFEG
  | OPSUP
  | OPINF
(* Booleen *)
  | OPOU
  | OPET
  | OPNON
(* Arithmetique *)
  | OPPLUS
  | OPMOINS
  | OPMULT
  | OPDIV
  | OPMOD
(* Fin de texte *)
  | FIN ;;


(* Fonction d'affichage d'une unité lexicale *)
val printToken : token -> unit;;
