
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | VOID
    | VIRG
    | VIDE
    | TYPEIDENT of (
# 14 "parserJava.mly"
       (string)
# 14 "parserJava.ml"
  )
    | TANTQUE
    | STRING
    | SINON
    | SI
    | RETOUR
    | PTVIRG
    | PAROUV
    | PARFER
    | OPSUPEG
    | OPSUP
    | OPPT
    | OPPLUS
    | OPOU
    | OPNONEG
    | OPNON
    | OPMULT
    | OPMOINS
    | OPMOD
    | OPINFEG
    | OPINF
    | OPET
    | OPEG
    | OPDIV
    | NOUVEAU
    | INT
    | IMPORT of (
# 13 "parserJava.mly"
       (string)
# 44 "parserJava.ml"
  )
    | IDENT of (
# 14 "parserJava.mly"
       (string)
# 49 "parserJava.ml"
  )
    | FLOTTANT of (
# 21 "parserJava.mly"
       (float)
# 54 "parserJava.ml"
  )
    | FLOAT
    | FIN
    | ENTIER of (
# 20 "parserJava.mly"
       (int)
# 61 "parserJava.ml"
  )
    | CROOUV
    | CROFER
    | CHAR
    | CHAINE of (
# 24 "parserJava.mly"
       (string)
# 69 "parserJava.ml"
  )
    | CARACTERE of (
# 23 "parserJava.mly"
       (char)
# 74 "parserJava.ml"
  )
    | BOOLEEN of (
# 22 "parserJava.mly"
       (bool)
# 79 "parserJava.ml"
  )
    | BOOL
    | ASSIGN
    | ACCOUV
    | ACCFER
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState116
  | MenhirState114
  | MenhirState112
  | MenhirState110
  | MenhirState106
  | MenhirState105
  | MenhirState103
  | MenhirState101
  | MenhirState100
  | MenhirState99
  | MenhirState97
  | MenhirState96
  | MenhirState95
  | MenhirState94
  | MenhirState92
  | MenhirState91
  | MenhirState88
  | MenhirState85
  | MenhirState83
  | MenhirState82
  | MenhirState75
  | MenhirState74
  | MenhirState73
  | MenhirState72
  | MenhirState65
  | MenhirState64
  | MenhirState63
  | MenhirState47
  | MenhirState43
  | MenhirState42
  | MenhirState39
  | MenhirState38
  | MenhirState35
  | MenhirState32
  | MenhirState27
  | MenhirState23
  | MenhirState14
  | MenhirState12
  | MenhirState11
  | MenhirState3
  | MenhirState0

# 1 "parserJava.mly"
  

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)

(* let nbrVariables = ref 0;; *)


# 153 "parserJava.ml"

let rec _menhir_goto_intermediate_suffix : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState85 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_2 : (unit)) = _v in
        let (_menhir_stack, _menhir_s, (_1 : (unit))) = _menhir_stack in
        let _v : (unit) = 
# 134 "parserJava.mly"
                                      ( (print_endline "intermediate_suffix : suffixe") )
# 166 "parserJava.ml"
         in
        _menhir_goto_intermediate_suffix _menhir_env _menhir_stack _menhir_s _v
    | MenhirState64 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_2 : (unit)) = _v in
        let (_menhir_stack, _menhir_s, (_1 : (
# 14 "parserJava.mly"
       (string)
# 176 "parserJava.ml"
        ))) = _menhir_stack in
        let _v : (unit) = 
# 127 "parserJava.mly"
                                       ( (print_endline "expression : ident") )
# 181 "parserJava.ml"
         in
        _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
    | MenhirState92 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_4 : (unit)) = _v in
        let (((_menhir_stack, _menhir_s), _, (_2 : (unit))), _) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : (unit) = 
# 128 "parserJava.mly"
                                                          ( (print_endline "expression : (expression)") )
# 194 "parserJava.ml"
         in
        _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_instruction : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASSIGN ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | BOOLEEN _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | CARACTERE _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | ENTIER _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | FLOTTANT _v ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | NOUVEAU ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | OPDIV ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | OPEG ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | OPET ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | OPINF ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | OPINFEG ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | OPMOD ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | OPMOINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | OPMULT ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | OPNON ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | OPNONEG ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | OPOU ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | OPPLUS ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | OPPT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | OPSUP ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | OPSUPEG ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | PAROUV ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | RETOUR ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | SI ->
        _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | TANTQUE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | VIDE ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | ACCFER ->
        _menhir_reduce47 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110

