#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "treetrav.h"
#include "omp.h"

/* This is simply a wrapper for the recursive tree traversal
   routine */
void treetraverse_seq(TreeNode *root){

  int i;

  /* Initialize the counter to 0. MAXTHREADS is the maximum number of
     allowed threads. */
  for(i=0; i<MAXTHREADS; i++)
    countnodes[i]=0;
  
  treetraverserec_seq(root);
  
  return;

}



/* This recursive routine performs a topological order tree traversal
   starting from the root node pointed by *root */
void treetraverserec_seq(TreeNode *root){

  double sum;
  int i, iam, it;

  
  if(root->l != 1){
    /* If this node is not a leaf...*/

    /* ...visit the left subtree... */
    treetraverserec_seq(root->left);

    /* ...visit the right subtree... */
    treetraverserec_seq(root->right);

    /* ...compute root->v as the sum of the v values on the left and
       right children... */
    root->v += (root->right)->v + (root->left)->v;
  }

  /* ...add root->n to root->v... */
  root->v += root->n;
  
  /* ...do some random work... */
  for(it=0; it<NIT; it++)
    for(i=1; i<DATASIZE; i++)
      root->data[0] += root->data[i];
  
  
  /* ...increment the counter of the number of nodes treated by the
     executing thread. */
  iam = 0;
  countnodes[iam] +=1;

  return;

}













/*********************************************************************
Don't touch below this point
*********************************************************************/

/* Tree initialization routine */
void treeinit(TreeNode **root, int l, int po){
  int i;
  
  *root = (TreeNode*)malloc(sizeof(TreeNode));
  
  (*root)->v = 0;
  (*root)->l = l;
  (*root)->n = po+pow(2,l)-1;
  (*root)->data = (double*)malloc(DATASIZE*sizeof(double));
  for (i=0; i<DATASIZE; i++)
    (*root)->data[i] = (double)rand()/RAND_MAX;
  
  if(l == 1){
    return;
  }
  
  treeinit(&(*root)->left, l-1, po);
  treeinit(&(*root)->right, l-1, po+pow(2,l-1)-1);
  
  return;

}




/* Tree cleanup routine */
void treedestroy(TreeNode *root){

  if(root->l != 1){
    treedestroy(root->left);
    treedestroy(root->right);
  }
  free(root->data);
  free(root);
  return;

}
