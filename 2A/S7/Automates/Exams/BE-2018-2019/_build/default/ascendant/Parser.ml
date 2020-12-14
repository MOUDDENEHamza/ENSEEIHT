
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | UL_VRAI
    | UL_VIRG
    | UL_VIDE
    | UL_NOMBRE of (
# 18 "ascendant/Parser.mly"
       (int)
# 14 "ascendant/Parser.ml"
  )
    | UL_FIN
    | UL_FAUX
    | UL_DBLPT
    | UL_CROOUV
    | UL_CROFER
    | UL_CHAINE of (
# 17 "ascendant/Parser.mly"
       (string)
# 24 "ascendant/Parser.ml"
  )
    | UL_ACCOUV
    | UL_ACCFER
  
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
  | MenhirState18
  | MenhirState15
  | MenhirState11
  | MenhirState8
  | MenhirState3
  | MenhirState1

# 1 "ascendant/Parser.mly"
  

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)


# 59 "ascendant/Parser.ml"

let rec _menhir_goto_elements_tableau : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (unit))), _, (_3 : (unit))) = _menhir_stack in
        let _2 = () in
        let _v : (unit) = 
# 52 "ascendant/Parser.mly"
                                                        ( (print_endline "ET : valeur ," ))
# 73 "ascendant/Parser.ml"
         in
        _menhir_goto_elements_tableau _menhir_env _menhir_stack _menhir_s _v
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | UL_CROFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (_2 : (unit))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (unit) = 
# 49 "ascendant/Parser.mly"
                                                        ( (print_endline "T : [...]") )
# 91 "ascendant/Parser.ml"
             in
            _menhir_goto_tableau _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_tableau : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (unit)) = _v in
    let _v : (unit) = 
# 46 "ascendant/Parser.mly"
                                                        ( (print_endline "V : tableau") )
# 116 "ascendant/Parser.ml"
     in
    _menhir_goto_valeur _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_valeur : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState18 | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | UL_VIRG ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | UL_ACCOUV ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState18
            | UL_CHAINE _v ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
            | UL_CROOUV ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState18
            | UL_FAUX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState18
            | UL_NOMBRE _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
            | UL_VIDE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState18
            | UL_VRAI ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState18
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18)
        | UL_CROFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (_1 : (unit))) = _menhir_stack in
            let _v : (unit) = 
# 51 "ascendant/Parser.mly"
                                                        ( (print_endline "ET : valeur") )
# 158 "ascendant/Parser.ml"
             in
            _menhir_goto_elements_tableau _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "ascendant/Parser.mly"
       (string)
# 173 "ascendant/Parser.ml"
        ))), _, (_3 : (unit))) = _menhir_stack in
        let _2 = () in
        let _v : (unit) = 
# 38 "ascendant/Parser.mly"
                                                        ( (print_endline "A : chaine : valeur") )
# 179 "ascendant/Parser.ml"
         in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | UL_VIRG ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | UL_CHAINE _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
            | UL_ACCFER ->
                _menhir_reduce5 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15)
        | UL_ACCFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (_1 : (unit))) = _menhir_stack in
            let _v : (unit) = 
# 35 "ascendant/Parser.mly"
                                                        ( (print_endline "LA : attribut ") )
# 205 "ascendant/Parser.ml"
             in
            _menhir_goto_liste_attributs _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_liste_attributs : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | UL_ACCFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (_2 : (unit))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (unit) = 
# 45 "ascendant/Parser.mly"
                                                        ( (print_endline "V : objet") )
# 236 "ascendant/Parser.ml"
             in
            _menhir_goto_valeur _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (unit))), _, (_3 : (unit))) = _menhir_stack in
        let _2 = () in
        let _v : (unit) = 
# 36 "ascendant/Parser.mly"
                                                        ( (print_endline "LA : attribut ,")  )
# 253 "ascendant/Parser.ml"
         in
        _menhir_goto_liste_attributs _menhir_env _menhir_stack _menhir_s _v
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | UL_ACCFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | UL_FIN ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _, (_2 : (unit))) = _menhir_stack in
                let _4 = () in
                let _3 = () in
                let _1 = () in
                let _v : (unit) = 
# 32 "ascendant/Parser.mly"
                                                        ( (print_endline "D : { ... } ") )
# 276 "ascendant/Parser.ml"
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
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 42 "ascendant/Parser.mly"
                                                        ( (print_endline "V : true") )
# 305 "ascendant/Parser.ml"
     in
    _menhir_goto_valeur _menhir_env _menhir_stack _menhir_s _v

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 44 "ascendant/Parser.mly"
                                                        ( (print_endline "V : vide") )
# 317 "ascendant/Parser.ml"
     in
    _menhir_goto_valeur _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "ascendant/Parser.mly"
       (int)
# 324 "ascendant/Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 18 "ascendant/Parser.mly"
       (int)
# 332 "ascendant/Parser.ml"
    )) = _v in
    let _v : (unit) = 
# 41 "ascendant/Parser.mly"
                                                        ( (print_endline "V : nombre") )
# 337 "ascendant/Parser.ml"
     in
    _menhir_goto_valeur _menhir_env _menhir_stack _menhir_s _v

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 43 "ascendant/Parser.mly"
                                                        ( (print_endline "V : false") )
# 349 "ascendant/Parser.ml"
     in
    _menhir_goto_valeur _menhir_env _menhir_stack _menhir_s _v

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | UL_ACCOUV ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | UL_CHAINE _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | UL_CROFER ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState8 in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : (unit) = 
# 48 "ascendant/Parser.mly"
                                                        ( (print_endline "T : []") )
# 374 "ascendant/Parser.ml"
         in
        _menhir_goto_tableau _menhir_env _menhir_stack _menhir_s _v
    | UL_CROOUV ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | UL_FAUX ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | UL_NOMBRE _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | UL_VIDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | UL_VRAI ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "ascendant/Parser.mly"
       (string)
# 395 "ascendant/Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 17 "ascendant/Parser.mly"
       (string)
# 403 "ascendant/Parser.ml"
    )) = _v in
    let _v : (unit) = 
# 40 "ascendant/Parser.mly"
                                                        ( (print_endline "V : chaine") )
# 408 "ascendant/Parser.ml"
     in
    _menhir_goto_valeur _menhir_env _menhir_stack _menhir_s _v

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | UL_CHAINE _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | UL_ACCFER ->
        _menhir_reduce5 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_reduce5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (unit) = 
# 34 "ascendant/Parser.mly"
                                                        ( (print_endline "LA : /* Lambda, mot vide */") )
# 459 "ascendant/Parser.ml"
     in
    _menhir_goto_liste_attributs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "ascendant/Parser.mly"
       (string)
# 466 "ascendant/Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | UL_DBLPT ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | UL_ACCOUV ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | UL_CHAINE _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
        | UL_CROOUV ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | UL_FAUX ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | UL_NOMBRE _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
        | UL_VIDE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | UL_VRAI ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

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

and document : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (unit) =
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
    | UL_ACCOUV ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | UL_CHAINE _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
        | UL_ACCFER ->
            _menhir_reduce5 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR)

# 55 "ascendant/Parser.mly"
  

# 550 "ascendant/Parser.ml"

# 269 "<standard.mly>"
  

# 555 "ascendant/Parser.ml"
