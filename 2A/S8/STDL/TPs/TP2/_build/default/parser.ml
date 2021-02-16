
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | WhileToken
    | UMinusToken
    | TrueToken
    | ThenToken
    | StarToken
    | SlashToken
    | SequenceToken
    | RightParenthesisToken
    | RefToken
    | RecToken
    | PlusToken
    | OrToken
    | NumberToken of (
# 6 "parser.mly"
       (int)
# 23 "parser.ml"
  )
    | MinusToken
    | LetToken
    | LesserToken
    | LesserEqualToken
    | LeftParenthesisToken
    | InToken
    | IfToken
    | IdentToken of (
# 7 "parser.mly"
       (string)
# 35 "parser.ml"
  )
    | GreaterToken
    | GreaterEqualToken
    | FunctionToken
    | FalseToken
    | EqualToken
    | ElseToken
    | EOF
    | DoneToken
    | DoToken
    | DifferentToken
    | DerefToken
    | BodyToken
    | AssignToken
    | AndToken
  
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
  | MenhirState67
  | MenhirState63
  | MenhirState59
  | MenhirState56
  | MenhirState53
  | MenhirState51
  | MenhirState48
  | MenhirState46
  | MenhirState44
  | MenhirState42
  | MenhirState40
  | MenhirState38
  | MenhirState36
  | MenhirState34
  | MenhirState32
  | MenhirState30
  | MenhirState28
  | MenhirState26
  | MenhirState24
  | MenhirState22
  | MenhirState19
  | MenhirState17
  | MenhirState13
  | MenhirState12
  | MenhirState11
  | MenhirState8
  | MenhirState6
  | MenhirState3
  | MenhirState1
  | MenhirState0

# 1 "parser.mly"
  
open Ast

# 102 "parser.ml"

let rec _menhir_run22 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 107 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22

and _menhir_run24 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 147 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24

and _menhir_run26 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 187 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26

and _menhir_run28 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 227 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28

and _menhir_run30 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 267 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30

and _menhir_run32 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 307 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32

and _menhir_run34 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 347 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34

and _menhir_run36 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 387 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36

and _menhir_run38 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 427 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38

and _menhir_run40 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 467 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40

and _menhir_run42 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 507 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42

and _menhir_run44 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 547 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44

and _menhir_run48 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 587 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48

and _menhir_run46 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 627 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 49 "parser.mly"
      (Ast.ast)
# 667 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv97 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 677 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv95 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 683 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (e : (
# 49 "parser.mly"
      (Ast.ast)
# 688 "parser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 694 "parser.ml"
        ) = 
# 98 "parser.mly"
                                                                     (ReadNode e)
# 698 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv96)) : 'freshtv98)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv103 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 706 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 710 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AndToken ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | AssignToken ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | DifferentToken ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | EqualToken ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | GreaterEqualToken ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | GreaterToken ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | LesserEqualToken ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | LesserToken ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | OrToken ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SequenceToken ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | DoToken | DoneToken | EOF | ElseToken | InToken | RightParenthesisToken | ThenToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv99 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 748 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 752 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (n : (
# 7 "parser.mly"
       (string)
