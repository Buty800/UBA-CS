#include <stdio.h>
#include <stdint.h>

int main(){
  uint32_t n1 = 0xA0340000;
  uint32_t n2 = 0x0120000A;

  printf((n1 >> 28) == (n2 & 0xF)? "iguales" : "distintos");
  printf("\n %x %x \n", n1 >> 28, n2 & 0xF);

  return 0;
}
