#include <mpi.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
  const int nb_valeurs=242;
  int valeurs[2*nb_valeurs];
  FILE *unit;
  int iter;
  MPI_File descripteur;
  MPI_Status statut;

  MPI_Init(&argc, &argv);

  unit = fopen("carte.dat","r");
  for (iter=0; iter<nb_valeurs; iter++)
    fscanf(unit,"%d %d\n", &(valeurs[iter]), &(valeurs[nb_valeurs+iter]));
  fclose(unit);

  MPI_File_open(MPI_COMM_WORLD,"donnees.dat",MPI_MODE_RDWR | MPI_MODE_CREATE,
                MPI_INFO_NULL,&descripteur);
  MPI_File_write_all(descripteur,valeurs,2*nb_valeurs,MPI_INTEGER,&statut);
  MPI_File_close(&descripteur);
  MPI_Finalize();
  return 0;
}