# 757 "parser.ml"
            ))), _, (e : (
# 49 "parser.mly"
      (Ast.ast)
# 761 "parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 768 "parser.ml"
            ) = 
# 88 "parser.mly"
                                                                     (FunctionNode (n,e))
# 772 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv100)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv101 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 782 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 786 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)) : 'freshtv104)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv107 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 795 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 799 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv105 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 805 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 809 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (e1 : (
# 49 "parser.mly"
      (Ast.ast)
# 814 "parser.ml"
        ))), _, (e2 : (
# 49 "parser.mly"
      (Ast.ast)
# 818 "parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 824 "parser.ml"
        ) = 
# 110 "parser.mly"
                                                                     (BinaryNode (Multiply,e1,e2))
# 828 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv106)) : 'freshtv108)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv111 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 836 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 840 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv109 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 846 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 850 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (e1 : (
# 49 "parser.mly"
      (Ast.ast)
# 855 "parser.ml"
        ))), _, (e2 : (
# 49 "parser.mly"
      (Ast.ast)
# 859 "parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 865 "parser.ml"
        ) = 
# 111 "parser.mly"
                                                                     (BinaryNode (Divide,e1,e2))
# 869 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv110)) : 'freshtv112)
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv117 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 877 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 881 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AndToken ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | AssignToken ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | DifferentToken ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | EqualToken ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | GreaterEqualToken ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | GreaterToken ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | LesserEqualToken ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | LesserToken ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | OrToken ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SequenceToken ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | DoToken | DoneToken | EOF | ElseToken | InToken | RightParenthesisToken | ThenToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv113 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 919 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 923 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e : (
# 49 "parser.mly"
      (Ast.ast)
# 928 "parser.ml"
            ))), _, (p : (
# 49 "parser.mly"
      (Ast.ast)
# 932 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 938 "parser.ml"
            ) = 
# 93 "parser.mly"
                                                                     (SequenceNode(e,p))
# 942 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv114)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv115 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 952 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 956 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)) : 'freshtv118)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv123 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 965 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 969 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | AndToken | AssignToken | DifferentToken | DoToken | DoneToken | EOF | ElseToken | EqualToken | GreaterEqualToken | GreaterToken | InToken | LesserEqualToken | LesserToken | MinusToken | OrToken | PlusToken | RightParenthesisToken | SequenceToken | ThenToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv119 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 983 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 987 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : (
# 49 "parser.mly"
      (Ast.ast)
# 992 "parser.ml"
            ))), _, (e2 : (
# 49 "parser.mly"
      (Ast.ast)
# 996 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 1002 "parser.ml"
            ) = 
# 108 "parser.mly"
                                                                     (BinaryNode (Add,e1,e2))
# 1006 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv120)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv121 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1016 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1020 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)) : 'freshtv124)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv129 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1029 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1033 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AndToken ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | DifferentToken ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | EqualToken ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | GreaterEqualToken ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | GreaterToken ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | LesserEqualToken ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | LesserToken ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | OrToken ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | AssignToken | DoToken | DoneToken | EOF | ElseToken | InToken | RightParenthesisToken | SequenceToken | ThenToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv125 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1067 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1071 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : (
# 49 "parser.mly"
      (Ast.ast)
# 1076 "parser.ml"
            ))), _, (e2 : (
# 49 "parser.mly"
      (Ast.ast)
# 1080 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 1086 "parser.ml"
            ) = 
# 107 "parser.mly"
                                                                     (BinaryNode (Or,e1,e2))
# 1090 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv126)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv127 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1100 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1104 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)) : 'freshtv130)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv135 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1113 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1117 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | AndToken | AssignToken | DifferentToken | DoToken | DoneToken | EOF | ElseToken | EqualToken | GreaterEqualToken | GreaterToken | InToken | LesserEqualToken | LesserToken | MinusToken | OrToken | PlusToken | RightParenthesisToken | SequenceToken | ThenToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv131 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1131 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1135 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : (
# 49 "parser.mly"
      (Ast.ast)
# 1140 "parser.ml"
            ))), _, (e2 : (
# 49 "parser.mly"
      (Ast.ast)
# 1144 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 1150 "parser.ml"
            ) = 
# 109 "parser.mly"
                                                                     (BinaryNode (Substract,e1,e2))
# 1154 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv132)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv133 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1164 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1168 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)) : 'freshtv136)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv141 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1177 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1181 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | AndToken | AssignToken | DifferentToken | DoToken | DoneToken | EOF | ElseToken | EqualToken | InToken | OrToken | RightParenthesisToken | SequenceToken | ThenToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv137 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1199 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1203 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : (
# 49 "parser.mly"
      (Ast.ast)
# 1208 "parser.ml"
            ))), _, (e2 : (
# 49 "parser.mly"
      (Ast.ast)
# 1212 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 1218 "parser.ml"
            ) = 
# 102 "parser.mly"
                                                                     (BinaryNode (Lesser,e1,e2))
# 1222 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv138)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv139 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1232 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1236 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)) : 'freshtv142)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv147 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1245 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1249 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | AndToken | AssignToken | DifferentToken | DoToken | DoneToken | EOF | ElseToken | EqualToken | InToken | OrToken | RightParenthesisToken | SequenceToken | ThenToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv143 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1267 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1271 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : (
# 49 "parser.mly"
      (Ast.ast)
# 1276 "parser.ml"
            ))), _, (e2 : (
# 49 "parser.mly"
      (Ast.ast)
# 1280 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 1286 "parser.ml"
            ) = 
# 104 "parser.mly"
                                                                     (BinaryNode (LesserEqual,e1,e2))
# 1290 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv144)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv145 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1300 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1304 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)) : 'freshtv148)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv153 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1313 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1317 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | AndToken | AssignToken | DifferentToken | DoToken | DoneToken | EOF | ElseToken | EqualToken | InToken | OrToken | RightParenthesisToken | SequenceToken | ThenToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv149 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1335 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1339 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : (
# 49 "parser.mly"
      (Ast.ast)
# 1344 "parser.ml"
            ))), _, (e2 : (
# 49 "parser.mly"
      (Ast.ast)
# 1348 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 1354 "parser.ml"
            ) = 
# 103 "parser.mly"
                                                                     (BinaryNode (Greater,e1,e2))
# 1358 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv150)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv151 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1368 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1372 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)) : 'freshtv154)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv159 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1381 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1385 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | AndToken | AssignToken | DifferentToken | DoToken | DoneToken | EOF | ElseToken | EqualToken | InToken | OrToken | RightParenthesisToken | SequenceToken | ThenToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv155 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1403 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1407 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : (
# 49 "parser.mly"
      (Ast.ast)
# 1412 "parser.ml"
            ))), _, (e2 : (
# 49 "parser.mly"
      (Ast.ast)
# 1416 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 1422 "parser.ml"
            ) = 
# 105 "parser.mly"
                                                                     (BinaryNode (GreaterEqual,e1,e2))
# 1426 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv156)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv157 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1436 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1440 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)) : 'freshtv160)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv165 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1449 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1453 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | GreaterEqualToken ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | GreaterToken ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | LesserEqualToken ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | LesserToken ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | AndToken | AssignToken | DifferentToken | DoToken | DoneToken | EOF | ElseToken | EqualToken | InToken | OrToken | RightParenthesisToken | SequenceToken | ThenToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv161 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1479 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1483 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : (
# 49 "parser.mly"
      (Ast.ast)
# 1488 "parser.ml"
            ))), _, (e2 : (
# 49 "parser.mly"
      (Ast.ast)
# 1492 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 1498 "parser.ml"
            ) = 
# 100 "parser.mly"
                                                                     (BinaryNode (Equal,e1,e2))
# 1502 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv162)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv163 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1512 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1516 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)) : 'freshtv166)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv171 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1525 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1529 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | GreaterEqualToken ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | GreaterToken ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | LesserEqualToken ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | LesserToken ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | AndToken | AssignToken | DifferentToken | DoToken | DoneToken | EOF | ElseToken | EqualToken | InToken | OrToken | RightParenthesisToken | SequenceToken | ThenToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv167 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1555 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1559 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : (
# 49 "parser.mly"
      (Ast.ast)
# 1564 "parser.ml"
            ))), _, (e2 : (
# 49 "parser.mly"
      (Ast.ast)
# 1568 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 1574 "parser.ml"
            ) = 
# 101 "parser.mly"
                                                                     (BinaryNode (Different,e1,e2))
# 1578 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv168)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv169 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1588 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1592 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)) : 'freshtv172)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv177 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1601 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1605 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AndToken ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | DifferentToken ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | EqualToken ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | GreaterEqualToken ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | GreaterToken ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | LesserEqualToken ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | LesserToken ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | AssignToken | DoToken | DoneToken | EOF | ElseToken | InToken | OrToken | RightParenthesisToken | SequenceToken | ThenToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv173 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1637 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1641 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : (
# 49 "parser.mly"
      (Ast.ast)
# 1646 "parser.ml"
            ))), _, (e2 : (
# 49 "parser.mly"
      (Ast.ast)
# 1650 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 1656 "parser.ml"
            ) = 
# 106 "parser.mly"
                                                                     (BinaryNode (And,e1,e2))
# 1660 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv174)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv175 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1670 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1674 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)) : 'freshtv178)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv183 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1683 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1687 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AndToken ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | AssignToken ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | DifferentToken ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | EqualToken ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | GreaterEqualToken ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | GreaterToken ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | LesserEqualToken ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | LesserToken ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | OrToken ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | DoToken | DoneToken | EOF | ElseToken | InToken | RightParenthesisToken | SequenceToken | ThenToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv179 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1723 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1727 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (i : (
# 49 "parser.mly"
      (Ast.ast)
# 1732 "parser.ml"
            ))), _, (e : (
# 49 "parser.mly"
      (Ast.ast)
# 1736 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 1742 "parser.ml"
            ) = 
# 99 "parser.mly"
                                                                     (WriteNode(i,e))
# 1746 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv180)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv181 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1756 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1760 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)) : 'freshtv184)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv189 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1769 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AndToken ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | AssignToken ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | DifferentToken ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | EqualToken ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | GreaterEqualToken ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | GreaterToken ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | LesserEqualToken ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | LesserToken ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | OrToken ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SequenceToken ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | ThenToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv185 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1807 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DerefToken ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | FalseToken ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | FunctionToken ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | IdentToken _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | IfToken ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | LeftParenthesisToken ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | LetToken ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | MinusToken ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | NumberToken _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | RecToken ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | RefToken ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | TrueToken ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | WhileToken ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51) : 'freshtv186)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv187 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1849 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)) : 'freshtv190)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv195 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1858 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1862 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AndToken ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | AssignToken ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | DifferentToken ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | ElseToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv191 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1878 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1882 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DerefToken ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | FalseToken ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | FunctionToken ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | IdentToken _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
            | IfToken ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | LeftParenthesisToken ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | LetToken ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | MinusToken ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | NumberToken _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
            | RecToken ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | RefToken ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | TrueToken ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | WhileToken ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53) : 'freshtv192)
        | EqualToken ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | GreaterEqualToken ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | GreaterToken ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | LesserEqualToken ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | LesserToken ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | OrToken ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SequenceToken ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv193 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1946 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1950 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)) : 'freshtv196)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv201 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1959 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1963 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 1967 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AndToken ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | AssignToken ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | DifferentToken ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | EqualToken ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | GreaterEqualToken ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | GreaterToken ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | LesserEqualToken ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | LesserToken ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | OrToken ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SequenceToken ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | DoToken | DoneToken | EOF | ElseToken | InToken | RightParenthesisToken | ThenToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv197 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2005 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2009 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2013 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _, (c : (
