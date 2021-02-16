#include <string.h>
#include <stdio.h>

long t_zero;

#define MAXEVENTS 10000
#define MAXTHREADS 48

long usecs ();


typedef struct event_struct{
  int type;
  long t_start, t_stop;
} Event;


void trace_init();
void trace_event_start(int type);
void trace_event_stop(int type);
void trace_dump(char *);

