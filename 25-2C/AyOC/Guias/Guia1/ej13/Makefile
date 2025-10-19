CFLAGS = -Wall -Wextra -pedantic

all: ej13 
ej13: ej13.o
	gcc $(CFLAGS) ej13.o -o ej13

ej13.o: ej13.c
	gcc $(CFLAGS) -c ej13.c -o ej13.o

clean:
	rm *.o ej13  

.PHONY: all clean
