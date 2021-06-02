type typing_env
val empty_env: typing_env
val decl_var_type: Ast.base_type -> typing_env -> (Name.t * Location.t) -> typing_env 
val vars_of_env: typing_env -> Ast.VarSet.t
val type_expr: typing_env -> Ast.base_type -> Ast.uexpr -> Ast.expr
val type_stm:  typing_env -> Ast.ustm -> Ast.stm
