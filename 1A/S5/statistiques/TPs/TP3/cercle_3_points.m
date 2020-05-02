function [C,R] = cercle_3_points(x,y)

x1 = x(1);
y1 = y(1);
x2 = x(2);
y2 = y(2);
x3 = x(3);
y3 = y(3);

A = 2*[-x1+x2 -y1+y2 ; -x1+x3 -y1+y3];
B = [-x1^2+x2^2-y1^2+y2^2 ; -x1^2+x3^2-y1^2+y3^2];
C = A\B;
R = sqrt((x1-C(1))^2+(y1-C(2))^2);
