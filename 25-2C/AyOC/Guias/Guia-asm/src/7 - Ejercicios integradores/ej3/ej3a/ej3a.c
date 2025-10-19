#include "../ejs.h"

// Función auxiliar para contar casos por nivel
void contar_casos_por_nivel(caso_t* arreglo_casos, int largo, int* contadores) {
    for(int i = 0; i < largo; i++){
        int lvl = arreglo_casos[i].usuario->nivel;
        contadores[lvl]+=sizeof(caso_t);
    }
}


segmentacion_t* segmentar_casos(caso_t* arreglo_casos, int largo) {
    int contadores[] = {0 , 0 , 0};
    contar_casos_por_nivel(arreglo_casos,largo,contadores);


    segmentacion_t *res = malloc(sizeof(segmentacion_t));
    
    if(contadores[0]) res->casos_nivel_0 = malloc(contadores[0]);
    else res->casos_nivel_0 = NULL;
    if(contadores[1]) res->casos_nivel_1 = malloc(contadores[1]);
    else res->casos_nivel_1 = NULL;
    if(contadores[2]) res->casos_nivel_2 = malloc(contadores[2]);
    else res->casos_nivel_2 = NULL;
    /*
    contadores[0]=0;
    contadores[1]=0;
    contadores[2]=0;
    

    /*
    for(int i = 0; i < largo; i++){
        char lvl = arreglo_casos[i].usuario->nivel;
        int j = contadores[lvl];
        contadores[lvl]++;
        switch (lvl){
            case 0: res->casos_nivel_0[j] = arreglo_casos[i]; break;
            case 1: res->casos_nivel_1[j] = arreglo_casos[i]; break;
            case 2: res->casos_nivel_2[j] = arreglo_casos[i]; break;
        }
    }*/

    return res;

}



