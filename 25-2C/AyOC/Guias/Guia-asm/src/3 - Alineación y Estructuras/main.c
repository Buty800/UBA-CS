#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>

#include "../test-utils.h"
#include "Estructuras.h"

int main() {
	/* Acá pueden realizar sus propias pruebas */

	packed_nodo_t n2 = {NULL, 0, NULL, 1024};
	packed_nodo_t n1 = {&n2, 0, NULL, 3};
	packed_lista_t e = {&n1};

	cantidad_total_de_elementos_packed(&e);
	return 0;
}
