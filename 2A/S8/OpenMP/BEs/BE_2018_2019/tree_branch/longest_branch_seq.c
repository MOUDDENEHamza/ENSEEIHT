#include "aux.h"

void longest_branch_seq(node_t *root, unsigned int *longest_branch_weight, unsigned int *longest_branch_leaf){

  *longest_branch_weight = 0;
  *longest_branch_leaf   = -1;
  root->branch_weight = 0;
  
  longest_branch_seq_rec(root, longest_branch_weight, longest_branch_leaf);
  

}
  
void longest_branch_seq_rec(node_t *root, unsigned int *longest_branch_weight, unsigned int *longest_branch_leaf){

  int i;

  process(root);
  root->branch_weight += root->weight;
  
  if(root->nc>0) {
    for(i=0; i<root->nc; i++){
      root->children[i].branch_weight = root->branch_weight;
      longest_branch_seq_rec(root->children+i, longest_branch_weight, longest_branch_leaf);
    }
  } else {
    if(root->branch_weight > *longest_branch_weight){
      *longest_branch_weight = root->branch_weight;
      *longest_branch_leaf   = root->id;
    }
  }
    
}




