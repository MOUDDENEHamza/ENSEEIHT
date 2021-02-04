#include "aux.h"
#include <stdio.h>
#include <omp.h>

long usecs (){
  struct timeval t;

  gettimeofday(&t,NULL);
  return t.tv_sec*1000000+t.tv_usec;
}


void mysleep(double sec){

  long s, e;
  s=0; e=0;
  s = usecs();
  while(((double) e-s)/1000000 < sec)
    {
      e = usecs();
    }
  return;
}





void treeinitrec(node_t *root, int l, int *id){

  int i;
  
  if (l==-1)
    return;

  root->id = ++(*id);
  root->nc = rand()%l;
  root->children = (node_t*)malloc(root->nc*sizeof(node_t));
  root->weight = rand()%50+1;
  /* root->branch_weight = 0; */
  
  for(i=0; i<root->nc; i++)
    treeinitrec(root->children+i, l-1, id);
  
  return ;
}


void treeinit(node_t *root, int l){

  int id;

  id = 0;

  
  treeinitrec(root, l, &id);

  treeprint(root, "tree.dot");
  
  return ;
}





void treeprintrec(node_t *root, FILE *pfile){

  int i;

  
  fprintf(pfile, "node%4.4d[label=\"id:%d\\lwg:%d\\l\"];\n",root->id,root->id, root->weight);
  
  for(i=0; i<root->nc; i++)
    fprintf(pfile, "node%4.4d -- node%4.4d\n",root->id,root->children[i].id);

  for(i=0; i<root->nc; i++)
    treeprintrec(root->children+i, pfile);

  return;
  
}



void treeprint(node_t *root, char *fname){

  FILE *pfile;

  pfile = fopen (fname,"w");


  fprintf(pfile, "graph G {\n");
  fprintf(pfile, "node [color=black,\n");
  fprintf(pfile, "fillcolor=white,\n");
  fprintf(pfile, "shape=circle,\n");
  fprintf(pfile, "fontname=Courier,\n");
  fprintf(pfile, "style=filled\n");
  fprintf(pfile, "];\n");


  treeprintrec(root, pfile);

  fprintf(pfile, "}");


  fclose(pfile);

}



int process(node_t *node){

  /* printf("%2d  ---> %4d\n",omp_get_thread_num(), node->id); */
  mysleep(((double)node->weight)/10000.0);
  return 0;

}
