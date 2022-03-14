%{
#include "pile.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

Pile p;
int op1, op2;
%}

%option noyywrap

espace      [[:space:]]+
chiffre     [0-9]
entier      (\+|-)?{chiffre}+

%%

"="			{ printf("--> %d\n", sommet(p)); }
"+"			{ depiler(&p, &op2); depiler(&p, &op1); empiler(&p, op1 + op2); }
"-"			{ depiler(&p, &op2); depiler(&p, &op1); empiler(&p, op1 - op2); }
"/"			{ depiler(&p, &op2); depiler(&p, &op1); empiler(&p, op1 / op2); }
"*"			{ depiler(&p, &op2); depiler(&p, &op1); empiler(&p, op1 * op2); }
"n"			{ depiler(&p, &op1); empiler(&p, - op1);  /* moins unaire */    }
{entier}	{ empiler(&p, atoi(yytext));     }
{espace} 	{ /* espace : pas d'action */    }
.			{ printf("caractere imprevu : %c, %i \n", yytext[0], yytext[0]);}

%%

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