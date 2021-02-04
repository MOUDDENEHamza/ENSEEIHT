typedef struct treenode{
  /* Pointers to the left and right children */
  struct treenode *left, *right;
  /* The node number */
  int n;
  /* The node level in the tree */
  int l;
  /* A value associated to the node which is computed during the traversal */
  long v;
  /* Some data associated to the node which is used during the traversal */
  double *data;
} TreeNode;

void treeinit(TreeNode **root, int l, int po);
void treedestroy(TreeNode *root);

void treetraverse_par(TreeNode *root, int nth);
void treetraverserec_par(TreeNode *root, int depth);

void treetraverse_seq(TreeNode *root);
void treetraverserec_seq(TreeNode *root);


#define MAXTHREADS 16
#define DATASIZE 4
#define NIT 100


int countnodes[MAXTHREADS];
