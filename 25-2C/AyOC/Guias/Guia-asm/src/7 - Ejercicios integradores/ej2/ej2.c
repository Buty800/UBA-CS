#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "ej2.h"

/**
 * Marca el ejercicio 1A como hecho (`true`) o pendiente (`false`).
 *
 * Funciones a implementar:
 *   - es_indice_ordenado
 */
bool EJERCICIO_2A_HECHO = true;

/**
 * Marca el ejercicio 1B como hecho (`true`) o pendiente (`false`).
 *
 * Funciones a implementar:
 *   - contarCombustibleAsignado
 */
bool EJERCICIO_2B_HECHO = true;

/**
 * Marca el ejercicio 1B como hecho (`true`) o pendiente (`false`).
 *
 * Funciones a implementar:
 *   - modificarUnidad
 */
bool EJERCICIO_2C_HECHO = true;

/**
 * OPCIONAL: implementar en C
 */
void optimizar(mapa_t mapa, attackunit_t* compartida, uint32_t (*fun_hash)(attackunit_t*)) {
    
    uint32_t hash_objetivo = fun_hash(compartida);

    for (int i = 0; i < 255; i++) {
        for (int j = 0; j < 255; j++) {
            attackunit_t* actual = mapa[i][j];
            if (!actual) continue;
            if (fun_hash(actual) == hash_objetivo) {
                compartida->references++;
                mapa[i][j]->references--;
                if(!mapa[i][j]->references) free(mapa[i][j]);
                mapa[i][j] = compartida;  // apuntar a la compartida
            }
        }
    }
}

/**
 * OPCIONAL: implementar en C
 */
uint32_t contarCombustibleAsignado(mapa_t mapa, uint16_t (*fun_combustible)(char*)) {
    uint32_t res = 0;
    
    for(uint16_t i = 0; i < 255; i++){
        for(uint16_t j = 0; j < 255; j++){
            if(mapa[i][j]){
                res += mapa[i][j]->combustible - fun_combustible(mapa[i][j]->clase);
            }
        }
    }
    return res;
}

/**
 * OPCIONAL: implementar en C
 */
void modificarUnidad(mapa_t mapa, uint8_t x, uint8_t y, void (*fun_modificar)(attackunit_t*)) {
    attackunit_t* mod = mapa[x][y];
    
    if(!mod) return;
    if(mod->references > 1){
        mod->references--;
        mapa[x][y] = malloc(16);
        *mapa[x][y] = *mod;
        mapa[x][y]->references = 1;
    }
    fun_modificar(mapa[x][y]);


}

