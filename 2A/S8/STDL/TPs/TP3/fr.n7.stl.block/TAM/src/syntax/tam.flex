package asm;

import java_cup.runtime.*;
      
%%

%class Lex

%line
%column

%cup

%scanerror SyntaxicError

%{  
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}
COMM =   ;[^\n]*\n
SEPARATEUR = [\n\r\t ]+
CHAINE =  \"([^\"]|\\.)*\"
CAR =     \'([^\']|\\.)\'
NB =      \-?[0-9]+
IDENT =   [0-9a-zA-Z_\$@#:\.\?\%\<\>]+

%%
   
<YYINITIAL> {

    /** Keywords. */

    "LOAD"      { return symbol(sym.LOAD); }
    "LOADA"     { return symbol(sym.LOADA); }
    "LOADI"     { return symbol(sym.LOADI); }
    "LOADL"     { return symbol(sym.LOADL); }
    "STORE"     { return symbol(sym.STORE); }
    "STOREI"    { return symbol(sym.STOREI); }
    "CALL"      { return symbol(sym.CALL); }
    "CALLI"     { return symbol(sym.CALLI); }
    "RETURN"    { return symbol(sym.RETURN); }
    "SUBR"      { return symbol(sym.SUBR); }
    "PUSH"      { return symbol(sym.PUSH); }
    "POP"       { return symbol(sym.POP); }
    "JUMP"      { return symbol(sym.JUMP); }
    "JUMPI"     { return symbol(sym.JUMPI); }
    "JUMPIF"    { return symbol(sym.JUMPIF); }
    "HALT"      { return symbol(sym.HALT); }
     \[        {return symbol(sym.CRO);}  
     "]"                {return symbol(sym.CRF);}
    \(          {return symbol(sym.PARO);}
    ")"             {return symbol(sym.PARF);}


    {CHAINE}    { return symbol(sym.CHAINE, new String(yytext())); }
    {NB}        { return symbol(sym.NB, Integer.valueOf(yytext()));}
    {IDENT}     { return symbol(sym.IDENT, new String(yytext())); }
    {CAR}       { return symbol(sym.CAR, Character.valueOf(yytext().charAt(1))); }
    {SEPARATEUR} {/*Do Nothing*/}
    {COMM}       {/*Do Nothing*/}
  //  <<EOF>> { return symbol(sym.EOF); }

    /* error fallback */
    [^]         { throw new SyntaxicError("Line "+(yyline+1)+" : Illegal character <"+yytext()+">"); }
    }
