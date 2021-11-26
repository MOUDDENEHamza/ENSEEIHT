#ifndef EXO_3_H
#define EXO_3_H
void p2p_i_transmit_A(int p, int q, Matrix *A, int i, int l);
void p2p_i_transmit_B(int p, int q, Matrix *B, int l, int j);
void p2p_i_wait_AB(int p, int q, Matrix *A, Matrix* B, int l);
#endif
