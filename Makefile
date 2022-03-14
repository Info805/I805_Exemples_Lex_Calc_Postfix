.PHONY: all clean 

all : calc

lex.yy.c: calc.l
	lex calc.l

pile.o: pile.c pile.h
	cc -c -o pile.o pile.c

calc.o: lex.yy.c pile.h
	cc -c -o calc.o lex.yy.c

calc: pile.o calc.o
	cc -o calc calc.o pile.o 

clean: 
	rm -f calc *.o lex.yy.c