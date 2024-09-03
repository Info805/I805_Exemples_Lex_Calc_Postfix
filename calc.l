
%{
#include "pile.h"
#include <stdio.h>
#include <stdlib.h>

Pile p = NULL;
int op1, op2;

%}

%option noyywrap
/* definitions regulieres */

uint    ([1-9][0-9]*)|0
entier  (\+|-)?{uint}
espace  [ \t\r\n]

%%
  /* regles lexicales */
{entier}    { empiler(&p, atoi(yytext)); }
"+"         { depiler(&p, &op1); depiler(&p, &op2); empiler(&p, op1 + op2); }
"*"         { depiler(&p, &op1); depiler(&p, &op2); empiler(&p, op1 * op2); }
"-"         { depiler(&p, &op1); depiler(&p, &op2); empiler(&p, op2 - op1); }
"/"         { depiler(&p, &op1); depiler(&p, &op2); empiler(&p, op2 / op1); }
"n"         { depiler(&p, &op1); empiler(&p, -op1); }
"="         { printf("--> %d\n", sommet(p)); }
{espace}    { /* rien */ }
.           { printf("caractere imprevu : %c, %i\n", yytext[0], yytext[0]); }

%%

void main() {
    yylex();
}