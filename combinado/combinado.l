%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
"AND"       { return AND; }
"OR"        { return OR; }
"NOT"       { return NOT; }
[ \t]       ;
[\n]        { return '\n'; }
[()+\-*/]   { return yytext[0]; }
.           { return yytext[0]; }

%%

int yywrap(void) {
    return 1;
}