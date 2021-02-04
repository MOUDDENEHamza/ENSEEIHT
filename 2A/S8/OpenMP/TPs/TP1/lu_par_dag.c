#include <stdio.h>
#include <stdlib.h>
#include "trace.h"
#include "common.h"
#include <omp.h>

/* This struct defines a task; it can be a panel (Task.type==PNL), an
   update (Task.type==UPD) or a termination message
   (Task.type==END). If Task.type==PNL, then the panel operation has
   to be executed on column Task.p. If Task.type==UPD the the update
   operation has to be executed on column Task.u using column
   Task.p.*/
typedef struct taskstruct{
  Type type;
  int p;
  int u;
} Task;

/* This struct defines a progress table (see details below). */
typedef struct prog_table_struct{
  int NB;
  int *table;
} ProgTable;



Task fetch_task( ProgTable ptable );



/* This routine performs a parallel LU factorization based on the
   dependencies among operations. These dependencies are represented
   in a progress table of the type ProgTable above. This progress
   table is nothing more than an array of size NB (number of
   block-columns in the matrix) where each coefficient tracks the
   status of a block-column. Precisely, ProgTabl.table[j]=i means that
   block-column j is up-to-date with respect to the panel operation i,
   i.e., the operation update(i,j) has bee executed. Equivalently
   ProgTable[i]=i means that the operation panel(i) has been already
   executed. Two main rules define the order in which operations have
   to be executed: 

   1) panel(i) can only be executed after update(0,i),
   update(1,i),...,update(i-1,i), i.e., only if ProgTable[i]=i-1.

   2) update(i,j) can only be executed after panel(i) and after
   update(1,i),...,update(i-1,i), i.e., only if ProgTable[j]=i-1
   and ProgTable[i]=i.

   This code works as follows: each thread enters an "endless" loop
   where at each iteration it performs the following steps: 
   
   1) calls the fetch_task. This routine analyses the progress table
   looking for operations to perform according to the rules above

   2) if one operation is found, the corresponding action is executed
   and the progress table is updated accordingly. Note that in a
   sequential execution there will always be an operation ready for
   being executed whereas in parallel this may not be the case.

   Threads exit from the loop when all operations are performed, i.e.,
   wher ProgTable[NB]=NB (i.e.,  panel(NB) has been performed).

   The initial code is sequential. OpenMP directives have to be added
   in the two routines below to parallelize it.

*/


void lu_par_dag(Matrix A, info_type info){

  ProgTable ptable;
  Task      task;
  int i;

  ptable.table = (int*)malloc(info.NB*sizeof(int));
  ptable.NB = info.NB;
  for(i=0; i<ptable.NB; i++)
    ptable.table[i] = -1;

  
  /* Initialize the tracing system */
  trace_init();

  for(;;){
      
    /* Check if there is one operation ready to be executed */
    task = fetch_task( ptable );
      
    switch(task.type)
      {
      case PNL:
        /* A panel operation can be executed */
        panel(A[task.p], task.p, info);
        /* Record the operation in the progress table */
        ptable.table[task.p]=task.p;
        break;
      case UPD:
        /* An update operation can be executed */
        update(A[task.p], A[task.u], task.p, task.u, info);
        /* Record the operation in the progress table */
        ptable.table[task.u]=task.p;
        break;
      case NONE:
        break;
      case END:
        /* The backpermutation is executed at the end of the
           factorization. In the parallel case MAKE SURE THIS IS
           EXECUTED BY ONLY ONE THREAD!!! */
        backperm(A, info);
        /* Exit from the loop */
        goto finish;
      }
      
  }
 finish:;
  
  /* Write the trace in file (ignore) */
  trace_dump("trace_par_dag.svg");
  return;
}





/* This routine is executed by a thread in order to check whether
   there is one operation ready to be executed. Note that the layout
   of this routine resembles a lot that of the lu_seq routine. */
Task fetch_task( ProgTable ptable ){

  Task task;
  int p, u;

  task.type = NONE;

  /* CC: This is a better scheduling than the one above provided to the
     students because the panel operations that lie on the critical
     path are scheduled with higher priority */
  
  /* First of all, check if the factorization is finished */
  if(ptable.table[ptable.NB-1] == ptable.NB-1){
    task.type = END;
    goto get_out;
  }
  
  for(p=0; p<ptable.NB; p++){
    /* Second, look if there's one panel operation ready for
       execution */
    if(ptable.table[p] == p-1){
      /* Writing -999 in the selected column prevents another thread
         to pick up the same operation */
      ptable.table[p] = -999;
      task.p = p;
      task.type = PNL;
      goto get_out;
    }
    for(u=p+1; u<ptable.NB; u++){
      /* Third, look if there's one update operation ready for
         execution */
      if((ptable.table[u] == p-1) && (ptable.table[p]==p)){
        /* Writing -999 in the selected column prevents another thread
           to pick up the same operation */
        ptable.table[u] = -999;
        task.p = p;
        task.u = u;
        task.type = UPD;
        goto get_out;
      }
    }
  }
 get_out:;
  
  return task;
}




