#include <sys/time.h>
#include <stdio.h>
#include <stdlib.h>

long usecs (){
  struct timeval t;

  gettimeofday(&t,NULL);
  return t.tv_sec*1000000+t.tv_usec;
}