and _menhir_run96 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState96
    | CHAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState96
    | FLOAT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState96
    | INT ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState96
    | STRING ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState96
    | TYPEIDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
    | ACCFER | ASSIGN | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPDIV | OPEG | OPET | OPINF | OPINFEG | OPMOD | OPMOINS | OPMULT | OPNON | OPNONEG | OPOU | OPPLUS | OPPT | OPSUP | OPSUPEG | PAROUV | RETOUR | SI | TANTQUE | VIDE ->
        _menhir_reduce70 _menhir_env (Obj.magic _menhir_stack) MenhirState96
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96

and _menhir_goto_another_expression : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState74 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s), _, (_2 : (unit))), _, (_3 : (unit))) = _menhir_stack in
        let _1 = () in
        let _v : (unit) = 
# 142 "parserJava.mly"
                                                      ( (print_endline "another_expression : VIRG expression") )
# 305 "parserJava.ml"
         in
        _menhir_goto_another_expression _menhir_env _menhir_stack _menhir_s _v
    | MenhirState72 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PARFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (_2 : (unit))), _, (_3 : (unit))) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : (unit) = 
# 138 "parserJava.mly"
                                                      ( (print_endline "suffixe : (expression+)") )
# 323 "parserJava.ml"
             in
            _menhir_goto_suffixe _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_run73 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASSIGN ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | BOOLEEN _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
    | CARACTERE _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
    | ENTIER _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
    | FLOTTANT _v ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
    | NOUVEAU ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | OPDIV ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | OPEG ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | OPET ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | OPINF ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | OPINFEG ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | OPMOD ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | OPMOINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | OPMULT ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | OPNON ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | OPNONEG ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | OPOU ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | OPPLUS ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | OPPT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | OPSUP ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | OPSUPEG ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | PAROUV ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | VIDE ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73

and _menhir_goto_suffixe : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CROOUV ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | PAROUV ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | CROFER | OPPLUS | PARFER | PTVIRG | VIRG ->
        _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85

and _menhir_run75 : _menhir_env -> 'ttv_tail * _menhir_state * (unit) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASSIGN ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | BOOLEEN _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | CARACTERE _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | ENTIER _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | FLOTTANT _v ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | NOUVEAU ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | OPDIV ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | OPEG ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | OPET ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | OPINF ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | OPINFEG ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | OPMOD ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | OPMOINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | OPMULT ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | OPNON ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | OPNONEG ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | OPOU ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | OPPLUS ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | OPPT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | OPSUP ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | OPSUPEG ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | PAROUV ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | VIDE ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75

and _menhir_goto_instruction_bis : _menhir_env -> 'ttv_tail -> _menhir_state -> (int) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState97 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ACCFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (_2 : (unit))), _, (_3 : (int))) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : (unit) = 
# 112 "parserJava.mly"
                                                    ( (print_endline "instruction : ACCOUV variables_bis instruction_bis ACCFER") )
# 490 "parserJava.ml"
             in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            (match _menhir_s with
            | MenhirState101 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | SINON ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | ACCOUV ->
                        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState103
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103)
                | ACCFER | ASSIGN | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPDIV | OPEG | OPET | OPINF | OPINFEG | OPMOD | OPMOINS | OPMULT | OPNON | OPNONEG | OPOU | OPPLUS | OPPT | OPSUP | OPSUPEG | PAROUV | RETOUR | SI | TANTQUE | VIDE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((((_menhir_stack, _menhir_s), _, (_3 : (unit))), _), _, (_5 : (unit))) = _menhir_stack in
                    let _4 = () in
                    let _2 = () in
                    let _1 = () in
                    let _v : (unit) = 
# 107 "parserJava.mly"
                                                     ( (print_endline "SI PAROUV expression PARFER corps") )
# 519 "parserJava.ml"
                     in
                    _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | MenhirState103 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (((((_menhir_stack, _menhir_s), _, (_3 : (unit))), _), _, (_5 : (unit))), _, (_7 : (unit))) = _menhir_stack in
                let _6 = () in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : (unit) = 
# 108 "parserJava.mly"
                                                                 ( (print_endline "SI PAROUV expression PARFER corps SINON corps") )
# 539 "parserJava.ml"
                 in
                _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v
            | MenhirState95 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((((_menhir_stack, _menhir_s), _, (_3 : (unit))), _), _, (_5 : (unit))) = _menhir_stack in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : (unit) = 
