
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | UL_VIRG
    | UL_VARIABLE of (
# 17 "ascendant/Parser.mly"
       (string)
# 12 "ascendant/Parser.ml"
  )
    | UL_SYMBOLE of (
# 16 "ascendant/Parser.mly"
       (string)
# 17 "ascendant/Parser.ml"
  )
    | UL_PT
    | UL_PAROUV
    | UL_PARFER
    | UL_NEGATION
    | UL_FIN
    | UL_ECHEC
    | UL_DEDUCTION
    | UL_COUPURE
  
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
  | MenhirState23
  | MenhirState18
  | MenhirState17
  | MenhirState13
  | MenhirState7
  | MenhirState4
  | MenhirState2
  | MenhirState0

# 1 "ascendant/Parser.mly"
  

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)


# 60 "ascendant/Parser.ml"

let rec _menhir_goto_suite_deduction : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (unit))), _, (_3 : (unit))) = _menhir_stack in
        let _2 = () in
        let _v : (unit) = 
# 47 "ascendant/Parser.mly"
                                                        ( (print_endline "suite_deduction : suite_predicat UL_VIRG suite_deduction") )
# 74 "ascendant/Parser.ml"
         in
        _menhir_goto_suite_deduction _menhir_env _menhir_stack _menhir_s _v
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | UL_PT ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (_1 : (unit))), _, (_3 : (unit))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (unit) = 
# 44 "ascendant/Parser.mly"
                                                        ( (print_endline "deduction : predicat UL_SYMBOLE_DEDUCTION suite_deduction UL_PT") )
# 92 "ascendant/Parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (unit)) = _v in
            let _v : (unit) = 
# 39 "ascendant/Parser.mly"
                  ( (print_endline "regle : deduction ") )
# 100 "ascendant/Parser.ml"
             in
            _menhir_goto_regle _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_programme : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (unit))), _, (_2 : (unit))) = _menhir_stack in
        let _v : (unit) = 
# 36 "ascendant/Parser.mly"
                            ( (print_endline "programme : regle programme") )
# 123 "ascendant/Parser.ml"
         in
        _menhir_goto_programme _menhir_env _menhir_stack _menhir_s _v
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | UL_FIN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (_1 : (unit))) = _menhir_stack in
            let _2 = () in
            let _v : (unit) = 
# 33 "ascendant/Parser.mly"
                            ( (print_endline "document : programme UL_FIN ") )
# 139 "ascendant/Parser.ml"
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
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_suite_predicat : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | UL_VIRG ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | UL_COUPURE ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | UL_ECHEC ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | UL_NEGATION ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | UL_SYMBOLE _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23)
    | UL_PT ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (unit))) = _menhir_stack in
        let _v : (unit) = 
# 46 "ascendant/Parser.mly"
                                 ( (print_endline "suite_deduction : suite_predicat") )
# 189 "ascendant/Parser.ml"
         in
        _menhir_goto_suite_deduction _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_regle : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | UL_SYMBOLE _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | UL_FIN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (unit))) = _menhir_stack in
        let _v : (unit) = 
# 35 "ascendant/Parser.mly"
                  ( (print_endline "programme : programme : regle") )
# 214 "ascendant/Parser.ml"
         in
        _menhir_goto_programme _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | UL_SYMBOLE _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 51 "ascendant/Parser.mly"
                           ( (print_endline "suite_predicat : UL_ECHEC") )
# 243 "ascendant/Parser.ml"
     in
    _menhir_goto_suite_predicat _menhir_env _menhir_stack _menhir_s _v

and _menhir_run21 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (unit) = 
# 52 "ascendant/Parser.mly"
                             ( (print_endline "suite_predicat : UL_COUPURE") )
# 255 "ascendant/Parser.ml"
     in
    _menhir_goto_suite_predicat _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_suite_variable : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (unit))), _, (_3 : (unit))) = _menhir_stack in
        let _2 = () in
        let _v : (unit) = 
# 59 "ascendant/Parser.mly"
                                              ( (print_endline "suite_variable : terme UL_VIRG suite_variable") )
# 271 "ascendant/Parser.ml"
         in
        _menhir_goto_suite_variable _menhir_env _menhir_stack _menhir_s _v
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "ascendant/Parser.mly"
       (string)
# 280 "ascendant/Parser.ml"
        ))), _, (_3 : (unit))) = _menhir_stack in
        let _2 = () in
        let _v : (unit) = 
# 58 "ascendant/Parser.mly"
                                                    ( (print_endline "suite_variable : UL_VARIABLE UL_VIRG suite_variable") )
