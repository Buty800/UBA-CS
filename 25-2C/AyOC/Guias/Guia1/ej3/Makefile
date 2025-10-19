CFLAGS = -Wall -Wextra -pedantic

all: ej3
ej3: ej3.o
	gcc $(CFLAGS) ej3.o -o ej3

ej3.o: ej3.c
	gcc $(CFLAGS) -c ej3.c -o ej3.o

clean:
	rm *.o ej3 

.PHONY: all clean
