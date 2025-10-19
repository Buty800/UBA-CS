CFLAGS = -Wall -Wextra -pedantic

all: ej9
ej9: ej9.o
	gcc $(CFLAGS) ej9.o -o ej9

ej9.o: ej9.c
	gcc $(CFLAGS) -c ej9.c -o ej9.o

clean:
	rm *.o ej9 

.PHONY: all clean
