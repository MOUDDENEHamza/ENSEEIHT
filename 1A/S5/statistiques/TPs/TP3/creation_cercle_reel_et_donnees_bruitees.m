function [x_cercle_reel,y_cercle_reel,theta_cercle, ...
		x_donnees_bruitees,y_donnees_bruitees,theta_donnees_bruitees] ...
			= creation_cercle_reel_et_donnees_bruitees(taille,n,sigma)

% Parametres du cercle reel (tous les points du cercle sont dans les bornes) :
R_0 = 8;
C_0 = (taille-R_0)*(2*rand(1,2)-1);

% Creation du cercle reel :
nb_points_cercle = 100;
theta_cercle = 2*pi/nb_points_cercle:2*pi/nb_points_cercle:2*pi;
x_cercle_reel = C_0(1) + R_0*cos(theta_cercle);
y_cercle_reel = C_0(2) + R_0*sin(theta_cercle);

% Creation des donnees bruitees :
rho_donnees_bruitees = R_0 + sigma*randn(1,n);
theta_donnees_bruitees = 2*pi*rand(1,n);
x_donnees_bruitees = C_0(1) + rho_donnees_bruitees.*cos(theta_donnees_bruitees);
y_donnees_bruitees = C_0(2) + rho_donnees_bruitees.*sin(theta_donnees_bruitees);
