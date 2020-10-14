
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
    | IMPORT
    | IDENT of (
# 14 "parserJava.mly"
       (string)
# 45 "parserJava.ml"
  )
    | FLOTTANT of (
# 21 "parserJava.mly"
       (float)
# 50 "parserJava.ml"
  )
    | FLOAT
    | FIN
    | ENTIER of (
# 20 "parserJava.mly"
       (int)
# 57 "parserJava.ml"
  )
    | CROOUV
    | CROFER
    | CHAR
    | CHAINE of (
# 24 "parserJava.mly"
       (string)
# 65 "parserJava.ml"
  )
    | CARACTERE of (
# 23 "parserJava.mly"
       (char)
# 70 "parserJava.ml"
  )
    | BOOLEEN of (
# 22 "parserJava.mly"
       (bool)
# 75 "parserJava.ml"
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
  | MenhirState111
  | MenhirState109
  | MenhirState107
  | MenhirState105
  | MenhirState101
  | MenhirState100
  | MenhirState98
  | MenhirState96
  | MenhirState95
  | MenhirState94
  | MenhirState92
  | MenhirState91
  | MenhirState90
  | MenhirState89
  | MenhirState87
  | MenhirState86
  | MenhirState83
  | MenhirState80
  | MenhirState78
  | MenhirState77
  | MenhirState70
  | MenhirState69
  | MenhirState68
  | MenhirState67
  | MenhirState60
  | MenhirState59
  | MenhirState58
  | MenhirState42
  | MenhirState38
  | MenhirState37
  | MenhirState34
  | MenhirState33
  | MenhirState30
  | MenhirState25
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


# 147 "parserJava.ml"

let rec _menhir_goto_intermediate_suffix : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState80 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_2 : (unit)) = _v in
        let (_menhir_stack, _menhir_s, (_1 : (unit))) = _menhir_stack in
        let _v : (unit) = 
# 135 "parserJava.mly"
                                      ( (print_endline "intermediate_suffix : suffixe") )
# 160 "parserJava.ml"
         in
        _menhir_goto_intermediate_suffix _menhir_env _menhir_stack _menhir_s _v
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_2 : (unit)) = _v in
        let (_menhir_stack, _menhir_s, (_1 : (
# 14 "parserJava.mly"
       (string)
# 170 "parserJava.ml"
        ))) = _menhir_stack in
        let _v : (unit) = 
# 128 "parserJava.mly"
                                       ( (print_endline "expression : ident") )
# 175 "parserJava.ml"
         in
        _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
    | MenhirState87 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_4 : (unit)) = _v in
        let (((_menhir_stack, _menhir_s), _, (_2 : (unit))), _) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : (unit) = 
# 129 "parserJava.mly"
                                                          ( (print_endline "expression : (expression)") )
# 188 "parserJava.ml"
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
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | BOOLEEN _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | CARACTERE _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | ENTIER _v ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | FLOTTANT _v ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | IDENT _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | NOUVEAU ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPDIV ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPEG ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPET ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPINF ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPINFEG ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPMOD ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPMOINS ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPMULT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPNON ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPNONEG ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPOU ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPPLUS ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPPT ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPSUP ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | OPSUPEG ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | PAROUV ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | RETOUR ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | SI ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | TANTQUE ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | VIDE ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | ACCFER ->
        _menhir_reduce44 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105

and _menhir_run91 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | CHAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | FLOAT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | INT ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | STRING ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | TYPEIDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
    | ACCFER | ASSIGN | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPDIV | OPEG | OPET | OPINF | OPINFEG | OPMOD | OPMOINS | OPMULT | OPNON | OPNONEG | OPOU | OPPLUS | OPPT | OPSUP | OPSUPEG | PAROUV | RETOUR | SI | TANTQUE | VIDE ->
        _menhir_reduce67 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91

and _menhir_goto_another_expression : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState69 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s), _, (_2 : (unit))), _, (_3 : (unit))) = _menhir_stack in
        let _1 = () in
        let _v : (unit) = 
# 143 "parserJava.mly"
                                                      ( (print_endline "another_expression : VIRG expression") )
# 299 "parserJava.ml"
         in
        _menhir_goto_another_expression _menhir_env _menhir_stack _menhir_s _v
    | MenhirState67 ->
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
# 139 "parserJava.mly"
                                                      ( (print_endline "suffixe : (expression+)") )
