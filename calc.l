/* code a ajouter dans les declarations c */
%{
#include "pile.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

Pile p;
int op1, op2;
%}

/* lex options */
%option noyywrap

/* definitions regulieres */

uint    ([1-9][0-9]*)|0
entier  (\+|-)?{uint}
espaces [ \t\n\r]+

%%

/* ------------------------Section des Regles Lexicales----------------------*/

"-"       { depiler(&p, &op2); depiler(&p, &op1); empiler(&p, op1 - op2); }
"+"       { depiler(&p, &op2); depiler(&p, &op1); empiler(&p, op1 + op2); }
"*"       { depiler(&p, &op2); depiler(&p, &op1); empiler(&p, op1 * op2); }
"/"       { depiler(&p, &op2); depiler(&p, &op1); empiler(&p, op1 / op2); }
"n"       { depiler(&p, &op1); empiler(&p, -op1 ); }
"="       { printf("--> %d\n", sommet(p)); }
{entier}  { empiler(&p, atoi(yytext)); }
{espaces} { /* espace rien a faire */ }
.         { printf("caractere imprevu : % c, %i \n", yytext[0], yytext[0]); }

%%
/* code c additionnel */

int main (int argc, char* argv[]){
    if (argc > 1){
        yyin = fopen(argv[1], "r");
    } else {
        yyin = stdin;
    }
    yylex();
    printf("pile: ");
    print_pile(p);
    printf("\n");
    return EXIT_SUCCESS;
}