# 109 "parserJava.mly"
                                                         ( (print_endline "instruction : TANTQUE PAROUV expression PARFER corps") )
# 552 "parserJava.ml"
                 in
                _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                _menhir_fail ())
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState110 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (unit))), _, (_2 : (int))) = _menhir_stack in
        let _v : (int) = 
# 118 "parserJava.mly"
                                              ( (print_endline "instruction_bis : instruction"); (_2 + 1) )
# 570 "parserJava.ml"
         in
        _menhir_goto_instruction_bis _menhir_env _menhir_stack _menhir_s _v
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (int))) = _menhir_stack in
        let _v : (unit) = 
# 101 "parserJava.mly"
                                ((print_endline "instructions : instruction");(print_string "Nombre d'instructions = ");
                (print_int _1);
                (print_newline ());         
        )
# 583 "parserJava.ml"
         in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ACCFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _, (_2 : (int))), _, (_3 : (unit))) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : (unit) = 
# 89 "parserJava.mly"
                                            ( 
                (print_endline "bloc : ACCOUV variables instructions ACCFER");
                (print_string "Nombre de variables = ");
                (print_int _2);
                (print_string "Nombre d'instructions = ");
        )
# 605 "parserJava.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_2 : (unit)) = _v in
            let (_menhir_stack, _menhir_s, (_1 : (unit))) = _menhir_stack in
            let _v : (unit) = 
# 78 "parserJava.mly"
                        ( (print_endline "fonction : entete bloc") )
# 614 "parserJava.ml"
             in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_stack = Obj.magic _menhir_stack in
            assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BOOL ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | CHAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | FLOAT ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | INT ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | STRING ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | TYPEIDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
            | VOID ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | FIN ->
                _menhir_reduce54 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_reduce50 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (unit) = 
# 133 "parserJava.mly"
                                              ( (print_endline "intermediate_suffix : /* Lambda, mot vide */") )
# 655 "parserJava.ml"
     in
    _menhir_goto_intermediate_suffix _menhir_env _menhir_stack _menhir_s _v

and _menhir_run65 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASSIGN ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | BOOLEEN _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | CARACTERE _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | ENTIER _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | FLOTTANT _v ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | NOUVEAU ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | OPDIV ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | OPEG ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | OPET ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | OPINF ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | OPINFEG ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | OPMOD ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | OPMOINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | OPMULT ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | OPNON ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | OPNONEG ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | OPOU ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | OPPLUS ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | OPPT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | OPSUP ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | OPSUPEG ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | PARFER ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState65 in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : (unit) = 
# 136 "parserJava.mly"
                        ( (print_endline "suffixe : ( )") )
# 720 "parserJava.ml"
         in
        _menhir_goto_suffixe _menhir_env _menhir_stack _menhir_s _v
    | PAROUV ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | VIDE ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65

and _menhir_run82 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASSIGN ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | BOOLEEN _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
    | CARACTERE _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
    | ENTIER _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
    | FLOTTANT _v ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
    | NOUVEAU ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | OPDIV ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | OPEG ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | OPET ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | OPINF ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | OPINFEG ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | OPMOD ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | OPMOINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | OPMULT ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | OPNON ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | OPNONEG ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | OPOU ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | OPPLUS ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | OPPT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | OPSUP ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | OPSUPEG ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | PAROUV ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | VIDE ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82

and _menhir_goto_expression : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState65 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OPPLUS ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | PARFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState72 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (_2 : (unit))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (unit) = 
# 137 "parserJava.mly"
                                   ( (print_endline "suffixe : (expression)") )
# 813 "parserJava.ml"
             in
            _menhir_goto_suffixe _menhir_env _menhir_stack _menhir_s _v
        | VIRG ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72)
    | MenhirState73 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OPPLUS ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | VIRG ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | PARFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState74 in
            let _v : (unit) = 
# 141 "parserJava.mly"
                                            ( (print_endline "another_expression : /* Lambda, mot vide */") )
# 837 "parserJava.ml"
             in
            _menhir_goto_another_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74)
    | MenhirState75 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (_1 : (unit))), _), _, (_3 : (unit))) = _menhir_stack in
        let _2 = () in
        let _v : (unit) = 
# 129 "parserJava.mly"
                                          ( (print_endline "expression : expression OPPLUS expression") )