# 317 "parserJava.ml"
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

and _menhir_run68 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASSIGN ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | BOOLEEN _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
    | CARACTERE _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
    | ENTIER _v ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
    | FLOTTANT _v ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
    | IDENT _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
    | NOUVEAU ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | OPDIV ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | OPEG ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | OPET ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | OPINF ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | OPINFEG ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | OPMOD ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | OPMOINS ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | OPMULT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | OPNON ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | OPNONEG ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | OPOU ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | OPPLUS ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | OPPT ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | OPSUP ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | OPSUPEG ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | PAROUV ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | VIDE ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68

and _menhir_goto_suffixe : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CROOUV ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | PAROUV ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | CROFER | OPPLUS | PARFER | PTVIRG | VIRG ->
        _menhir_reduce47 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80

and _menhir_run70 : _menhir_env -> 'ttv_tail * _menhir_state * (unit) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASSIGN ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | BOOLEEN _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | CARACTERE _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | ENTIER _v ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | FLOTTANT _v ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | IDENT _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | NOUVEAU ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | OPDIV ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | OPEG ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | OPET ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | OPINF ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | OPINFEG ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | OPMOD ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | OPMOINS ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | OPMULT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | OPNON ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | OPNONEG ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | OPOU ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | OPPLUS ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | OPPT ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | OPSUP ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | OPSUPEG ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | PAROUV ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | VIDE ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70

and _menhir_goto_instruction_bis : _menhir_env -> 'ttv_tail -> _menhir_state -> (int) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState92 ->
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
# 484 "parserJava.ml"
             in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            (match _menhir_s with
            | MenhirState96 ->
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
                        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState98
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState98)
                | ACCFER | ASSIGN | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPDIV | OPEG | OPET | OPINF | OPINFEG | OPMOD | OPMOINS | OPMULT | OPNON | OPNONEG | OPOU | OPPLUS | OPPT | OPSUP | OPSUPEG | PAROUV | RETOUR | SI | TANTQUE | VIDE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((((_menhir_stack, _menhir_s), _, (_3 : (unit))), _), _, (_5 : (unit))) = _menhir_stack in
                    let _4 = () in
                    let _2 = () in
                    let _1 = () in
                    let _v : (unit) = 
# 107 "parserJava.mly"
                                                     ( (print_endline "SI PAROUV expression PARFER corps") )
# 513 "parserJava.ml"
                     in
                    _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | MenhirState98 ->
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
# 533 "parserJava.ml"
                 in
                _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v
            | MenhirState90 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((((_menhir_stack, _menhir_s), _, (_3 : (unit))), _), _, (_5 : (unit))) = _menhir_stack in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : (unit) = 
# 109 "parserJava.mly"
                                                         ( (print_endline "instruction : TANTQUE PAROUV expression PARFER corps") )
# 546 "parserJava.ml"
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
    | MenhirState105 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (unit))), _, (_2 : (int))) = _menhir_stack in
        let _v : (int) = 
# 118 "parserJava.mly"
                                              ( (print_endline "instruction_bis : instruction"); (_2 + 1) )
# 564 "parserJava.ml"
         in
        _menhir_goto_instruction_bis _menhir_env _menhir_stack _menhir_s _v
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (int))) = _menhir_stack in
        let _v : (unit) = 
# 98 "parserJava.mly"
                               (
                (print_endline "instructions : instruction");
                (print_string "Nombre d'instructions = ");
                (print_int _1);
                (print_newline ());         
        )
# 579 "parserJava.ml"
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
# 85 "parserJava.mly"
                                            ( 
                (print_endline "bloc : ACCOUV variables instructions ACCFER");
                (print_string "Nombre de variables = ");
                (print_int _2);
                (print_newline ());
        )
# 601 "parserJava.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_2 : (unit)) = _v in
            let (_menhir_stack, _menhir_s, (_1 : (unit))) = _menhir_stack in
            let _v : (unit) = 
# 74 "parserJava.mly"
                        ( (print_endline "fonction : entete bloc") )
# 610 "parserJava.ml"
             in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_stack = Obj.magic _menhir_stack in
            assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BOOL ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | CHAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | FLOAT ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | INT ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | STRING ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | TYPEIDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
            | VOID ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | FIN ->
                _menhir_reduce51 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_reduce47 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (unit) = 
