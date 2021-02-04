#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "treetrav.h"
#include "omp.h"

/* This is simply a wrapper for the recursive tree traversal
   routine */

/* This nth argument defines the number of threads to be used in the
   recursive tree traversal. */

void treetraverse_par(TreeNode *root, int nth){

  int depth, i;

  /* To be used in the second part of the excercise */
  depth = 0;

  /* Initialize the counter to 0. MAXTHREADS is the maximum number of
     allowed threads. */
  for(i=0; i<MAXTHREADS; i++)
    countnodes[i]=0;

  /* Start the tree traversal by calling the recursive routine */
  treetraverserec_par(root, depth);
  
  return;

}



/* This recursive routine performs a topological order tree traversal
   starting from the root node pointed by *root */

/* In the second part of the excercise, the depth argument will be
   used to define a layer in the tree below which tasks will be
   undeferred and immediately executed; this allows to reduce the
   overhead of creating and handling submitted tasks. */

void treetraverserec_par(TreeNode *root, int depth){

  double sum;
  int i, iam, it;


  
  if(root->l != 1){
    /* If this node is not a leaf...*/

    /* ...visit the left subtree... */
    treetraverserec_par(root->left, depth);

    /* ...visit the right subtree... */
    treetraverserec_par(root->right, depth);
    
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