# 49 "parser.mly"
      (Ast.ast)
# 2018 "parser.ml"
            ))), _, (t : (
# 49 "parser.mly"
      (Ast.ast)
# 2022 "parser.ml"
            ))), _, (e : (
# 49 "parser.mly"
      (Ast.ast)
# 2026 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 2034 "parser.ml"
            ) = 
# 91 "parser.mly"
                                                                     (IfthenelseNode (c,t,e))
# 2038 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv198)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv199 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2048 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2052 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2056 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)) : 'freshtv202)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv209 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2065 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AndToken ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | AssignToken ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | DifferentToken ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | EqualToken ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | GreaterEqualToken ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | GreaterToken ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | LesserEqualToken ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | LesserToken ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | OrToken ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | RightParenthesisToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv205 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2097 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DerefToken ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | FalseToken ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | FunctionToken ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | IdentToken _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
            | IfToken ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | LeftParenthesisToken ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | LetToken ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | MinusToken ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | NumberToken _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
            | RecToken ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | RefToken ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | TrueToken ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | WhileToken ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | AndToken | AssignToken | DifferentToken | DoToken | DoneToken | EOF | ElseToken | EqualToken | GreaterEqualToken | GreaterToken | InToken | LesserEqualToken | LesserToken | OrToken | PlusToken | RightParenthesisToken | SequenceToken | SlashToken | StarToken | ThenToken ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv203 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2133 "parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _, (e : (
# 49 "parser.mly"
      (Ast.ast)
# 2138 "parser.ml"
                ))) = _menhir_stack in
                let _3 = () in
                let _1 = () in
                let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 2145 "parser.ml"
                ) = 
