%{
#include <stdio.h>
#include <stdlib.h>

/* On désire compter le nb de "a" et "e" */
int nbA = 0, nbE = 0;  
%}

/* lex options */
%option noyywrap

/* definitions regulieres */
a    a|A|à|â|ä|Â|Ä|À
e    e|E|é|è|ê|ë|È|Ê|É

%%

  /* ------------------------Section des Regles Lexicales----------------------*/

{a} 	{nbA++; printf("%s(%d)", yytext, nbA);}
{e} 	{nbE++; printf("%s(%d)", yytext, nbE);}
.       {printf(yytext); }

%%
/* code c additionnel */

int main (int argc, char* argv[]){
    if (argc > 1){
        yyin = fopen(argv[1], "r");
    } else {
        yyin = stdin;
    }
    yylex();
    return EXIT_SUCCESS;
}