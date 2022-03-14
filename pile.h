#ifndef PILE_H_INCLUDED
#define PILE_H_INCLUDED

#include <stddef.h>

typedef struct pile_elem {
    int elem;
    struct pile_elem * suivant;
}* Pile;


void empiler(Pile *p, int val);

void depiler(Pile* p, int* res);

int sommet(Pile p);

void print_pile(Pile p);

#endif
