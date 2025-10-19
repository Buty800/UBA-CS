#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>

#include "../test-utils.h"
#include "ABI.h"

int main() {
	/* Acá pueden realizar sus propias pruebas */
	assert(alternate_sum_4_using_c(8, 2, 5, 1) == 10);

	assert(alternate_sum_4_using_c_alternative(8, 2, 5, 1) == 10);

	assert(alternate_sum_8(1,1,1,1,1,1,2,1) == 1);
	assert(alternate_sum_8(2,3,4,3,1,-4,2,7) == 0);

	uint32_t a;
	product_2_f(&a, 2, 2.5);
	assert(a == 5);
	product_2_f(&a, 2, 3.3);
	assert(a == 6); 

	double d;
	product_9_f(&d,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2);
	assert(d == 262144);
	product_9_f(&d,2,2,2,2,2,2,2,2,2,2,2,3,2,2,3,2,2,3);
	assert(d == 884736);

	printf("all good");
	printf("\n");
	

	return 0;
}
