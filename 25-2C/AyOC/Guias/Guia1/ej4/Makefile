CFLAGS = -Wall -Wextra -pedantic

all: ej4
ej4: ej4.o
	gcc $(CFLAGS) ej4.o -o ej4

ej4.o: ej4.c
	gcc $(CFLAGS) -c ej4.c -o ej4.o

clean:
	rm *.o ej4 

.PHONY: all clean
