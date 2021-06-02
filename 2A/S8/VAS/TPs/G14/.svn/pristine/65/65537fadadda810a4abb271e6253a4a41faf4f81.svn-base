#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>


main(int argc, char *argv[])
{

int i;
char str[2000];

float x,y1,y2,w,z;
float y1_min,y2_min,z_min,w_min,y1_max,y2_max,z_max,w_max;
float x_min = 0;
float x_max = 1.57;

int f = open("output", O_WRONLY | O_APPEND | O_CREAT, S_IRUSR | S_IWUSR);
srand_real((unsigned int)time(NULL));
/*
if (argc == 2) 
	x = atof(argv[1]);
else
	x = 0;
*/
int nb = 300000;

for (i=0;i<=nb;i++) {
/*int r = rand();
x = x_min + ((float)r/(float)(RAND_MAX)) * x_max;*/

x = (x_max-x_min) * (float)i/(float)nb + x_min;


if (x<=0.157000) {
  y1 = 0.995897*x + 0.000000; 
  y2 = -0.078339*x + 1.000000; 
  z = y1*y1 + y2*y2;
  w = 1 / z;
} else if (x<=0.314000) {
  y1 = 0.971399*x + 0.003846; 
  y2 = -0.233090*x + 1.024296; 
  z = y1*y1 + y2*y2;
  w = 1 / z;
} else if (x<=0.471000) {
  y1 = 0.923007*x + 0.019041; 
  y2 = -0.382107*x + 1.071087; 
  z = y1*y1 + y2*y2;
  w = 1 / z;
} else if (x<=0.628000) { 
  y1 = 0.851910*x + 0.052528; 
  y2 = -0.521725*x + 1.136847; 
  z = y1*y1 + y2*y2;
  w = 1 / z;
}  else if (x<=0.785000) { 
  y1 = 0.759858*x + 0.110337; 
  y2 = -0.648509*x + 1.216468; 
  z = y1*y1 + y2*y2;
}  else if (x<=0.942000) {
  y1 = 0.649114*x + 0.197271; 
  y2 = -0.759341*x + 1.303471; 
  z = y1*y1 + y2*y2;
  w = 1 / z;
}  else if (x<=1.099000) {
  y1 = 0.522403*x + 0.316633; 
  y2 = -0.851494*x + 1.390280; 
  z = y1*y1 + y2*y2;
  w = 1 / z;
}  else if (x<=1.256000) {
  y1 = 0.382842*x + 0.470010; 
  y2 = -0.922702*x + 1.468537; 
  z = y1*y1 + y2*y2;
  w = 1 / z;
}  else if (x<=1.413000) {
  y1 = 0.233863*x + 0.657127; 
  y2 = -0.971213*x + 1.529467; 
  z = y1*y1 + y2*y2;
  w = 1 / z;
}  else {
  y1 = 0.079132*x + 0.875763; 
  y2 = -0.995834*x + 1.564256; 
  z = y1*y1 + y2*y2;
  w = 1 / z;
}

if (y1_min > y1 || i == 0) y1_min = y1; 
if (y2_min > y2 || i == 0) y2_min = y2; 
if (z_min > z || i == 0) z_min = z; 
if (w_min > w || i == 0) w_min = w; 
if (y1_max < y1 || i == 0) y1_max = y1; 
if (y2_max < y2 || i == 0) y2_max = y2; 
if (z_max < z || i == 0) z_max = z; 
if (w_max < w || i == 0) w_max = w; 
  
/*snprintf (str, 2000,"- \t x: %f \n\t y1: %f y2: %f \n\t z: %f \n\t w: %f \n\n", x, y1, y2, z, w);
write(1, str, strlen(str));*/
}

snprintf (str, 2000," \t%f < x < %f \n\t%f < y1 < %f\n\t%f < y2 < %f\n\t%f < z < %f \n\t%f < w < %f \n\n", x_min, x_max, y1_min, y1_max, y2_min, y2_max, z_min, z_max, w_min, w_max);
write(1, str, strlen(str));
}
