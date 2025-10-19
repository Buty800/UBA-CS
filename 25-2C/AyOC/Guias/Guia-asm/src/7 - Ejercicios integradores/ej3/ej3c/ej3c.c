#include "../ejs.h"

estadisticas_t* calcular_estadisticas(caso_t* arreglo_casos, int largo, uint32_t usuario_id){
    
    estadisticas_t *res = malloc(sizeof(estadisticas_t));
    res->cantidad_CLT = 0;
    res->cantidad_KDT = 0;
    res->cantidad_KSC = 0;
    res->cantidad_RBO = 0;
    res->cantidad_estado_0 = 0;
    res->cantidad_estado_1 = 0;
    res->cantidad_estado_2 = 0;


    for(int i = 0; i < largo; i++){
        caso_t actual = arreglo_casos[i];
        if(!usuario_id || actual.usuario->id == usuario_id){
            
            switch (actual.estado){
            case 0: res->cantidad_estado_0++; break;
            case 1: res->cantidad_estado_1++; break;
            case 2: res->cantidad_estado_2++; break;
            }

            if(!strcmp(actual.categoria,"CLT")) res->cantidad_CLT++;
            if(!strcmp(actual.categoria,"KDT")) res->cantidad_KDT++;
            if(!strcmp(actual.categoria,"KSC")) res->cantidad_KSC++;
            if(!strcmp(actual.categoria,"RBO")) res->cantidad_RBO++;



        }
    }

    return res;

}

