function [C,theta_0,a,b] = conversion(p)

C = -inv([2*p(1) p(2) ; p(2) 2*p(3)])*[p(4) ; p(5)];
g = p(6)+p(1)*C(1)*C(1)+p(2)*C(1)*C(2)+p(3)*C(2)*C(2)+p(4)*C(1)+p(5)*C(2);
theta_0 = 1/2*atan(p(2)/(p(1)-p(3)));
cos_theta_0 = cos(theta_0);
sin_theta_0 = sin(theta_0);
a = sqrt(abs(g/(p(1)*cos_theta_0*cos_theta_0+p(2)*sin_theta_0*cos_theta_0+p(3)*sin_theta_0*sin_theta_0)));
b = sqrt(abs(g/(p(1)*sin_theta_0*sin_theta_0-p(2)*sin_theta_0*cos_theta_0+p(3)*cos_theta_0*cos_theta_0)));

if b>a
	theta_0 = theta_0+pi/2;
	aux = a;
	a = b;
	b = aux;
end