#ifndef PROGPARALLEL_UTILS_H
#define PROGPARALLEL_UTILS_H

#define max(a,b) \
	({ __typeof__ (a) _a = (a); \
	 __typeof__ (b) _b = (b); \
	 _a > _b ? _a : _b; })

// fill the content of mat with values val
void val_mat(int m, int n, float* mat, float val); 
// fill the content of mat with random values from 0.0 to max
void rand_mat(int m, int n, float* mat, float max);
// b = alpha*a + b
void myblas_sgepxy(float alpha, float* a, float* b, int m, int n);

// return the time between start and stop in µs
long unsigned int time_interval(struct timeval start,struct timeval stop);
// deprecated
void print_gflops(struct timeval stop, struct timeval start, int m, int n, int k, int b, int kernel, char* name, float * c);
// print the content of a[0:m-1,0;n-1] with given name
void print_mat(float* a, int m, int n, char* name);

// fill coordinates according to node = q * coordinates[0] + coordinates[1] 
void node_coordinates(int p, int q, int node, int* coordinates);
// fill my_row/col according to node = q * my_row + my_col
void node_coordinates_2i(int p, int q, int node, int* my_row, int* my_col);
// return the owner node of a block A_i,j on a p x q grid.
int get_node(int p, int q, int i, int j);
// return i*n +j;
int item_2d(int i, int j, int m, int n);

// get the name of the machine
void get_host_name(char* hostname, int buffer_size);
#endif
