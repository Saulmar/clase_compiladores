%{
#include "parser.tab.h" 
#include <string.h> 
#include <stdlib.h> 
%}
%%
"int"                       { return INT; } 
[a-zA-Z_][a-zA-Z0-9_]*      { yylval.str = strdup(yytext); return ID; } 
";"                         { return PUNTOYCOMA; } 
"{"                         { return LLAVEIZQ; } 
"}"                         { return LLAVEDER; } 
[\n\t\r ]+                        ; 
.                           { return yytext[0]; }
%%