# 134 "parserJava.mly"
                                              ( (print_endline "intermediate_suffix : /* Lambda, mot vide */") )
# 651 "parserJava.ml"
     in
    _menhir_goto_intermediate_suffix _menhir_env _menhir_stack _menhir_s _v

and _menhir_run60 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASSIGN ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | BOOLEEN _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | CARACTERE _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | ENTIER _v ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | FLOTTANT _v ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | IDENT _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | NOUVEAU ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | OPDIV ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | OPEG ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | OPET ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | OPINF ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | OPINFEG ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | OPMOD ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | OPMOINS ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | OPMULT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | OPNON ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | OPNONEG ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | OPOU ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | OPPLUS ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | OPPT ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | OPSUP ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | OPSUPEG ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | PARFER ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState60 in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : (unit) = 
# 137 "parserJava.mly"
                        ( (print_endline "suffixe : ( )") )
# 716 "parserJava.ml"
         in
        _menhir_goto_suffixe _menhir_env _menhir_stack _menhir_s _v
    | PAROUV ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | VIDE ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60

and _menhir_run77 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASSIGN ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | BOOLEEN _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | CARACTERE _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | ENTIER _v ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | FLOTTANT _v ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | IDENT _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | NOUVEAU ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | OPDIV ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | OPEG ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | OPET ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | OPINF ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | OPINFEG ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | OPMOD ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | OPMOINS ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | OPMULT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | OPNON ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | OPNONEG ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | OPOU ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | OPPLUS ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | OPPT ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | OPSUP ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | OPSUPEG ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | PAROUV ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | VIDE ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState77

and _menhir_goto_expression : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState60 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OPPLUS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | PARFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState67 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (_2 : (unit))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (unit) = 
# 138 "parserJava.mly"
                                   ( (print_endline "suffixe : (expression)") )
# 809 "parserJava.ml"
             in
            _menhir_goto_suffixe _menhir_env _menhir_stack _menhir_s _v
        | VIRG ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67)
    | MenhirState68 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OPPLUS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | VIRG ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | PARFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState69 in
            let _v : (unit) = 
# 142 "parserJava.mly"
                                            ( (print_endline "another_expression : /* Lambda, mot vide */") )
# 833 "parserJava.ml"
             in
            _menhir_goto_another_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69)
    | MenhirState70 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (_1 : (unit))), _), _, (_3 : (unit))) = _menhir_stack in
        let _2 = () in
        let _v : (unit) = 
# 130 "parserJava.mly"
                                          ( (print_endline "expression : expression OPPLUS expression") )
# 848 "parserJava.ml"
         in
        _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
    | MenhirState77 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CROFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState78 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (_2 : (unit))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (unit) = 
# 140 "parserJava.mly"
                                   ( (print_endline "suffixe : [expression]") )
# 867 "parserJava.ml"
             in
            _menhir_goto_suffixe _menhir_env _menhir_stack _menhir_s _v
        | OPPLUS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78)
    | MenhirState58 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CROFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState83 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), (_2 : (
# 14 "parserJava.mly"
       (string)
# 889 "parserJava.ml"
            ))), _, (_4 : (unit))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (unit) = 
# 127 "parserJava.mly"
                                             ( (print_endline "expression : new ident [expression]") )
# 897 "parserJava.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | OPPLUS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83)
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _, (_2 : (unit))) = _menhir_stack in
        let _1 = () in
        let _v : (unit) = 
# 131 "parserJava.mly"
                                    ( (print_endline "expression : OPPLUS expression %prec OPNON") )
# 914 "parserJava.ml"
         in
        _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OPPLUS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | PARFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState86 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | CROOUV ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | PAROUV ->
                _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | CROFER | OPPLUS | PARFER | PTVIRG | VIRG ->
                _menhir_reduce47 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState87)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState86)
    | MenhirState37 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OPPLUS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState89
        | PARFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState89 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ACCOUV ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState90
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState90)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState89)
    | MenhirState94 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OPPLUS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState95
        | PARFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState95 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ACCOUV ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState95)
    | MenhirState100 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OPPLUS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | PTVIRG ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState101 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (_2 : (unit))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (unit) = 