# 852 "parserJava.ml"
         in
        _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CROFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState83 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (_2 : (unit))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (unit) = 
# 139 "parserJava.mly"
                                   ( (print_endline "suffixe : [expression]") )
# 871 "parserJava.ml"
             in
            _menhir_goto_suffixe _menhir_env _menhir_stack _menhir_s _v
        | OPPLUS ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83)
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CROFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState88 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), (_2 : (
# 14 "parserJava.mly"
       (string)
# 893 "parserJava.ml"
            ))), _, (_4 : (unit))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (unit) = 
# 126 "parserJava.mly"
                                             ( (print_endline "expression : new ident [expression]") )
# 901 "parserJava.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | OPPLUS ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88)
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _, (_2 : (unit))) = _menhir_stack in
        let _1 = () in
        let _v : (unit) = 
# 130 "parserJava.mly"
                                    ( (print_endline "expression : OPPLUS expression %prec OPNON") )
# 918 "parserJava.ml"
         in
        _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OPPLUS ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | PARFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState91 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | CROOUV ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | PAROUV ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | CROFER | OPPLUS | PARFER | PTVIRG | VIRG ->
                _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState92)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91)
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OPPLUS ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | PARFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState94 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ACCOUV ->
                _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState95
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState95)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState94)
    | MenhirState99 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OPPLUS ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | PARFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState100 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ACCOUV ->
                _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100)
    | MenhirState105 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OPPLUS ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | PTVIRG ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState106 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (_2 : (unit))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (unit) = 
# 110 "parserJava.mly"
                                            ( (print_endline "instruction : RETURN expression PTVIRG") )
# 1015 "parserJava.ml"
             in
            _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106)
    | MenhirState39 | MenhirState97 | MenhirState110 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OPPLUS ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | PTVIRG ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState112 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (_1 : (unit))) = _menhir_stack in
            let _2 = () in
            let _v : (unit) = 
# 106 "parserJava.mly"
                                ( (print_endline "instruction : expression PTVIRG") )
# 1039 "parserJava.ml"
             in
            _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState112)
    | _ ->
        _menhir_fail ()

and _menhir_goto_binaire : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (unit)) = _v in
    let _v : (unit) = 
# 131 "parserJava.mly"
                     ( (print_endline "expression : BINAIRE") )
# 1057 "parserJava.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce47 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (int) = 
# 117 "parserJava.mly"
                                         ( (print_endline "instruction_bis : /* Lambda, mot vide */"); 0 )
# 1066 "parserJava.ml"
     in
    _menhir_goto_instruction_bis _menhir_env _menhir_stack _menhir_s _v

and _menhir_run40 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 124 "parserJava.mly"
                  ( (print_endline "expression : NULL") )
# 1078 "parserJava.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | PAROUV ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ASSIGN ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | BOOLEEN _v ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | CARACTERE _v ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | ENTIER _v ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | FLOTTANT _v ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | IDENT _v ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | NOUVEAU ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | OPDIV ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | OPEG ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | OPET ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | OPINF ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | OPINFEG ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | OPMOD ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | OPMOINS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | OPMULT ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | OPNON ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | OPNONEG ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | OPOU ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | OPPLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | OPPT ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | OPSUP ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | OPSUPEG ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | PAROUV ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | VIDE ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run98 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | PAROUV ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ASSIGN ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | BOOLEEN _v ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _v
        | CARACTERE _v ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _v
        | ENTIER _v ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _v
        | FLOTTANT _v ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _v
        | IDENT _v ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _v
        | NOUVEAU ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | OPDIV ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | OPEG ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | OPET ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | OPINF ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | OPINFEG ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | OPMOD ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | OPMOINS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | OPMULT ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | OPNON ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | OPNONEG ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | OPOU ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | OPPLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | OPPT ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | OPSUP ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | OPSUPEG ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | PAROUV ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | VIDE ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState99)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run105 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASSIGN ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | BOOLEEN _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | CARACTERE _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | ENTIER _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | FLOTTANT _v ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | NOUVEAU ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPDIV ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPEG ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPET ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPINF ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPINFEG ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPMOD ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPMOINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPMULT ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPNON ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPNONEG ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPOU ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPPLUS ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPPT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPSUP ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPSUPEG ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | PAROUV ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | VIDE ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105

