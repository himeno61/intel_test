#include <stdio.h>
#include "f.h"
int main (int argc, char *argv[])
{
  if(argc<2)
  {
    printf("ARG missing\n");
    return 0;
  }

  printf("wynik fcji:%d",  f(argv[1]));
  printf("\n");
  return 0;
}