open Lex

type parseResult =
  | Success of inputStream
  | Failure
;;

(*
  E -> ER = E
  E -> ER
  ER -> ER + T
  ER -> ER - T
  ER -> T
  T -> T * F
  T -> T / F
  T -> F
  F -> - F
  F -> ( E )
  F -> ident
  F -> true
  F -> false
  F -> number
*)

(*
  LL(1) Règle de production / Symboles directeurs
  #1  - E -> function ident fleche E { function }
  #2  - E -> if E then E else E { if }
  #5  - E -> ER EX     | { -, number, ident, true, false, ( }
  #6  - EX -> = ER EX  | { = }
  #7  - EX ->          | { $, ), then, else }
  #8  - ER -> T TX     | { -, number, ident, true, false, ( }
  #9  - TX -> + T TX   | { + }
  #10 - TX -> - T TX   | { - }
  #11 - TX ->          | { $, =, ), then, else }
  #12 - T -> F FX      | { -, number, ident, true, false, ( }
  #13 - FX -> * F FX   | { * }
  #14 - FX -> / F FX   | { / }
  #15 - FX ->          | { $, +, -, =, ), then, else }
  #16 - F -> - F       | { - }
  #17 - F -> number    | { number }
  #20 - F -> ident     | { ident }
  #21 - F -> true      | { true }
  #22 - F -> false     | { false }
  #23 - F -> ( E )     | { ( }
*)

