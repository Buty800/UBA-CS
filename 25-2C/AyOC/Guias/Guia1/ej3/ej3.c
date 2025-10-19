#include <stdio.h>

int main()
{
  char a;
  int b;
  long double c;
  long d;

  printf("char: %lu \n", sizeof(a));
  printf("int: %lu \n", sizeof(b));
  printf("long double: %lu \n", sizeof(c));
  printf("long: %lu \n", sizeof(d));
  return 0;
}
