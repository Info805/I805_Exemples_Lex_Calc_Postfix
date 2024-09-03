%{
#include <stdio.h>
#include <stdlib.h>
%}

/* lex options */
%option noyywrap

/* définitions régulières */
sautLigne       \n|\r|\r\n
blanc           [ \t]   
sep             ({blanc}|{sautLigne})+
lettre          [a-zA-Z]
chiffre         [0-9]
id              {lettre}({lettre}|{chiffre})*
nbre            {chiffre}+(\.{chiffre}+)?(E[+\-]?{chiffre}+)?

%%
{sep}           { /* rien */ }
if|then|else    {printf("MR%s\n", yytext);}
{id}	        {printf("ID%s\n", yytext);}
{nbre}	        {printf("NBRE%s\n", yytext);}
"<"|"<="|">"|"<>"|"="   {printf("OPREL%s\n", yytext);}

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