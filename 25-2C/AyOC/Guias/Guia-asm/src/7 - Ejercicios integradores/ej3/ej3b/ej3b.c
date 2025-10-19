#include "../ejs.h"

void resolver_automaticamente(funcionCierraCasos_t* funcion, caso_t* arreglo_casos, caso_t* casos_a_revisar, int largo){
    int rev = 0;
    for(int i = 0; i < largo; i++){
        int lvl = arreglo_casos[i].usuario->nivel;
        if(lvl == 1 || lvl == 2){
            if(funcion(&arreglo_casos[i])){
                arreglo_casos[i].estado = 1;
                continue;
            }
            if(!strcmp(arreglo_casos[i].categoria,"CLT") || !strcmp(arreglo_casos[i].categoria,"RBO")){
                arreglo_casos[i].estado = 2;
                continue;
            }   
        }
        casos_a_revisar[rev++] = arreglo_casos[i];
    }

}

