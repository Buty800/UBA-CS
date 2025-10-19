#include "ej4b.h"

#include <string.h>

// OPCIONAL: implementar en C
void invocar_habilidad(void* carta_generica, char* habilidad) {
	if(!carta_generica) return;
	card_t* carta = carta_generica;
	for(int i = 0; i < carta->__dir_entries; i++){
		if(!strcmp(carta->__dir[i]->ability_name, habilidad)){
			ability_function_t *foo = carta->__dir[i]->ability_ptr;
			foo(carta_generica);
			return; 
		}
	}	
	invocar_habilidad(carta->__archetype, habilidad);

}
