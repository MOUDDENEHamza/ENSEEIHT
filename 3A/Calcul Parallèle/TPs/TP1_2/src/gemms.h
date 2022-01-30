#ifndef PROGPARALLEL_GEMMS_H
#define PROGPARALLEL_GEMMS_H

int pgemm_p2p(int p, int q, int m, int n, int k, Matrix* A, Matrix* B, Matrix* C);
int pgemm_bcast(int p, int q, int m, int n, int k, Matrix* A, Matrix* B, Matrix* C);
//int pgemm_p2p_i(int p, int q, int m, int n, int k, Matrix* A, Matrix* B, Matrix* C);
int pgemm_p2p_i_la(int p, int q, int lookahead, int m, int n, int k, Matrix* A, Matrix* B, Matrix* C);

#endif