# 110 "parserJava.mly"
                                            ( (print_endline "instruction : RETURN expression PTVIRG") )
# 1011 "parserJava.ml"
             in
            _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101)
    | MenhirState34 | MenhirState92 | MenhirState105 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OPPLUS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | PTVIRG ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState107 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (_1 : (unit))) = _menhir_stack in
            let _2 = () in
            let _v : (unit) = 
# 106 "parserJava.mly"
                                ( (print_endline "instruction : expression PTVIRG") )
# 1035 "parserJava.ml"
             in
            _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState107)
    | _ ->
        _menhir_fail ()

and _menhir_goto_binaire : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (unit)) = _v in
    let _v : (unit) = 
# 132 "parserJava.mly"
                     ( (print_endline "expression : BINAIRE") )
# 1053 "parserJava.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce44 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (int) = 
# 117 "parserJava.mly"
                                         ( (print_endline "instruction_bis : /* Lambda, mot vide */"); 0 )
# 1062 "parserJava.ml"
     in
    _menhir_goto_instruction_bis _menhir_env _menhir_stack _menhir_s _v

and _menhir_run35 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 125 "parserJava.mly"
                  ( (print_endline "expression : NULL") )
# 1074 "parserJava.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_run36 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | BOOLEEN _v ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | CARACTERE _v ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | ENTIER _v ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | FLOTTANT _v ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | IDENT _v ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | NOUVEAU ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | OPDIV ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | OPEG ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | OPET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | OPINF ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | OPINFEG ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | OPMOD ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | OPMOINS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | OPMULT ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | OPNON ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | OPNONEG ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | OPOU ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | OPPLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | OPPT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | OPSUP ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | OPSUPEG ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | PAROUV ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | VIDE ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run93 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | BOOLEEN _v ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
        | CARACTERE _v ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
        | ENTIER _v ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
        | FLOTTANT _v ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
        | IDENT _v ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
        | NOUVEAU ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | OPDIV ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | OPEG ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | OPET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | OPINF ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | OPINFEG ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | OPMOD ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | OPMOINS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | OPMULT ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | OPNON ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | OPNONEG ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | OPOU ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | OPPLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | OPPT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | OPSUP ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | OPSUPEG ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | PAROUV ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | VIDE ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState94)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run100 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASSIGN ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | BOOLEEN _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
    | CARACTERE _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
    | ENTIER _v ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
    | FLOTTANT _v ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
    | IDENT _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
    | NOUVEAU ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | OPDIV ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | OPEG ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | OPET ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | OPINF ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | OPINFEG ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | OPMOD ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | OPMOINS ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | OPMULT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | OPNON ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | OPNONEG ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | OPOU ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | OPPLUS ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | OPPT ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | OPSUP ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | OPSUPEG ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | PAROUV ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | VIDE ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100

and _menhir_run38 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASSIGN ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | BOOLEEN _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | CARACTERE _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | ENTIER _v ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | FLOTTANT _v ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | IDENT _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | NOUVEAU ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | OPDIV ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | OPEG ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | OPET ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | OPINF ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | OPINFEG ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | OPMOD ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | OPMOINS ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | OPMULT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | OPNON ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | OPNONEG ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | OPOU ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | OPPLUS ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | OPPT ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | OPSUP ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | OPSUPEG ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | PAROUV ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | VIDE ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 154 "parserJava.mly"
                  ( (print_endline "binaire : >="))
# 1344 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run40 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 152 "parserJava.mly"
                ( (print_endline "binaire : >") )
# 1356 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 165 "parserJava.mly"
               ( (print_endline "binaire : .") )
# 1368 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run42 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASSIGN ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | BOOLEEN _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | CARACTERE _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | ENTIER _v ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | FLOTTANT _v ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | IDENT _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | NOUVEAU ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | OPDIV ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | OPEG ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | OPET ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | OPINF ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | OPINFEG ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | OPMOD ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | OPMOINS ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | OPMULT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | OPNON ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | OPNONEG ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | OPOU ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | OPPT ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | OPSUP ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | OPSUPEG ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | PAROUV ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | VIDE ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | CROFER | OPPLUS | PARFER | PTVIRG | VIRG ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (unit) = 
# 157 "parserJava.mly"
                 ( (print_endline "binaire : +") )
