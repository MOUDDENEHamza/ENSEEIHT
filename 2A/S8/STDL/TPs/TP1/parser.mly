%{
open Ast
%}


%token <int> NumberToken
%token <string> IdentToken
%token FunctionToken
%token BodyToken
%token IfToken
%token ThenToken
%token ElseToken
%token LetToken
%token InToken
%token TrueToken
%token FalseToken
%token RecToken
%token LeftParenthesisToken
%token RightParenthesisToken
%token EOF
%token SequenceToken, AssignToken, OrToken, AndToken, DifferentToken, EqualToken
%token LesserToken, GreaterToken, LesserEqualToken, GreaterEqualToken
%token PlusToken, MinusToken
%token StarToken, SlashToken
%token RefToken, DerefToken
%token UMinusToken NotToken

(* priorité et associativité *)
(* Plus faible priorité au début *)
(* http://caml.inria.fr/pub/docs/manual-ocaml/expr.html#sec116 *)
%nonassoc BodyToken, ElseToken, InToken, RightParenthesisToken
%right SequenceToken
(* %nonassoc IfToken *)
%right AssignToken
%right OrToken
%right AndToken
%left DifferentToken, EqualToken
%nonassoc LesserToken, GreaterToken, LesserEqualToken, GreaterEqualToken
%left PlusToken, MinusToken
%left StarToken, SlashToken
%right RefToken, DerefToken, UMinusToken, NotToken



(* Type de l'attribut synthétisé des non-terminaux *)
%type <Ast.ast> expr

(* Type et définition de l'axiome *)
%start <Ast.ast> main

%%
(*
La grammaire n'est pas LR , on joue avec les priorités

  E -> fun ident -> E
  E -> let ident = E in E
  E -> letrec ident = E in E
  E -> if E then E else E
  E -> E ; E
  E -> (E) E
  E -> (E)
  E -> - E
  E -> not E
  E -> ref E
  E -> ! E
  E -> E := E
  E -> E = E
  E -> E != E
  E -> E >= E
  E -> E > E
  E -> E <= E
  E -> E < E
  E -> E & E
  E -> E | E
  E -> E * E
  E -> E / E
  E -> E - E
  E -> E + E
  E -> Ident
  E -> Const

*)
main : a = expr EOF   {a}

expr :
| FunctionToken n = IdentToken BodyToken e = expr                    {FunctionNode (n,e)}
| LetToken n = IdentToken EqualToken e1 = expr InToken e2 = expr     {LetNode (n,e1,e2)}
| RecToken n = IdentToken EqualToken e1 = expr InToken e2 = expr     {LetrecNode (n,e1,e2)}
| IfToken c= expr ThenToken t = expr ElseToken e = expr              {IfthenelseNode (c,t,e)}
| e = expr SequenceToken p = expr                                    {SequenceNode(e,p)}
| LeftParenthesisToken f = expr RightParenthesisToken  p =expr       {CallNode (f,p)}
| LeftParenthesisToken e = expr RightParenthesisToken                {e}
| MinusToken  e = expr            %prec UMinusToken                  {UnaryNode (Opposite,e)}
| NotToken e = expr                                                  {UnaryNode (Negation,e)}
| RefToken e = expr                                                  {RefNode e}
| DerefToken e = expr                                                {ReadNode e}
| i = expr AssignToken e = expr                                      {WriteNode(i,e)}
| e1 = expr EqualToken e2 = expr                                     {BinaryNode (Equal,e1,e2)}
| e1 = expr DifferentToken e2 = expr                                 {BinaryNode (Different,e1,e2)}
| e1 = expr LesserToken e2 = expr                                    {BinaryNode (Lesser,e1,e2)}
| e1 = expr GreaterToken e2 = expr                                   {BinaryNode (Greater,e1,e2)}
| e1 = expr LesserEqualToken e2 = expr                               {BinaryNode (LesserEqual,e1,e2)}
| e1 = expr GreaterEqualToken e2 = expr                              {BinaryNode (GreaterEqual,e1,e2)}
| e1 = expr AndToken e2 = expr                                       {BinaryNode (And,e1,e2)}
| e1 = expr OrToken e2 = expr                                        {BinaryNode (Or,e1,e2)}
| e1 = expr PlusToken e2 = expr                                      {BinaryNode (Add,e1,e2)}
| e1 = expr MinusToken e2 = expr                                     {BinaryNode (Substract,e1,e2)}
| e1 = expr StarToken e2 = expr                                      {BinaryNode (Multiply,e1,e2)}
| e1 = expr SlashToken e2 = expr                                     {BinaryNode (Divide,e1,e2)}
| n = IdentToken                                                     {AccessNode n}
| i = NumberToken                                                    {IntegerNode i}
| TrueToken                                                          {TrueNode}
| FalseToken                                                         {FalseNode}
