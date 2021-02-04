#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

typedef struct nodestruct{
  unsigned int weight, branch_weight;
  unsigned int id, nc;
  struct nodestruct *children;
} node_t;


long usecs ();
void treeinit(node_t *root, int l);
int process(node_t *node);
void treeprint(node_t *root, char *fname);


void longest_branch_seq(node_t *root, unsigned int *weight, unsigned int *leaf);
void longest_branch_seq_rec(node_t *root, unsigned int *weight, unsigned int *leaf);
void longest_branch_par(node_t *root, unsigned int *weight, unsigned int *leaf);
void longest_branch_par_rec(node_t *root, unsigned int *weight, unsigned int *leaf);