# 1431 "parserJava.ml"
         in
        _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42

and _menhir_run43 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 159 "parserJava.mly"
               ( (print_endline "binaire : ||") )
# 1447 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run44 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 156 "parserJava.mly"
                  ( (print_endline "binaire : !=") )
# 1459 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run45 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 164 "parserJava.mly"
                ( (print_endline "binaire : !") )
# 1471 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 160 "parserJava.mly"
                 ( (print_endline "binaire : *") )
# 1483 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run47 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 158 "parserJava.mly"
                  ( (print_endline "binaire : -") )
# 1495 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 161 "parserJava.mly"
                ( (print_endline "binaire : %") )
# 1507 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run49 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 153 "parserJava.mly"
                  ( (print_endline "binaire : <=") )
# 1519 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run50 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 151 "parserJava.mly"
                ( (print_endline "binaire : <") )
# 1531 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run51 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 163 "parserJava.mly"
               ( (print_endline "binaire : &&") )
# 1543 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run52 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 155 "parserJava.mly"
               ( (print_endline "binaire : ==") )
# 1555 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run53 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 162 "parserJava.mly"
                ( (print_endline "binaire : /") )
# 1567 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_run54 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | BOOLEEN _v ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
            | CARACTERE _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
            | ENTIER _v ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
            | FLOTTANT _v ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
            | IDENT _v ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
            | NOUVEAU ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | OPDIV ->
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | OPEG ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | OPET ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | OPINF ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | OPINFEG ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | OPMOD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | OPMOINS ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | OPMULT ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | OPNON ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | OPNONEG ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | OPOU ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | OPPLUS ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | OPPT ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | OPSUP ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | OPSUPEG ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | PAROUV ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | VIDE ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58)
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
# 1652 "parserJava.ml"
                ))) = _menhir_stack in
                let _4 = () in
                let _3 = () in
                let _1 = () in
                let _v : (unit) = 
# 126 "parserJava.mly"
                                         ( (print_endline "expression : new ident ()") )
# 1660 "parserJava.ml"
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

and _menhir_run59 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "parserJava.mly"
       (string)
# 1685 "parserJava.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CROOUV ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | PAROUV ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | CROFER | OPPLUS | PARFER | PTVIRG | VIRG ->
        _menhir_reduce47 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59

and _menhir_run62 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 21 "parserJava.mly"
       (float)
# 1706 "parserJava.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 21 "parserJava.mly"
       (float)
# 1714 "parserJava.ml"
    )) = _v in
    let _v : (unit) = 
# 122 "parserJava.mly"
                      ( (print_endline "expression : FLOTTANT") )
# 1719 "parserJava.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_run63 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 20 "parserJava.mly"
       (int)
# 1726 "parserJava.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 20 "parserJava.mly"
       (int)
# 1734 "parserJava.ml"
    )) = _v in
    let _v : (unit) = 
# 121 "parserJava.mly"
                    ( (print_endline "expression : ENTIER") )
# 1739 "parserJava.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_run64 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parserJava.mly"
       (char)
# 1746 "parserJava.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 23 "parserJava.mly"
       (char)
# 1754 "parserJava.ml"
    )) = _v in
    let _v : (unit) = 
# 123 "parserJava.mly"
                       ( (print_endline "expression : CARACTERE") )
# 1759 "parserJava.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_run65 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 22 "parserJava.mly"
       (bool)
# 1766 "parserJava.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 22 "parserJava.mly"
       (bool)
# 1774 "parserJava.ml"
    )) = _v in
    let _v : (unit) = 
# 124 "parserJava.mly"
                     ( (print_endline "expression : BOOLEEN") )
# 1779 "parserJava.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_run66 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 150 "parserJava.mly"
                 ( (print_endline "binaire : =") )
