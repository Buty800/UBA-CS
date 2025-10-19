#include <stdio.h> 

void mayus(char* s){
    while(*s != '\0'){
        if(*s >= 'a' && *s <= 'z' ) *s += 'A' - 'a';
        s++;
    }
}

int main(){
    
    char s[] = "Hola";
    mayus(s);
    printf("%s", s);
    
    return 0;
}
