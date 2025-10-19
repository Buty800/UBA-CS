#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>

#include "../test-utils.h"
#include "Memoria.h"

int main() {
	/* Acá pueden realizar sus propias pruebas */

	char *s = "hola";
	char *a = strClone(s);
	printf(a);
	printf("\n");


	return 0;
}