# 1791 "parserJava.ml"
     in
    _menhir_goto_binaire _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_variables : _menhir_env -> 'ttv_tail -> _menhir_state -> (int) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ASSIGN ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | BOOLEEN _v ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | CARACTERE _v ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | ENTIER _v ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | FLOTTANT _v ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | IDENT _v ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | NOUVEAU ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | OPDIV ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | OPEG ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | OPET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | OPINF ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | OPINFEG ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | OPMOD ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | OPMOINS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | OPMULT ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | OPNON ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | OPNONEG ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | OPOU ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | OPPLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | OPPT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | OPSUP ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | OPSUPEG ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | PAROUV ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | RETOUR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | SI ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | TANTQUE ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | VIDE ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | ACCFER ->
            _menhir_reduce44 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34)
    | MenhirState109 | MenhirState91 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState109
        | CHAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState109
        | FLOAT ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState109
        | INT ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState109
        | STRING ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState109
        | TYPEIDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
        | ACCFER | ASSIGN | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPDIV | OPEG | OPET | OPINF | OPINFEG | OPMOD | OPMOINS | OPMULT | OPNON | OPNONEG | OPOU | OPPLUS | OPPT | OPSUP | OPSUPEG | PAROUV | RETOUR | SI | TANTQUE | VIDE ->
            _menhir_reduce67 _menhir_env (Obj.magic _menhir_stack) MenhirState109
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109)
    | MenhirState111 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (unit))), _, (_2 : (int))) = _menhir_stack in
        let _v : (int) = 
# 93 "parserJava.mly"
                               ( (print_endline "variables : variable variables"); (_2 + 1) )
# 1894 "parserJava.ml"
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
# 1910 "parserJava.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (unit) = 
# 83 "parserJava.mly"
                                                          ( (print_endline "suiteParsFormels : VIRG typeStruct IDENT suiteParsFormels") )
# 1916 "parserJava.ml"
         in
        _menhir_goto_suiteParsFormels _menhir_env _menhir_stack _menhir_s _v
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_3 : (unit)) = _v in
        let ((_menhir_stack, _menhir_s, (_1 : (unit))), (_2 : (
# 14 "parserJava.mly"
       (string)
# 1926 "parserJava.ml"
        ))) = _menhir_stack in
        let _v : (unit) = 
# 80 "parserJava.mly"
                                                ( (print_endline "parsFormels : typeStruct IDENT suiteParsFormels") )
# 1931 "parserJava.ml"
         in
        _menhir_goto_parsFormels _menhir_env _menhir_stack _menhir_s _v
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
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | CHAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | FLOAT ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | INT ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | STRING ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | TYPEIDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
        | ACCFER | ASSIGN | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPDIV | OPEG | OPET | OPINF | OPINFEG | OPMOD | OPMOINS | OPMULT | OPNON | OPNONEG | OPOU | OPPLUS | OPPT | OPSUP | OPSUPEG | PAROUV | RETOUR | SI | TANTQUE | VIDE ->
            _menhir_reduce67 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_reduce67 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (int) = 
# 92 "parserJava.mly"
                                   ( (print_endline "variables : /* Lambda, mot vide */"); 0 )
# 1979 "parserJava.ml"
     in
    _menhir_goto_variables _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce57 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (unit) = 
# 82 "parserJava.mly"
                                          ( (print_endline "suiteParsFormels : /* Lambda, mot vide */") )
# 1988 "parserJava.ml"
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
# 2036 "parserJava.ml"
            ))), _, (_4 : (unit))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (unit) = 
# 77 "parserJava.mly"
                                              ( (print_endline "entete : VOID IDENT PAROUV parsFormels PARFER") )
# 2044 "parserJava.ml"
             in
            _menhir_goto_entete _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState25 ->
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
# 2065 "parserJava.ml"
            ))), _, (_4 : (unit))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _v : (unit) = 
# 76 "parserJava.mly"
                                                    ( (print_endline "entete : typeStruct IDENT PAROUV parsFormels PARFER") )
# 2072 "parserJava.ml"
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
# 62 "parserJava.mly"
                              ( (print_endline "typeStruct : typeBase declTab") )
# 2093 "parserJava.ml"
     in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState25 | MenhirState3 ->
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
                _menhir_reduce57 _menhir_env (Obj.magic _menhir_stack) MenhirState11
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
                _menhir_reduce57 _menhir_env (Obj.magic _menhir_stack) MenhirState14
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
    | MenhirState30 | MenhirState0 ->
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
                    _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                | CHAR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                | FLOAT ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                | INT ->
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                | STRING ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                | TYPEIDENT _v ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
                | PARFER ->
                    _menhir_reduce49 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25)
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
    | MenhirState33 | MenhirState91 | MenhirState109 | MenhirState111 ->
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
# 2211 "parserJava.ml"
                ))) = _menhir_stack in
                let _3 = () in
                let _v : (unit) = 