and _menhir_run43 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASSIGN ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | BOOLEEN _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | CARACTERE _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | ENTIER _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | FLOTTANT _v ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | NOUVEAU ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | OPDIV ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | OPEG ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | OPET ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | OPINF ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | OPINFEG ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | OPMOD ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | OPMOINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | OPMULT ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | OPNON ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | OPNONEG ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | OPOU ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | OPPLUS ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | OPPT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | OPSUP ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | OPSUPEG ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | PAROUV ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | VIDE ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43

and _menhir_run44 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 153 "parserJava.mly"
                  ( (print_endline "binaire : >="))
# 1348 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run45 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 151 "parserJava.mly"
                ( (print_endline "binaire : >") )
# 1360 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 164 "parserJava.mly"
               ( (print_endline "binaire : .") )
# 1372 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run47 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASSIGN ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | BOOLEEN _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | CARACTERE _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | ENTIER _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | FLOTTANT _v ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | NOUVEAU ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | OPDIV ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | OPEG ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | OPET ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | OPINF ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | OPINFEG ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | OPMOD ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | OPMOINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | OPMULT ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | OPNON ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | OPNONEG ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | OPOU ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | OPPT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | OPSUP ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | OPSUPEG ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | PAROUV ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | VIDE ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | CROFER | OPPLUS | PARFER | PTVIRG | VIRG ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (unit) = 
# 156 "parserJava.mly"
                 ( (print_endline "binaire : +") )
# 1435 "parserJava.ml"
         in
        _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47

and _menhir_run48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 158 "parserJava.mly"
               ( (print_endline "binaire : ||") )
# 1451 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run49 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 155 "parserJava.mly"
                  ( (print_endline "binaire : !=") )
# 1463 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run50 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 163 "parserJava.mly"
                ( (print_endline "binaire : !") )
# 1475 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run51 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 159 "parserJava.mly"
                 ( (print_endline "binaire : *") )
# 1487 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run52 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 157 "parserJava.mly"
                  ( (print_endline "binaire : -") )
# 1499 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run53 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 160 "parserJava.mly"
                ( (print_endline "binaire : %") )
# 1511 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run54 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 152 "parserJava.mly"
                  ( (print_endline "binaire : <=") )
# 1523 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run55 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 150 "parserJava.mly"
                ( (print_endline "binaire : <") )
# 1535 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run56 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 162 "parserJava.mly"
               ( (print_endline "binaire : &&") )
# 1547 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run57 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 154 "parserJava.mly"
               ( (print_endline "binaire : ==") )
# 1559 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run58 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 161 "parserJava.mly"
                ( (print_endline "binaire : /") )
# 1571 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run59 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CROOUV ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ASSIGN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | BOOLEEN _v ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | CARACTERE _v ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | ENTIER _v ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | FLOTTANT _v ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | IDENT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | NOUVEAU ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | OPDIV ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | OPEG ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | OPET ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | OPINF ->
                _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | OPINFEG ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | OPMOD ->
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | OPMOINS ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | OPMULT ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | OPNON ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | OPNONEG ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | OPOU ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | OPPLUS ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | OPPT ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | OPSUP ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | OPSUPEG ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | PAROUV ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | VIDE ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63)
        | PAROUV ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | PARFER ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s), (_2 : (
# 14 "parserJava.mly"
       (string)
# 1656 "parserJava.ml"
                ))) = _menhir_stack in
                let _4 = () in
                let _3 = () in
                let _1 = () in
                let _v : (unit) = 
# 125 "parserJava.mly"
                                         ( (print_endline "expression : new ident ()") )
# 1664 "parserJava.ml"
                 in
                _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run64 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "parserJava.mly"
       (string)
# 1689 "parserJava.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CROOUV ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState64
    | PAROUV ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState64
    | CROFER | OPPLUS | PARFER | PTVIRG | VIRG ->
        _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) MenhirState64
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64

and _menhir_run67 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 21 "parserJava.mly"
       (float)
# 1710 "parserJava.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 21 "parserJava.mly"
       (float)
# 1718 "parserJava.ml"
    )) = _v in
    let _v : (unit) = 
# 121 "parserJava.mly"
                      ( (print_endline "expression : FLOTTANT") )
# 1723 "parserJava.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_run68 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 20 "parserJava.mly"
       (int)
# 1730 "parserJava.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 20 "parserJava.mly"
       (int)
# 1738 "parserJava.ml"
    )) = _v in
    let _v : (unit) = 
# 120 "parserJava.mly"
                    ( (print_endline "expression : ENTIER") )
# 1743 "parserJava.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_run69 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parserJava.mly"
       (char)