(* accept : token -> inputStream -> parseResult *)
(* Vérifie que le premier token du flux d'entrée est bien le token attendu *)
(* et avance dans l'analyse si c'est le cas *)
let accept expected stream =
  match (peekAtFirstToken stream) with
    | token when (token = expected) ->
      (print_endline (string_of_token token));
      (Success (advanceInStream stream))
    | _ -> Failure
;;

(* acceptIdent : inputStream -> parseResult *)
(* Vérifie que le premier token du flux d'entrée est bien un identifiant *)
(* et avance dans l'analyse si c'est le cas *)
let acceptIdent stream =
  match (peekAtFirstToken stream) with
    | (IdentToken _) -> (Success (advanceInStream stream))
    | _ -> Failure
;;

(* acceptNumber : inputStream -> parseResult *)
(* Vérifie que le premier token du flux d'entrée est bien un nombre *)
(* et avance dans l'analyse si c'est le cas *)
let acceptNumber stream =
  match (peekAtFirstToken stream) with
    | (NumberToken _) -> (Success (advanceInStream stream))
    | _ -> Failure
;;

(* parseE : inputStream -> parseResult *)
(* Analyse du non terminal E *)
let rec parseE stream =
  (*
    (print_endline (string_of_stream stream));
  *)
  (print_endline "E");
  (match (peekAtFirstToken stream) with
    (* regle #5  - E -> ER EX     | { -, number, ident, true, false, ( } *)
    (* Symboles directeurs *)
    | (IdentToken _) | (NumberToken _) | TrueToken | FalseToken |
        MinusToken | LeftParenthesisToken ->
      (* Regle *)
      (* Analyse ER *)
      (match (parseER stream) with
        | (Success next) ->
          (* En cas de succes, analyse EX *)
          parseEX next
        | _ -> Failure)
        
        (* regle #1  - E -> function ident fleche E { function } *)
        | FunctionToken -> (match (accept FunctionToken stream) with
          | IdentToken _ -> (match (accept IdentToken _ stream) with
            | BodyToken -> (match (accept BodyToken) with
                | Success next -> (parseE next)
                | _ -> Failure)
              | _ -> Failure)
            | _ -> Failure)
          | _ -> Failure)
        | _ -> Failure)

        (* regle #2  - E -> if E then E else E  | { if } *)
        | IfToken -> (match (accept IfToken stream) with
          | Success next -> (match (parseE next) with
            | Success next2 -> (match (peekAtFirstToken next2) with
                | ThenToken -> (match (accept ThenToken next2) with
                    | Success next3 -> (match (parseE next3) with
                        | Success next4 -> (match (peekAtFirstToken next4) with
                            | ElseToken -> (match (accept ElseToken next4) with
                                | Success next5 -> (parseE next5)
                                | _ -> Failure)
                            | _ -> Failure)
                        | _ -> Failure)
                    | _ -> Failure)
                | _ -> Failure)
            | _ -> Failure)
        | _ -> Failure)

      | _ -> Failure)

(* parseEX : inputStream -> parseResult *)
(* Analyse du non terminal EX *)
and parseEX stream =
  (print_endline "EX");
  (match (peekAtFirstToken stream) with
    (* regle #6  - EX -> = ER EX  | { = } *)
    | EqualToken -> (match (accept EqualToken stream) with
       | Success next -> (match (parseER next) with
          | Success next2 -> (parseEX next2)
          | _ -> Failure)
       | _ -> Failure)
    (* regle #7  - EX ->          | { $, ) } *)
    | EOSToken | RightParenthesisToken | ThenToken | ElseToken -> (Success stream)
    | _ -> Failure)

(* parseER : inputStream -> parseResult *)
(* Analyse du non terminal ER *)
and parseER stream =
  (print_endline "ER");
  (match (peekAtFirstToken stream) with
    (* regle #8  - ER -> T TX     | { -, number, ident, true, false, ( } *)
    | (IdentToken _) | (NumberToken _) | TrueToken | FalseToken |
        MinusToken | LeftParenthesisToken -> (match (parseT stream) with
          | Success next -> (parseTX next)
          | _ -> Failure)
    | _ -> Failure)

(* parseTX : inputStream -> parseResult *)
(* Analyse du non terminal TX *)
and parseTX stream =
  (print_endline "TX");
  (match (peekAtFirstToken stream) with
    (* regle #9  - TX -> + T TX   | { + } *)
    | PlusToken -> (match (accept PlusToken stream) with
       | Success next -> (match (parseT next) with
          | Success next2 -> (parseTX next2)
          | _ -> Failure)
       | _ -> Failure)
    (* regle #10 - TX -> - T TX   | { - } *)
    | MinusToken -> (match (accept MinusToken stream) with
       | Success next -> (match (parseT next) with
          | Success next2 -> (parseTX next2)
          | _ -> Failure)
       | _ -> Failure)
    (* regle #11 - TX ->          | { $, =, ) } *)
    | EOSToken | EqualToken | RightParenthesisToken | ThenToken | ElseToken -> Success stream
    | _ -> Failure)

(* parseT : inputStream -> parseResult *)
(* Analyse du non terminal T *)
and parseT stream =
  (print_endline "T");
  (match (peekAtFirstToken stream) with
    (* regle #12 - T -> F FX      | { -, number, ident, true, false, ( } *)
    | (IdentToken _) | (NumberToken _) | TrueToken | FalseToken |
        MinusToken | LeftParenthesisToken -> (match (parseF stream) with
        | Success next -> (parseFX next)
        | _ -> Failure)
    | _ -> Failure)

(* parseFX : inputStream -> parseResult *)
(* Analyse du non terminal FX *)
and parseFX stream =
  (print_endline "FX");
  (match (peekAtFirstToken stream) with
    (* regle #13 - FX -> * F FX   | { * } *)
    | TimesToken -> (match (accept TimesToken stream) with
       | Success next -> (match (parseF next) with
          | Success next2 -> (parseFX next2)
          | _ -> Failure)
       | _ -> Failure)
    (* regle #14 - FX -> / F FX   | { / } *)
    | DivideToken -> (match (accept DivideToken stream) with
       | Success next -> (match (parseF next) with
          | Success next2 -> (parseFX next2)
          | _ -> Failure)
       | _ -> Failure)
    (* regle #15 - FX ->          | { $, +, -, =, ) } *)
    | EOSToken | PlusToken | MinusToken | EqualToken | RightParenthesisToken | ThenToken | ElseToken -> (Success stream)
    | _ -> Failure)

(* parseF : inputStream -> parseResult *)
(* Analyse du non terminal F *)
and parseF stream =
  (print_endline "F");
  (match (peekAtFirstToken stream) with
    (* regle #16 - F -> - F       | { - } *)
    | MinusToken -> (match (accept MinusToken stream) with
       | Success next -> (parseF next)
       | _ -> Failure) 
    (* regle #17 - F -> number    | { number }  *)
    | NumberToken _ -> (acceptNumber stream)
    (* regle #20 - F -> ident     | { ident } *)
    | IdentToken _ -> (acceptIdent stream)
    (* regle #21 - F -> true      | { true } *)
    | TrueToken -> (accept TrueToken stream)
    (* regle #22 - F -> false     | { false } *)
    | FalseToken -> (accept FalseToken stream)
    (* regle #23 - F -> ( E )     | { ( } *)
    | LeftParenthesisToken -> (match (accept LeftParenthesisToken stream) with
        | Success next -> (match (parseE next) with
           | Success next2 -> (accept RightParenthesisToken next2)
           | _ -> Failure)
        | _ -> Failure)
    | _ -> Failure)
;;
