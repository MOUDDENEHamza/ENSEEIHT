#include "trace.h"
#include <omp.h>


Event events[MAXTHREADS][MAXEVENTS];
int nevents[MAXTHREADS];


void trace_init(){
  int i;

#pragma omp master
  {
    /* strcpy(colors[0], "#d38d5f"); */
    /* strcpy(colors[1], "#ffdd55"); */
    /* strcpy(colors[2], "#8dd35f"); */
    /* strcpy(colors[3], "#80b3ff"); */
    /* strcpy(colors[4], "#e580ff"); */
    
    for(i=0; i<MAXTHREADS; i++)
      nevents[i]=0;
    
    t_zero = usecs();
  }
  return;
}


void trace_event_start(int type){
  int iam;
  iam = omp_get_thread_num();
  (events[iam][nevents[iam]]).t_start = usecs();
  (events[iam][nevents[iam]]).type = type;

  return;
}


void trace_event_stop(int type){
  int iam;
  iam = omp_get_thread_num();

  (events[iam][nevents[iam]]).t_stop = usecs();
  nevents[iam] +=1;

  return;
}


void trace_dump(char *fname){

  int t, e, i, nth;
  long offs, t_stop;
  Event ev;
  FILE * pFile;
  char *colors[] = { "#d38d5f", "#ffdd55", "#8dd35f", "#80b3ff", "#e580ff"};
  double scale_x, scale_y, x;
  
#pragma omp master
  {
    t_stop = usecs();

    nth = 0;
    for(i=0; i<MAXTHREADS; i++)
      if(nevents[i] > 0) nth=i+1;
    
    /* scale_x = 1000.0; */
    /* scale_y = ((double)(nth+1)) *30000 / ((double)(t_stop-t_zero)); */
    
    scale_x = ((double)(t_stop-t_zero))/1000.0;
    scale_y = 0.1;
      


    pFile = fopen (fname,"w");
    fprintf(pFile,"<svg x=\"-11\" y=\"-8\" width=\"%f\" height=\"%f\">\n",
            ((double)t_stop-t_zero)*1.06/scale_x, ((double)nth+1)*1.05/scale_y+8);

    for(t=0; t<MAXTHREADS; t++){
      for(e=0; e<nevents[t]; e++){
        ev = events[t][e];
        fprintf(pFile,"    "
               "<rect x=\"%f\" y=\"%f\" width=\"%f\" height=\"%f\" "
               "fill=\"%7s\" stroke-width=\"0\"/>\n",
                (double)(ev.t_start-t_zero)/scale_x, 
                ((double)t)/scale_y, 
                ((double)(ev.t_stop-ev.t_start))/scale_x,
                ((double)1.0)/scale_y, 
                colors[ev.type]);
      }
      
    }



    fprintf(pFile, "<line x1=\"0\" y1=\"%f\" x2=\"%f\" y2=\"%f\" \
                     style=\"stroke:rgb(0,0,0);stroke-width:1\"/>\n",
            ((double)nth+1)*1.01/scale_y,
            ((double)t_stop-t_zero)*1.02/scale_x, 
            ((double)nth+1)*1.01/scale_y);

    for(t=0; t<nth; t++){
      fprintf(pFile,"<text x=\"%f\" y=\"%f\" style=\"font-size:6pt\">Thread %d</text>\n",
              ((double)t_stop-t_zero)*1.01/scale_x, ((double)t+0.8)/scale_y, t);
    }

    fprintf(pFile,"<text x=\"0\" y=\"%f\" style=\"font-size:6pt\">Time (usec.)</text>\n",((double)nth+1)*1.05/scale_y+7);

    for(x=((double)t_stop-t_zero)/scale_x/10.0; x<=((double)t_stop-t_zero)/scale_x; x+=((double)t_stop-t_zero)/scale_x/10.0){
      fprintf(pFile, "<line x1=\"%f\" y1=\"%f\" x2=\"%f\" y2=\"%f\" \
                     style=\"stroke:rgb(0,0,0);stroke-width:0.5\"/>\n",
              x,((double)nth+1)*1.01/scale_y-1, x, ((double)nth+1)*1.01/scale_y+1);
      fprintf(pFile,"<text x=\"%f\" y=\"%f\" style=\"font-size:6pt\"> %.0f </text>\n",
              x,((double)nth+1)*1.01/scale_y+7,x*scale_x);
    }


    fprintf(pFile,"</svg>\n");
  }
}