# 1750 "parserJava.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 23 "parserJava.mly"
       (char)
# 1758 "parserJava.ml"
    )) = _v in
    let _v : (unit) = 
# 122 "parserJava.mly"
                       ( (print_endline "expression : CARACTERE") )
# 1763 "parserJava.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_run70 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 22 "parserJava.mly"
       (bool)
# 1770 "parserJava.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 22 "parserJava.mly"
       (bool)
# 1778 "parserJava.ml"
    )) = _v in
    let _v : (unit) = 
# 123 "parserJava.mly"
                     ( (print_endline "expression : BOOLEEN") )
# 1783 "parserJava.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_run71 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 149 "parserJava.mly"
                 ( (print_endline "binaire : =") )
# 1795 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_fichier : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (unit)) = _v in
    Obj.magic _1

and _menhir_goto_variables : _menhir_env -> 'ttv_tail -> _menhir_state -> (int) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ASSIGN ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | BOOLEEN _v ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
        | CARACTERE _v ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
        | ENTIER _v ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
        | FLOTTANT _v ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
        | IDENT _v ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
        | NOUVEAU ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | OPDIV ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | OPEG ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | OPET ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | OPINF ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | OPINFEG ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | OPMOD ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | OPMOINS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | OPMULT ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | OPNON ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | OPNONEG ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | OPOU ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | OPPLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | OPPT ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | OPSUP ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | OPSUPEG ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | PAROUV ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | RETOUR ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | SI ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | TANTQUE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | VIDE ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | ACCFER ->
            _menhir_reduce47 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39)
    | MenhirState114 | MenhirState96 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | CHAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | FLOAT ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | INT ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | STRING ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | TYPEIDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
        | ACCFER | ASSIGN | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPDIV | OPEG | OPET | OPINF | OPINFEG | OPMOD | OPMOINS | OPMULT | OPNON | OPNONEG | OPOU | OPPLUS | OPPT | OPSUP | OPSUPEG | PAROUV | RETOUR | SI | TANTQUE | VIDE ->
            _menhir_reduce70 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114)
    | MenhirState116 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (unit))), _, (_2 : (int))) = _menhir_stack in
        let _v : (int) = 
# 97 "parserJava.mly"
                               ( (print_endline "variables : variable variables"); (_2 + 1) )
# 1905 "parserJava.ml"
         in
        _menhir_goto_variables _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_suiteParsFormels : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_4 : (unit)) = _v in
        let (((_menhir_stack, _menhir_s), _, (_2 : (unit))), (_3 : (
# 14 "parserJava.mly"
       (string)
# 1921 "parserJava.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (unit) = 
# 87 "parserJava.mly"
                                                          ( (print_endline "suiteParsFormels : VIRG typeStruct IDENT suiteParsFormels") )
# 1927 "parserJava.ml"
         in
        _menhir_goto_suiteParsFormels _menhir_env _menhir_stack _menhir_s _v
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_3 : (unit)) = _v in
        let ((_menhir_stack, _menhir_s, (_1 : (unit))), (_2 : (
# 14 "parserJava.mly"
       (string)
# 1937 "parserJava.ml"
        ))) = _menhir_stack in
        let _v : (unit) = 
# 84 "parserJava.mly"
                                                ( (print_endline "parsFormels : typeStruct IDENT suiteParsFormels") )
# 1942 "parserJava.ml"
         in
        _menhir_goto_parsFormels _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_programme : _menhir_env -> 'ttv_tail -> _menhir_state -> (int) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | FIN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (_1 : (int))) = _menhir_stack in
            let _2 = () in
            let _v : (unit) = 
# 60 "parserJava.mly"
                        ( (print_endline "fichier : programme FIN"); (print_string "Nombre de méthodes = "); (print_int _1); (print_newline ()) )
# 1965 "parserJava.ml"
             in
            _menhir_goto_fichier _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | FIN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (_1 : (unit))), _, (_2 : (int))) = _menhir_stack in
            let _3 = () in
            let _v : (unit) = 
# 61 "parserJava.mly"
                                ( (print_endline "fichier : programme FIN"); (print_string "Nombre de méthodes = "); (print_int _2); (print_newline ()) )
# 1987 "parserJava.ml"
             in
            _menhir_goto_fichier _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (unit))), _, (_2 : (int))) = _menhir_stack in
        let _v : (int) = 
