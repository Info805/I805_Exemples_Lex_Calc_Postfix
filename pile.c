#include <stdio.h>
#include <malloc.h>
#include "pile.h"

/*
    Procedure pour ajouter un element dans une pile.

    Parametre :
      entree : val la valeur a ajouter
      entree/sortie : *p la pile a modifier

    Resultat : rien

*/
void empiler(Pile *p, int val){
    Pile nvp = (Pile)malloc(sizeof(Pile*));
    nvp->elem = val;
    nvp->suivant = *p;
    *p = nvp;
}

/*
    Procedure pour depiler un element dans une pile.
    Si la pile est vide la valeur renvoyee pour le sommet de pile est indefinie.

    Parametre :
      entree/sortie : *p la pile a modifier
      sortie : *val l'ancien sommet de pile

    Resultat : rien

*/
void depiler(Pile* p, int* val){
    Pile temp;
    if (*p != NULL){
        *val = (*p)->elem;
        temp = *p;
        *p = (*p)->suivant;
        free(temp);
    } else {
        *val = 0;
    }
}

/*
    Fonction pour obtenir l'element dau sommet de pile.
    Si la pile est vide le resultat est indefini.

    Parametre :
      entree : p la pile

    Resultat : l'actuel sommet pile

*/
int sommet(Pile p){
    int res = 0;
    if (p != NULL) res = p->elem;
    return res;
}

/*
    Affichage d'une pile.

    Le contenu de la pile est affiche de gauche a droite
    (bas de pile a gauche haut de pile a droite).

    Parametre :
      entree : p la pile

    Resultat : rien
*/
void print_pile(Pile p){
    if (p != NULL) {
        print_pile(p->suivant);
        printf("%2d ", p->elem);
    }
}
