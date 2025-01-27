    /* calculator #1 */
%{
    #include "y.tab.h"
    #include <stdlib.h>
    void yyerror(char *);
%}

%%

[a-z]       {
                yylval = *yytext - 'a';
                return VARIABLE;
                }

[0-9]+      {
                yylval = atoi(yytext);
                return INTEGER;
            }

[-+()=/*\n]     { return *yytext; }

[ \t\r]   ;       /* skip whitespace */

.               {
                    printf("Unknown character: %d\n", *yytext);
                    yyerror("Unknown character");
                }

%%

int yywrap(void) {
    return 1;
}