# 95 "parser.mly"
                                                                     (e)
# 2149 "parser.ml"
                 in
                _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv204)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56) : 'freshtv206)
        | SequenceToken ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv207 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2169 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)) : 'freshtv210)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv215 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2178 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2182 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AndToken ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | AssignToken ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | DifferentToken ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | EqualToken ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | GreaterEqualToken ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | GreaterToken ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | LesserEqualToken ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | LesserToken ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | OrToken ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SequenceToken ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | DoToken | DoneToken | EOF | ElseToken | InToken | RightParenthesisToken | ThenToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv211 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2220 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2224 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (f : (
# 49 "parser.mly"
      (Ast.ast)
# 2229 "parser.ml"
            ))), _, (p : (
# 49 "parser.mly"
      (Ast.ast)
# 2233 "parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 2240 "parser.ml"
            ) = 
# 94 "parser.mly"
                                                                     (CallNode (f,p))
# 2244 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv212)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv213 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2254 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2258 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)) : 'freshtv216)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv221 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 2267 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2271 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AndToken ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | AssignToken ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | DifferentToken ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | EqualToken ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | GreaterEqualToken ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | GreaterToken ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | InToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv217 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 2293 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2297 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DerefToken ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | FalseToken ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | FunctionToken ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | IdentToken _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
            | IfToken ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | LeftParenthesisToken ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | LetToken ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | MinusToken ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | NumberToken _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
            | RecToken ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | RefToken ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | TrueToken ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | WhileToken ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59) : 'freshtv218)
        | LesserEqualToken ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | LesserToken ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | OrToken ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SequenceToken ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv219 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 2355 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2359 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)) : 'freshtv222)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv227 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 2368 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2372 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2376 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AndToken ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | AssignToken ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | DifferentToken ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | EqualToken ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | GreaterEqualToken ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | GreaterToken ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | LesserEqualToken ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | LesserToken ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | OrToken ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SequenceToken ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | DoToken | DoneToken | EOF | ElseToken | InToken | RightParenthesisToken | ThenToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv223 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 2414 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2418 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2422 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), (n : (
