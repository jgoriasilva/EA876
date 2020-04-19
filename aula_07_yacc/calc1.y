%{
#include <stdio.h>

void yyerror(char *c);
int yylex(void);

%}

%token INT SOMA SUB MULT DIV EOL
%left SOMA SUB MULT DIV

%%

PROGRAMA:
        PROGRAMA EXPRESSAO EOL { printf("Resultado: %d\n", $2); }
        |
        ;


EXPRESSAO:
    INT { $$ = $1;
          }

    | EXPRESSAO SOMA EXPRESSAO  {
        printf("Encontrei soma: %d + %d = %d\n", $1, $3, $1+$3);
        $$ = $1 + $3;
        }
    | EXPRESSAO SUB EXPRESSAO  {
        printf("Encontrei subtracao: %d - %d = %d\n", $1, $3, $1-$3);
        $$ = $1 - $3;
        }

    | EXPRESSAO MULT EXPRESSAO  {
        printf("Encontrei multiplicacao: %d * %d = %d\n", $1, $3, $1*$3);
        $$ = $1 * $3;
        }

    | EXPRESSAO DIV EXPRESSAO  {
        printf("Encontrei divisao: %d / %d = %d\n", $1, $3, $1/$3);
        $$ = $1 / $3;
        }
		;

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
  yyparse();
  return 0;

}