# 95 "parserJava.mly"
                                   ( (print_endline "variable : typeStruct IDENT PTVIRG") )
# 2217 "parserJava.ml"
                 in
                let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
                let _menhir_stack = Obj.magic _menhir_stack in
                assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | BOOL ->
                    _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState111
                | CHAR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState111
                | FLOAT ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState111
                | INT ->
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState111
                | STRING ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState111
                | TYPEIDENT _v ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
                | ACCFER | ASSIGN | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPDIV | OPEG | OPET | OPINF | OPINFEG | OPMOD | OPMOINS | OPMULT | OPNON | OPNONEG | OPOU | OPPLUS | OPPT | OPSUP | OPSUPEG | PAROUV | RETOUR | SI | TANTQUE | VIDE ->
                    _menhir_reduce67 _menhir_env (Obj.magic _menhir_stack) MenhirState111
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111)
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
# 57 "parserJava.mly"
                        ( (print_endline "fichier : programme FIN"); (print_string "Nombre de méthodes = "); (print_int _1); (print_newline ()) )
# 2274 "parserJava.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (unit)) = _v in
            Obj.magic _1
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (unit))), _, (_2 : (int))) = _menhir_stack in
        let _v : (int) = 
# 60 "parserJava.mly"
                               ( (print_endline "programme : fonction programme"); (_2 + 1) )
# 2293 "parserJava.ml"
         in
        _menhir_goto_programme _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_reduce49 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (unit) = 
# 79 "parserJava.mly"
                                     ( (print_endline "parsFormels : /* Lambda, mot vide */") )
# 2304 "parserJava.ml"
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
# 72 "parserJava.mly"
                        ( (print_endline "declTab : CROOUV CROFER") )
# 2329 "parserJava.ml"
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
# 71 "parserJava.mly"
                                 ( (print_endline "declTab : /* Lambda, mot vide */") )
# 2342 "parserJava.ml"
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
    | MenhirState111 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState109 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState107 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState105 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState101 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState100 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState98 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState96 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState95 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState94 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState92 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState91 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState90 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState89 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState87 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState86 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState83 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState80 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState77 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState70 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState69 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState68 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState60 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState58 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState37 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
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

and _menhir_reduce51 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (int) = 
# 59 "parserJava.mly"
                                   ( (print_endline "programme : /* Lambda, mot vide */"); 0 )
# 2515 "parserJava.ml"
     in
    _menhir_goto_programme _menhir_env _menhir_stack _menhir_s _v

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
                _menhir_reduce49 _menhir_env (Obj.magic _menhir_stack) MenhirState3
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
# 2570 "parserJava.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 14 "parserJava.mly"
       (string)
# 2578 "parserJava.ml"
    )) = _v in
    let _v : (unit) = 
# 69 "parserJava.mly"
                     ( (print_endline "typeBase : TYPEIDENT") )
# 2583 "parserJava.ml"
     in
    _menhir_goto_typeBase _menhir_env _menhir_stack _menhir_s _v

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 68 "parserJava.mly"
                  ( (print_endline "typeBase : STRING") )
# 2595 "parserJava.ml"
     in
    _menhir_goto_typeBase _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 64 "parserJava.mly"
               ( (print_endline "typeBase : INT") )
# 2607 "parserJava.ml"
     in
    _menhir_goto_typeBase _menhir_env _menhir_stack _menhir_s _v

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 65 "parserJava.mly"
                 ( (print_endline "typeBase : FLOAT") )
# 2619 "parserJava.ml"
     in
    _menhir_goto_typeBase _menhir_env _menhir_stack _menhir_s _v

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 67 "parserJava.mly"
                ( (print_endline "typeBase : CHAR") )
# 2631 "parserJava.ml"
     in
    _menhir_goto_typeBase _menhir_env _menhir_stack _menhir_s _v

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 66 "parserJava.mly"
                ( (print_endline "typeBase : BOOL") )
# 2643 "parserJava.ml"
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
    | INT ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | STRING ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | TYPEIDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | VOID ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FIN ->
        _menhir_reduce51 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 167 "parserJava.mly"
  

# 2696 "parserJava.ml"

# 269 "<standard.mly>"
  

# 2701 "parserJava.ml"