# 7 "parser.mly"
       (string)
# 2427 "parser.ml"
            ))), _, (e1 : (
# 49 "parser.mly"
      (Ast.ast)
# 2431 "parser.ml"
            ))), _, (e2 : (
# 49 "parser.mly"
      (Ast.ast)
# 2435 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 2443 "parser.ml"
            ) = 
# 89 "parser.mly"
                                                                     (LetNode (n,e1,e2))
# 2447 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv224)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv225 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 2457 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2461 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2465 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv226)) : 'freshtv228)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv231 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2474 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv229 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2480 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (e : (
# 49 "parser.mly"
      (Ast.ast)
# 2485 "parser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 2491 "parser.ml"
        ) = 
# 96 "parser.mly"
                                                                     (UnaryNode (Negation,e))
# 2495 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv230)) : 'freshtv232)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv237 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 2503 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2507 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AndToken ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | AssignToken ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | DifferentToken ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | EqualToken ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | GreaterEqualToken ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | GreaterToken ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | InToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv233 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 2529 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2533 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DerefToken ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | FalseToken ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | FunctionToken ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | IdentToken _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | IfToken ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | LeftParenthesisToken ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | LetToken ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | MinusToken ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | NumberToken _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | RecToken ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | RefToken ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | TrueToken ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | WhileToken ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63) : 'freshtv234)
        | LesserEqualToken ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | LesserToken ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | OrToken ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SequenceToken ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv235 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 2591 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2595 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)) : 'freshtv238)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv243 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 2604 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2608 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2612 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AndToken ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | AssignToken ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | DifferentToken ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | EqualToken ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | GreaterEqualToken ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | GreaterToken ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | LesserEqualToken ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | LesserToken ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | OrToken ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SequenceToken ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | DoToken | DoneToken | EOF | ElseToken | InToken | RightParenthesisToken | ThenToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv239 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 2650 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2654 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2658 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), (n : (