# 286 "ascendant/Parser.ml"
         in
        _menhir_goto_suite_variable _menhir_env _menhir_stack _menhir_s _v
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | UL_PARFER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "ascendant/Parser.mly"
       (string)
# 301 "ascendant/Parser.ml"
            ))), _, (_3 : (unit))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (unit) = 
# 54 "ascendant/Parser.mly"
                                                         ( (print_endline "predicat : UL_SYMBOLE UL_PAROUV suite_variable UL_PARFER") )
# 308 "ascendant/Parser.ml"
             in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            (match _menhir_s with
            | MenhirState2 | MenhirState4 | MenhirState7 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, (_1 : (unit))) = _menhir_stack in
                let _v : (unit) = 
# 62 "ascendant/Parser.mly"
                 ( (print_endline "terme : predicat") )
# 319 "ascendant/Parser.ml"
                 in
                _menhir_goto_terme _menhir_env _menhir_stack _menhir_s _v
            | MenhirState0 | MenhirState13 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | UL_DEDUCTION ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | UL_COUPURE ->
                        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                    | UL_ECHEC ->
                        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                    | UL_NEGATION ->
                        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState17
                    | UL_SYMBOLE _v ->
                        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17)
                | UL_PT ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _menhir_s, (_1 : (unit))) = _menhir_stack in
                    let _2 = () in
                    let _v : (unit) = 
# 42 "ascendant/Parser.mly"
                        ( (print_endline "axiome : predicat UL_PT") )
# 353 "ascendant/Parser.ml"
                     in
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_1 : (unit)) = _v in
                    let _v : (unit) = 
# 38 "ascendant/Parser.mly"
               ( (print_endline "regle : axiome ") )
# 361 "ascendant/Parser.ml"
                     in
                    _menhir_goto_regle _menhir_env _menhir_stack _menhir_s _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | MenhirState18 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s), _, (_2 : (unit))) = _menhir_stack in
                let _1 = () in
                let _v : (unit) = 
# 50 "ascendant/Parser.mly"
                                       ( (print_endline "suite_predicat : UL_NEGATION predicat") )
# 378 "ascendant/Parser.ml"
                 in
                _menhir_goto_suite_predicat _menhir_env _menhir_stack _menhir_s _v
            | MenhirState17 | MenhirState23 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, (_1 : (unit))) = _menhir_stack in
                let _v : (unit) = 
# 49 "ascendant/Parser.mly"
                          ( (print_endline "suite_predicat : predicat") )
# 388 "ascendant/Parser.ml"
                 in
                _menhir_goto_suite_predicat _menhir_env _menhir_stack _menhir_s _v)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_terme : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | UL_VIRG ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | UL_SYMBOLE _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
        | UL_VARIABLE _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7)
    | UL_PARFER ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (unit))) = _menhir_stack in
        let _v : (unit) = 
# 57 "ascendant/Parser.mly"
                       ( (print_endline "suite_variable : terme") )
# 426 "ascendant/Parser.ml"
         in
        _menhir_goto_suite_variable _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "ascendant/Parser.mly"
       (string)
# 439 "ascendant/Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | UL_VIRG ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | UL_SYMBOLE _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
        | UL_VARIABLE _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4)
    | UL_PARFER ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (
# 17 "ascendant/Parser.mly"
       (string)
# 464 "ascendant/Parser.ml"
        ))) = _menhir_stack in
        let _v : (unit) = 
# 56 "ascendant/Parser.mly"
                             ( (print_endline "suite_variable : UL_VARIABLE") )
# 469 "ascendant/Parser.ml"
         in
        _menhir_goto_suite_variable _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "ascendant/Parser.mly"
       (string)
# 482 "ascendant/Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | UL_PAROUV ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack)
    | UL_PARFER | UL_VIRG ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (
# 16 "ascendant/Parser.mly"
       (string)
# 496 "ascendant/Parser.ml"
        ))) = _menhir_stack in
        let _v : (unit) = 
# 61 "ascendant/Parser.mly"
                   ( (print_endline "terme : UL_SYMBOLE") )
# 501 "ascendant/Parser.ml"
         in
        _menhir_goto_terme _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run2 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 16 "ascendant/Parser.mly"
       (string)
# 514 "ascendant/Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | UL_SYMBOLE _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
    | UL_VARIABLE _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "ascendant/Parser.mly"
       (string)
# 567 "ascendant/Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | UL_PAROUV ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack)
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
    | UL_SYMBOLE _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 64 "ascendant/Parser.mly"
  

# 618 "ascendant/Parser.ml"

# 269 "<standard.mly>"
  

# 623 "ascendant/Parser.ml"
