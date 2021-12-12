/*                               -*- Mode: C -*-
 *
 * verification.c --- Cours MPI. Programme de vérification du TP 7.
 *
 * cc verification.c -lX11 -o verification
 *
 * Auteur          : Denis GIROU (CNRS/IDRIS - France) <Denis.Girou@idris.fr>
 * 
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include <X11/Xlib.h>
#include <X11/Xutil.h>

main (int argc, char **argv)
{
  char              Titre[] = "Cours MPI. Vérification du TP 7.";

  Display           *Affichage;
  Window            Fenetre;
  GC                ContexteGraphique;
  XEvent            Evenement;
  XSizeHints        Attributs;

  int               Ecran;
  unsigned long     AvantPlan, ArrierePlan;

  char              NomFichier[17];

  int               NbPoints = 242;
  XPoint            Points[242];


  /* Définition de l'affichage et des couleurs d'arrière et d'avant-plan */
  Affichage         = XOpenDisplay  ("");
  Ecran             = DefaultScreen (Affichage);
  ArrierePlan       = WhitePixel    (Affichage, Ecran);
  AvantPlan         = BlackPixel    (Affichage, Ecran);

  /* Création d'une fenêtre de taille 650 x 650 */
  Attributs.x       = 0;
  Attributs.y       = 0;
  Attributs.width   = 650;
  Attributs.height  = 650;
  Attributs.flags   = PPosition | PSize;
  Fenetre           = XCreateSimpleWindow (Affichage, DefaultRootWindow (Affichage),
                                           Attributs.x, Attributs.y,
                                           Attributs.width, Attributs.height,
                                           5, AvantPlan, ArrierePlan);

  XSetStandardProperties (Affichage, Fenetre, Titre, Titre,
                          None, argv, argc, &Attributs);

  ContexteGraphique = XCreateGC (Affichage, Fenetre, 0, 0);

  XSetBackground    (Affichage, ContexteGraphique, ArrierePlan);
  XSetForeground    (Affichage, ContexteGraphique, AvantPlan);

  XSelectInput      (Affichage, Fenetre, ButtonPressMask);

  /* Affichage de la fenêtre sur l'écran */
  XMapRaised        (Affichage, Fenetre);

  /* Tracé des graphiques */

  XNextEvent        (Affichage, &Evenement);

  /* Lecture via des déplacements explicites, en mode individuel */
  strcpy            (NomFichier, "fichier_deiN.dat");
  LectureDonnees    (NomFichier, NbPoints, Points);
  TraceGraphique    (Affichage, Fenetre, ContexteGraphique,
                     "MPI_FILE_READ_AT", NbPoints, Points);
  XNextEvent        (Affichage, &Evenement);
  XClearWindow      (Affichage, Fenetre);


  /* Lecture via les pointeurs partagés, en mode collectif */
  strcpy            (NomFichier, "fichier_ppcN.dat");
  LectureDonnees    (NomFichier, NbPoints, Points);
  TraceGraphique    (Affichage, Fenetre, ContexteGraphique,
                     "MPI_FILE_READ_ORDERED", NbPoints, Points);
  XNextEvent        (Affichage, &Evenement);
  XClearWindow      (Affichage, Fenetre);

  /* Lecture via les pointeurs individuels, en mode individuel */
  strcpy            (NomFichier, "fichier_piiN.dat");
  LectureDonnees    (NomFichier, NbPoints, Points);
  TraceGraphique    (Affichage, Fenetre, ContexteGraphique,
                     "MPI_FILE_READ", NbPoints, Points);
  XNextEvent        (Affichage, &Evenement);
  XClearWindow      (Affichage, Fenetre);

  /* Lecture via les pointeurs partagés, en mode individuel */
  strcpy            (NomFichier, "fichier_ppiN.dat");
  LectureDonnees    (NomFichier, NbPoints, Points);
  TraceGraphique    (Affichage, Fenetre, ContexteGraphique,
                     "MPI_FILE_READ_SHARED", NbPoints, Points);
  XNextEvent        (Affichage, &Evenement);
  XClearWindow      (Affichage, Fenetre);

  /* Libération des ressources et destruction de la fenêtre */
  XFreeGC           (Affichage, ContexteGraphique);
  XDestroyWindow    (Affichage, Fenetre);
  XCloseDisplay     (Affichage);

  exit(0);
}

/* Lecture des données dans les fichiers */
LectureDonnees (char   *NomFichier,
                int    NbPoints,
                XPoint Points[NbPoints])
{
  FILE *Fichier;
  char *NumeroFichier = strchr (NomFichier, 'N');
  int  IPoint, Point;


  *NumeroFichier = '0';
  if ((Fichier = fopen(NomFichier, "rt")) == NULL) {
    fprintf(stderr, "Erreur à l'ouverture du fichier '%s'\n",NomFichier);
    exit(1);
  }

  for (IPoint=0; IPoint<NbPoints/2; IPoint++) {
    fscanf(Fichier, "%d", &Point);
    Points[IPoint].x = Point;
  }
  fclose(Fichier);

  *NumeroFichier = '2';
  if ((Fichier = fopen(NomFichier, "rt")) == NULL) {
    fprintf(stderr, "Erreur à l'ouverture du fichier '%s'\n",NomFichier);
    exit(1);
  }
  for (IPoint=0; IPoint<NbPoints/2; IPoint++) {
    fscanf(Fichier, "%d", &Point);
    Points[IPoint].y = 620 - Point;
  }
  fclose(Fichier);

  *NumeroFichier = '1';
  if ((Fichier = fopen(NomFichier, "rt")) == NULL) {
    fprintf(stderr, "Erreur à l'ouverture du fichier '%s'\n",NomFichier);
    exit(1);
  }
  for (IPoint=NbPoints/2; IPoint<NbPoints; IPoint++) {
    fscanf(Fichier, "%d\n", &Point);
    Points[IPoint].x = Point;
  }
  fclose(Fichier);

  *NumeroFichier = '3';
  if ((Fichier = fopen(NomFichier, "rt")) == NULL) {
    fprintf(stderr, "Erreur à l'ouverture du fichier '%s'\n",NomFichier);
    exit(1);
  }
  for (IPoint=NbPoints/2; IPoint<NbPoints; IPoint++) {
    fscanf(Fichier, "%d", &Point);
    Points[IPoint].y = 620 - Point;
  }
  fclose(Fichier);
}

/* Tracé d'un graphique */
TraceGraphique (Display  *Affichage,
                Drawable Fenetre,
                GC       ContexteGraphique,
                char     *MessageType,
                int      NbPoints,
                XPoint   Points[NbPoints])
{
  Font          Fonte;
  char          MessageSuite[] = "Cliquez dans la fenêtre pour continuer.";

  XDrawLines       (Affichage, Fenetre, ContexteGraphique, Points, NbPoints,
                    CoordModeOrigin);

  /* Chargement de la fonte 12x24 */
  Fonte            = XLoadFont (Affichage, "12x24");
  XSetFont         (Affichage, ContexteGraphique, Fonte);
  XDrawImageString (Affichage, Fenetre, ContexteGraphique, 5, 640,
                    MessageType, strlen(MessageType));

  /* Chargement de la fonte 8x16 */
  Fonte            = XLoadFont (Affichage, "8x16");
  XSetFont         (Affichage, ContexteGraphique, Fonte);
  XDrawImageString (Affichage, Fenetre, ContexteGraphique, 340, 640,
                    MessageSuite, strlen(MessageSuite));
}