# 7 "parser.mly"
       (string)
# 2663 "parser.ml"
            ))), _, (e1 : (
# 49 "parser.mly"
      (Ast.ast)
# 2667 "parser.ml"
            ))), _, (e2 : (
# 49 "parser.mly"
      (Ast.ast)
# 2671 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 2679 "parser.ml"
            ) = 
# 90 "parser.mly"
                                                                     (LetrecNode (n,e1,e2))
# 2683 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv240)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv241 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 2693 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2697 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2701 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv242)) : 'freshtv244)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv247 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2710 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv245 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2716 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (e : (
# 49 "parser.mly"
      (Ast.ast)
# 2721 "parser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 2727 "parser.ml"
        ) = 
# 97 "parser.mly"
                                                                     (RefNode e)
# 2731 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv246)) : 'freshtv248)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv253 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2739 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AndToken ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | AssignToken ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | DifferentToken ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | DoToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv249 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2755 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DerefToken ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | FalseToken ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | FunctionToken ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | IdentToken _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
            | IfToken ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | LeftParenthesisToken ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | LetToken ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | MinusToken ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | NumberToken _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
            | RecToken ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | RefToken ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | TrueToken ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | WhileToken ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67) : 'freshtv250)
        | EqualToken ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | GreaterEqualToken ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | GreaterToken ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | LesserEqualToken ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | LesserToken ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | OrToken ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SequenceToken ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv251 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2819 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)) : 'freshtv254)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv261 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2828 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2832 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AndToken ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | AssignToken ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | DifferentToken ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | DoneToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv257 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2848 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2852 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv255 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2859 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2863 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (c : (
# 49 "parser.mly"
      (Ast.ast)
# 2868 "parser.ml"
            ))), _, (b : (
# 49 "parser.mly"
      (Ast.ast)
# 2872 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 2880 "parser.ml"
            ) = 
# 92 "parser.mly"
                                                          (WhileNode(c,b))
# 2884 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv256)) : 'freshtv258)
        | EqualToken ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | GreaterEqualToken ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | GreaterToken ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | LesserEqualToken ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | LesserToken ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | OrToken ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SequenceToken ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv259 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2916 "parser.ml"
            ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2920 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv260)) : 'freshtv262)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv275 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2929 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AndToken ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | AssignToken ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | DifferentToken ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv271 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2945 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv269 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 2951 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (a : (
# 49 "parser.mly"
      (Ast.ast)
# 2956 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 52 "parser.mly"
       (Ast.ast)
# 2962 "parser.ml"
            ) = 
# 85 "parser.mly"
                      (a)
# 2966 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv267) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 52 "parser.mly"
       (Ast.ast)
# 2974 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv265) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 52 "parser.mly"
       (Ast.ast)
# 2982 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv263) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 52 "parser.mly"
       (Ast.ast)
