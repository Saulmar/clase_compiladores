%{
#include "y.tab.h"
%}

%%

"AND"     { return AND; }
"OR"      { return OR; }
"NOT"     { return NOT; }

[01]    { return BOOLEAN; }

[ \t]     ; 
\n        { return '\n'; }
"("       { return '('; }
")"       { return ')'; }

.         { return yytext[0]; } 

%%

int yywrap() {
    return 1;
}
