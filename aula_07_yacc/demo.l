%{

#include <stdlib.h>
#include "y.tab.h"

void yyerror(char *c);

%}

%%

[0-9]+ {
				yylval = atoi(yytext);
				return N;
			 }

\n { return EOL; }

\+ { return OP; }

[[:space:]]+ ;
 
. { yyerror("Token desconhecido\n"); }

%%

int yywrap(){
	return 1;
}