# 2990 "parser.ml"
            )) : (
# 52 "parser.mly"
       (Ast.ast)
# 2994 "parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv264)) : 'freshtv266)) : 'freshtv268)) : 'freshtv270)) : 'freshtv272)
        | EqualToken ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | GreaterEqualToken ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | GreaterToken ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | LesserEqualToken ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | LesserToken ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | MinusToken ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | OrToken ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PlusToken ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | SequenceToken ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | SlashToken ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | StarToken ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv273 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3026 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv274)) : 'freshtv276)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv35 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3039 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv37 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 3048 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3052 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv39 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 3061 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3065 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv41 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3074 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv43 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3083 "parser.ml"
        ))) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3087 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv45 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3096 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv47 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3105 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv49 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3114 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv51 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3123 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv53 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3132 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv55 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3141 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv57 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3150 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv59 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3159 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv61 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3168 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv63 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3177 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv65 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3186 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv67 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3195 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv69 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3204 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv71 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3213 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv73 * _menhir_state * (
# 49 "parser.mly"
      (Ast.ast)
# 3222 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv77 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 3236 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv79 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv83 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 3255 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv85 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv87 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 3269 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv89 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv91 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv94)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv33) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 3335 "parser.ml"
    ) = 
# 114 "parser.mly"
                                                                     (TrueNode)
# 3339 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv34)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IdentToken _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 7 "parser.mly"
       (string)
# 3392 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EqualToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv25 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 3403 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DerefToken ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | FalseToken ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | FunctionToken ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | IdentToken _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | IfToken ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | LeftParenthesisToken ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | LetToken ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | MinusToken ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | NumberToken _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | RecToken ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | RefToken ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | TrueToken ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | WhileToken ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6) : 'freshtv26)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv27 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 3445 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)) : 'freshtv30)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 6 "parser.mly"
       (int)
# 3460 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv23) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((i : (
# 6 "parser.mly"
       (int)
# 3470 "parser.ml"
    )) : (
# 6 "parser.mly"
       (int)
# 3474 "parser.ml"
    )) = _v in
    ((let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 3479 "parser.ml"
    ) = 
# 113 "parser.mly"
                                                                     (IntegerNode i)
# 3483 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv24)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IdentToken _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 7 "parser.mly"
       (string)
# 3536 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EqualToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv15 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 3547 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DerefToken ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | FalseToken ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | FunctionToken ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | IdentToken _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
            | IfToken ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | LeftParenthesisToken ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | LetToken ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | MinusToken ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | NumberToken _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
            | RecToken ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | RefToken ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | TrueToken ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | WhileToken ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11) : 'freshtv16)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv17 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 3589 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)) : 'freshtv20)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 7 "parser.mly"
       (string)
# 3678 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((n : (
# 7 "parser.mly"
       (string)
# 3688 "parser.ml"
    )) : (
# 7 "parser.mly"
       (string)
# 3692 "parser.ml"
    )) = _v in
    ((let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 3697 "parser.ml"
    ) = 
# 112 "parser.mly"
                                                                     (AccessNode n)
# 3701 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv14)

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IdentToken _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 7 "parser.mly"
       (string)
# 3717 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BodyToken ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv5 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 3728 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DerefToken ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | FalseToken ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | FunctionToken ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | IdentToken _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
            | IfToken ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | LeftParenthesisToken ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | LetToken ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | MinusToken ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | NumberToken _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
            | RecToken ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | RefToken ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | TrueToken ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | WhileToken ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17) : 'freshtv6)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv7 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 3770 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv8)) : 'freshtv10)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv11 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv12)

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 49 "parser.mly"
      (Ast.ast)
# 3792 "parser.ml"
    ) = 
# 115 "parser.mly"
                                                                     (FalseNode)
# 3796 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv4)

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19

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

and main : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 52 "parser.mly"
       (Ast.ast)
# 3852 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DerefToken ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FalseToken ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FunctionToken ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | IdentToken _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IfToken ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LeftParenthesisToken ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LetToken ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | MinusToken ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NumberToken _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | RecToken ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | RefToken ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | TrueToken ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | WhileToken ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 269 "<standard.mly>"
  

# 3905 "parser.ml"
