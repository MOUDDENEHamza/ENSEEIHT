#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

int main(int argc, char* argv[]) {
  MPI_Init(&argc, &argv);

  int size;
  int my_rank;
  int data_size = -100;
  int *buffer_send, *buffer_recv;
  int tag;
  MPI_Status status;
  int l;
  char name[MPI_MAX_PROCESSOR_NAME];

  // Make sure that the command line has one argument (the size of the data)

  if(argc != 2){
    printf("usage : limite <data size>\n");
    return EXIT_FAILURE;
  }

  // Make sure exactly 2 MPI processes are used
  MPI_Comm_size(MPI_COMM_WORLD, &size);
  if(size != 2) {
    printf("%d MPI processes used, please use 2.\n", size);
    MPI_Abort(MPI_COMM_WORLD, EXIT_FAILURE);
  }

  MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);
  MPI_Get_processor_name(name, &l);
  printf("process %d of %d on processor named %s\n", my_rank, size, name);

  // Prepare parameters
 
  data_size = atoi(argv[1]);
  printf("The size of the data is %d\n", data_size);

  buffer_send = (int*) malloc(data_size*sizeof(int));
  buffer_recv = (int*) malloc(data_size*sizeof(int));
  buffer_send[0] = (my_rank == 0) ? 12345 : 67890;

  tag = 0;

  if(my_rank == 0){
    // node 0 sends its buffer buffer_send of size data_size to node 1
    // ...
    MPI_Send(buffer_send, data_size, MPI_INT, 1, tag, MPI_COMM_WORLD);
    // node 0 receives in its buffer buffer_recv data from node 1
    // ...
    MPI_Recv(buffer_recv, data_size, MPI_INT, 1, tag, MPI_COMM_WORLD, &status);
    printf("MPI process %d sends value %d to MPI process %d.\n", my_rank, buffer_recv[0], 1);
  } else {
    // node 1 sends its buffer buffer_send of size data_size to node 0
    // ...
    MPI_Send(buffer_send, data_size, MPI_INT, 0, tag, MPI_COMM_WORLD);
    // node 1 receives in its buffer buffer_recv data from node 0
    // ...
    MPI_Recv(buffer_recv, data_size, MPI_INT, 0, tag, MPI_COMM_WORLD, &status);
    printf("MPI process %d received value %d from MPI process %d.\n", my_rank, buffer_recv[0], 0);
  }

  free(buffer_send);
  free(buffer_recv);

  MPI_Finalize();

  return EXIT_SUCCESS;
}

/**
 * (a). MPI_Send se comporte d'une façon asynchrone quand la taille de message
 *      est petite, mais pour résoudre les problèmes dues à l'espace MPI_Send
 *      devient synchrone(Bloquante).
 * 
 * (b). Avec une taille de message qui fera que MPI_Send sera synchrone, ceci
 *      peut provoquer un deadlock.
 * 
 * (c). La taille limite sur deux noeuds du même ordinateur est un peu près à
 *      1010.
 * 
 * (d). La taille limite sur deux noeuds du même ordinateur est un peu près à
 *      16370.
 * 
 * (e). Une solution pour que l'échange entre les deux noeuds puissent se faire
 *      au delà de cette limite est d'utiliser par exemple MPI_Bsend
 *      (Communication non bloquante) à la place de MPI_Send qui est
 *      complétement asynchrone, mais l'utilisateur doit fournir la taille du
 *      buffer nécessaire.
 *      
 */