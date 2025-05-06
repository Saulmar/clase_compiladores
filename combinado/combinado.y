%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
int yyerror(char *s);
%}

%token NUMBER
%left AND OR
%right NOT
%left '+' '-'
%left '*' '/'

%%

input:
    expr '\n'   { printf("Expresión válida\n"); }
  | error '\n'  { yyerror("Expresión inválida"); yyerrok; }
  ;

expr:
    expr '+' term
  | expr '-' term
  | term
  ;

term:
    term '*' factor
  | term '/' factor
  | factor
  ;

factor:
    '(' expr ')'
  | logical
  | NUMBER
  ;

logical:
    logical AND logical_term
  | logical OR logical_term
  | logical_term
  ;

logical_term:
    NOT factor
  | factor
  ;

%%

int yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
    return 0;
}

int main(void) {
    return yyparse();
}

