%{
#include <stdio.h>
#include <stdlib.h>

int minis=0, majus=0, autres=0, blancs=0;
%}

/* lex options */
%option noyywrap

%%

[a-z]   {minis++;}
[A-Z]   {majus++;}
[\ ]    {blancs++;}
\n      {}
.       {autres++;}

%%
/* code c additionnel */

int main (int argc, char* argv[]){
    if (argc > 1){
        yyin = fopen(argv[1], "r");
    } else {
        yyin = stdin;
    }
    yylex();
    printf("Minuscules : %d Majuscules : %d Autre : %d Blancs : %d\n", 
        minis, majus, autres,blancs);
    
    return EXIT_SUCCESS;
}