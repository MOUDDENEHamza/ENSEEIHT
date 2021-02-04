#include "aux.h"

void longest_branch_seq(node_t *root, unsigned int *longest_branch_weight, unsigned int *longest_branch_leaf);
void longest_branch_seq_rec(node_t *root, unsigned int *longest_branch_weight, unsigned int *longest_branch_leaf);

void longest_branch_par(node_t *root, unsigned int *longest_branch_weight, unsigned int *longest_branch_leaf);
void longest_branch_par_rec(node_t *root, unsigned int *longest_branch_weight, unsigned int *longest_branch_leaf);

int main(int argc, char **argv) {

  int n;
  int i, l, r, s;
  long ts, te;
  node_t root;
  unsigned int longest_branch_weight, longest_branch_leaf;
  
  if ( argc == 3 ) {
    l = atoi(argv[1]);    /* the number of levels in the tree */
    s = atoi(argv[2]);    /* the seed for the random number generation */
  } else {
    printf("Usage:\n\n ./main l s\n\nwhere l is the number of levels in the tree and s the seed for the random number generation.\n");
    return 1;
  }
  
  /* Chage this to generate different trees */
  srand(s);
  
  treeinit(&root, l);

  
  printf("==================================================\n\n");
  printf("Starting sequential execution\n");
  
  ts = usecs();
  longest_branch_seq(&root, &longest_branch_weight, &longest_branch_leaf);
  te = usecs()-ts;

  printf("Sequential execution time: %6ld  msec.\n",te/1000);
  printf("Sequential weight        : %d\n",longest_branch_weight);
  printf("Sequential leaf          : %d\n",longest_branch_leaf);



  
  printf("==================================================\n\n");
  printf("Starting parallel execution\n");
  
  ts = usecs();
  longest_branch_par(&root, &longest_branch_weight, &longest_branch_leaf);
  te = usecs()-ts;

  printf("Parallel execution time  : %6ld  msec.\n",te/1000);
  printf("Parallel weight          : %d\n",longest_branch_weight);
  printf("Parallel leaf            : %d\n",longest_branch_leaf);

  return 0;

}