# 64 "parserJava.mly"
                               ( (print_endline "programme : fonction programme"); (_2 + 1) )
# 2003 "parserJava.ml"
         in
        _menhir_goto_programme _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_entete : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACCOUV ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | CHAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | FLOAT ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | INT ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | STRING ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | TYPEIDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
        | ACCFER | ASSIGN | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPDIV | OPEG | OPET | OPINF | OPINFEG | OPMOD | OPMOINS | OPMULT | OPNON | OPNONEG | OPOU | OPPLUS | OPPT | OPSUP | OPSUPEG | PAROUV | RETOUR | SI | TANTQUE | VIDE ->
            _menhir_reduce70 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_reduce70 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (int) = 
# 96 "parserJava.mly"
                                   ( (print_endline "variables : /* Lambda, mot vide */"); 0 )
# 2051 "parserJava.ml"
     in
    _menhir_goto_variables _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce60 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (unit) = 
# 86 "parserJava.mly"
                                          ( (print_endline "suiteParsFormels : /* Lambda, mot vide */") )
# 2060 "parserJava.ml"
     in
    _menhir_goto_suiteParsFormels _menhir_env _menhir_stack _menhir_s _v

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | CHAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | FLOAT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | INT ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | STRING ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | TYPEIDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_reduce54 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (int) = 
# 63 "parserJava.mly"
                                   ( (print_endline "programme : /* Lambda, mot vide */"); 0 )
# 2097 "parserJava.ml"
     in
    _menhir_goto_programme _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_parsFormels : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PARFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), (_2 : (
# 14 "parserJava.mly"
       (string)
# 2117 "parserJava.ml"
            ))), _, (_4 : (unit))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (unit) = 
# 81 "parserJava.mly"
                                              ( (print_endline "entete : VOID IDENT PAROUV parsFormels PARFER") )
# 2125 "parserJava.ml"
             in
            _menhir_goto_entete _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PARFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (_1 : (unit))), (_2 : (
# 14 "parserJava.mly"
       (string)
# 2146 "parserJava.ml"
            ))), _, (_4 : (unit))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _v : (unit) = 
# 80 "parserJava.mly"
                                                    ( (print_endline "entete : typeStruct IDENT PAROUV parsFormels PARFER") )
# 2153 "parserJava.ml"
             in
            _menhir_goto_entete _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_declTab : _menhir_env -> 'ttv_tail -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_2 : (unit)) = _v in
    let (_menhir_stack, _menhir_s, (_1 : (unit))) = _menhir_stack in
    let _v : (unit) = 
# 66 "parserJava.mly"
                              ( (print_endline "typeStruct : typeBase declTab") )
# 2174 "parserJava.ml"
     in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState27 | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IDENT _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | VIRG ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | PARFER ->
                _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IDENT _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | VIRG ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState14
            | PARFER ->
                _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) MenhirState14
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState35 | MenhirState32 | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IDENT _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | PAROUV ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | BOOL ->
                    _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState27
                | CHAR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState27
                | FLOAT ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState27
                | INT ->
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState27
                | STRING ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState27
                | TYPEIDENT _v ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
                | PARFER ->
                    _menhir_reduce52 _menhir_env (Obj.magic _menhir_stack) MenhirState27
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState38 | MenhirState96 | MenhirState114 | MenhirState116 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IDENT _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | PTVIRG ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, (_1 : (unit))), (_2 : (
# 14 "parserJava.mly"
       (string)
# 2292 "parserJava.ml"
                ))) = _menhir_stack in
                let _3 = () in
                let _v : (unit) = 
# 99 "parserJava.mly"
                                   ( (print_endline "variable : typeStruct IDENT PTVIRG") )
# 2298 "parserJava.ml"
                 in
                let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
                let _menhir_stack = Obj.magic _menhir_stack in
                assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | BOOL ->
                    _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState116
                | CHAR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState116
                | FLOAT ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState116
                | INT ->
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState116
                | STRING ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState116
                | TYPEIDENT _v ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
                | ACCFER | ASSIGN | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPDIV | OPEG | OPET | OPINF | OPINFEG | OPMOD | OPMOINS | OPMULT | OPNON | OPNONEG | OPOU | OPPLUS | OPPT | OPSUP | OPSUPEG | PAROUV | RETOUR | SI | TANTQUE | VIDE ->
                    _menhir_reduce70 _menhir_env (Obj.magic _menhir_stack) MenhirState116
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_imports : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (
# 13 "parserJava.mly"
       (string)
# 2348 "parserJava.ml"
        ))), _, (_2 : (unit))) = _menhir_stack in
        let _v : (unit) = 
