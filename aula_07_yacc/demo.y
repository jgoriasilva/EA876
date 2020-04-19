%{
#include <stdio.h>
void yyerror(char *c);
int yylex(void);
%}

%token N OP EOL
%left OP

%%

S:
	S E EOL {printf("O valor final eh %d\n", $2);}
  |
	;

E:
	N {$$ = $1; printf("Encontrei um numero: %d\n", $$);}
	| E OP2 E
	| E OP E {$$ = $1 + $3; printf("Resolvi %d + %d = %d\n", $1, $3, $$);}
	;
	

%%

void yyerror(char *c){
	printf("Erro: %s\n", c);
}

int main(){
	yyparse();
	return 0;
}

