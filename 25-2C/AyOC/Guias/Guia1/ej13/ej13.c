#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define Tiradas 6000000

int nums[6];

int main(){
  srand(time(NULL));

  for(int t = 0; t < Tiradas; t++){
    int n = rand()%6;
    nums[n]++;
  }

  for (int i = 0; i < 6; i++){
    double prcnt = ((double) nums[i])/Tiradas;   
    printf("%d : %f\n",i+1,100*prcnt);
  }
  return 0;
}