# 58 "parserJava.mly"
                           ( (print_endline "imports : IMPORT imports"); )
# 2353 "parserJava.ml"
         in
        _menhir_goto_imports _menhir_env _menhir_stack _menhir_s _v
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | CHAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | FLOAT ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | INT ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | STRING ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | TYPEIDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
        | VOID ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | FIN ->
            _menhir_reduce54 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32)
    | _ ->
        _menhir_fail ()

and _menhir_reduce52 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (unit) = 
# 83 "parserJava.mly"
                                     ( (print_endline "parsFormels : /* Lambda, mot vide */") )
# 2389 "parserJava.ml"
     in
    _menhir_goto_parsFormels _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_typeBase : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CROOUV ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CROFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _2 = () in
            let _1 = () in
            let _v : (unit) = 
# 76 "parserJava.mly"
                        ( (print_endline "declTab : CROOUV CROFER") )
# 2414 "parserJava.ml"
             in
            _menhir_goto_declTab _menhir_env _menhir_stack _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            raise _eRR)
    | IDENT _ ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _v : (unit) = 
# 75 "parserJava.mly"
                                 ( (print_endline "declTab : /* Lambda, mot vide */") )
# 2427 "parserJava.ml"
         in
        _menhir_goto_declTab _menhir_env _menhir_stack _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState116 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState114 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState112 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState110 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState106 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState105 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState103 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState101 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState100 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState99 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState97 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState96 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState95 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState94 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState92 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState91 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState88 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState85 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState83 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState75 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState74 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState73 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState72 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState65 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState64 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_reduce40 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (unit) = 
# 57 "parserJava.mly"
                                 ( (print_endline "imports : /* Lambda, mot vide */"); )
# 2608 "parserJava.ml"
     in
    _menhir_goto_imports _menhir_env _menhir_stack _menhir_s _v

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PAROUV ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BOOL ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState3
            | CHAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState3
            | FLOAT ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState3
            | INT ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState3
            | STRING ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3
            | TYPEIDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
            | PARFER ->
                _menhir_reduce52 _menhir_env (Obj.magic _menhir_stack) MenhirState3
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "parserJava.mly"
       (string)
# 2663 "parserJava.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 14 "parserJava.mly"
       (string)
# 2671 "parserJava.ml"
    )) = _v in
    let _v : (unit) = 
# 73 "parserJava.mly"
                     ( (print_endline "typeBase : TYPEIDENT") )
# 2676 "parserJava.ml"
     in
    _menhir_goto_typeBase _menhir_env _menhir_stack _menhir_s _v

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 72 "parserJava.mly"
                  ( (print_endline "typeBase : STRING") )
# 2688 "parserJava.ml"
     in
    _menhir_goto_typeBase _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 68 "parserJava.mly"
               ( (print_endline "typeBase : INT") )
# 2700 "parserJava.ml"
     in
    _menhir_goto_typeBase _menhir_env _menhir_stack _menhir_s _v

and _menhir_run23 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 13 "parserJava.mly"
       (string)
# 2707 "parserJava.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IMPORT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | BOOL | CHAR | FIN | FLOAT | INT | STRING | TYPEIDENT _ | VOID ->
        _menhir_reduce40 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 69 "parserJava.mly"
                 ( (print_endline "typeBase : FLOAT") )
# 2731 "parserJava.ml"
     in
    _menhir_goto_typeBase _menhir_env _menhir_stack _menhir_s _v

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 71 "parserJava.mly"
                ( (print_endline "typeBase : CHAR") )
# 2743 "parserJava.ml"
     in
    _menhir_goto_typeBase _menhir_env _menhir_stack _menhir_s _v

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 70 "parserJava.mly"
                ( (print_endline "typeBase : BOOL") )
# 2755 "parserJava.ml"
     in
    _menhir_goto_typeBase _menhir_env _menhir_stack _menhir_s _v

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and fichier : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (unit) =
  fun lexer lexbuf ->
    let _menhir_env = let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | CHAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FLOAT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | IMPORT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | INT ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | STRING ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | TYPEIDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | VOID ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FIN ->
        _menhir_reduce40 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 166 "parserJava.mly"
  

# 2810 "parserJava.ml"

# 269 "<standard.mly>"
  

# 2815 "parserJava.ml"
