#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <cblas.h>
//#include <time.h>
#include <sys/time.h>
#include "utils.h"

void val_mat(int m, int n, float* mat, float val) {
	int i,j;
	for(i = 0; i<m; i++) {
		for(j = 0; j<n; j++) {
			mat[i*n+j] = val;
		}
	}
}

void rand_mat(int m, int n, float* mat, float max) {
	int i,j;
	for(i = 0; i<m; i++)
		for(j = 0; j<n; j++)
			mat[i*n+j] = ((float)rand()/RAND_MAX) * max;
}

// unused, more as a reminder
int item_2d(int i, int j, int m, int n) {
	return i*n + j;
}

long unsigned int time_interval(struct timeval start,struct timeval stop) {
	return abs( (stop.tv_sec - start.tv_sec) * 1000000 + stop.tv_usec - start.tv_usec );
}

void print_gflops(struct timeval stop, struct timeval start, int m, int n, int k, int b, int kernel, char* name, float * c) {
	long unsigned int total_us = time_interval(start, stop);
	printf("flops%f\n",2.0*m*n*k);
	printf("s = %f\n",total_us*pow(10,3));
	float gflops = fabs( 2.0*m*n*k/(total_us*pow(10,3)) );
	printf("gflops = %f\n",gflops);
	float nrm;
	if (c == NULL) { nrm = -1.0; } else { nrm  = cblas_snrm2(m*n, c, 1); }
	printf("%s took %lu µs => %f Gflop/s check: %f (block:%d, kernel:%d)\n", name, total_us, gflops, nrm, b, kernel);
	printf("CSV %d,%d,%d,%d,%d,%s,%ld,%f\n", m,n,k,b,kernel,name,total_us,gflops);
}

void print_mat(float* a, int m, int n, char* name) {
	int i,j;
	for (i = 0; i < m ; i++) {
		for (j = 0; j < n ; j++) {
			printf("%s[%d,%d] = %f,",name,i,j,a[n*i+j]);
		}
		printf("\n");
	}
	printf("\n");
}

// b = alpha*a + b
void myblas_sgepxy(float alpha, float* a, float* b, int m, int n) {
	int i,j;
	for (i = 0; i < m ; i++) {
		cblas_saxpy(n,alpha,&a[n*i],1,&b[n*i],1);
	}
}

void node_coordinates(int p, int q, int node, int* coordinates) {
	// node = q * c[0] + c[1]
	coordinates[1] = node % q;
	coordinates[0] = (node - coordinates[1])/q;
}

void node_coordinates_2i(int p, int q, int node, int* my_row, int* my_col) {
	// node = q * my_row + my_col
	*my_col = node % q;
	*my_row = (node - *my_col)/q;
}

int get_node(int p, int q, int i, int j) {
  return q*(i%p) + (j%q);
}

// cf stackoverflow (https://stackoverflow.com/questions/504810/how-do-i-find-the-current-machines-full-hostname-in-c-hostname-and-domain-info)
void get_host_name(char* hostname, int buffer_size) {
  hostname[buffer_size - 1] = '\0';
  gethostname(hostname, buffer_size - 1);
}
