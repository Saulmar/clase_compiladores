%{
#include <stdio.h>
#include <stdlib.h>
int yyerror(char *s);
int yylex();
%}

%token AND OR NOT BOOLEAN
%left AND OR
%right NOT

%%

input:
      /* vacío */
    | input line
    ;

line:
      expr '\n'   { printf("Expresión lógica válida\n"); }
    | error '\n'  { yyerror("Expresión lógica inválida"); yyerrok; }
    ;

expr:
      expr AND term
    | expr OR term
    | term
    ;
    
term:
      NOT factor
    | factor
    ;

factor:
      '(' expr ')'
    | BOOLEAN
    ;

%%

int yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
    return 0;
}

int main() {
    return yyparse();
}
