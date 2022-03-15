# Exemple de calculette en [notation postfixée](https://fr.wikipedia.org/wiki/Notation_polonaise_inverse)

La calculette utilise le générateur d'analyseur lexical 
[GNU Flex](https://fr.wikipedia.org/wiki/Flex_(logiciel)).

La calculette fonctionne de façon simple, en utilisant une pile : 
- quand un entier est reconnu, il est ajouté dans la pile
- quand un opérateur est reconnu, il est appliqué sur 
  les éléments qui sont au sommet de la pile puis ceux-ci sont 
  remplacés par le résultat de l'opération. 
- quand le flux d'entrée se termine, la pile est affichée.

La [spécification flex](https://westes.github.io/flex/manual/) est dans [calc.l](calc.l).


## Construction du projet

Pour construire le projet (nécessite l'installation de préalable flex, make et d'un compilateur c), 
aller dans le dossier du projet puis exécuter la commande `make`. 

Flex génère alors, à partir du fichier de spécification [`calc.l`](calc.l), 
le fichier c `lex.yy.c` qui contient l'automate à états finis déterministe 
correspondant à l'analyseur lexical.

Ce fichier est alors utilisé pour générer l'exécutable `calc` 
correspondant à la calculette en 
[notation postfixée](https://fr.wikipedia.org/wiki/Notation_polonaise_inverse).

## Construction image docker

Si vous disposez de docker, un fichier [Dockerfile](Dockerfile) 
permet de construire une image docker et de faire tourner 
la calculette dans un container.

### Construction image : 

```bash
docker build -t stalb/calc:lex .
```

### Utilisation image : 

```bash
docker run --rm -it stalb/calc:lex
```