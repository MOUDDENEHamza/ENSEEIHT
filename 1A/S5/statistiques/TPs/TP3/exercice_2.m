clear;
close all;
taille_ecran = get( 0, 'ScreenSize' );
L = taille_ecran( 3 );
H = taille_ecran( 4 );

load exercice_0;
[y_max, x_max] = size(I);

% Affichage des couples (rho,theta) :
figure('Name','Estimation du point de fuite','Position',[0,0,L,0.67*H]);
subplot(1,2,1);
hold on;
set(gca,'FontSize',20);
hx = xlabel('$\theta$','FontSize',30);
set(hx,'Interpreter','Latex');
hy = ylabel('$\rho$','FontSize',30);
set(hy,'Interpreter','Latex');
plot(theta,rho,'k+','MarkerSize',10,'LineWidth',2);
grid;

% Parametres de l'algorithme RANSAC :
n = length(rho);
S1 = 5;
S2 = 0.3;
k_max = floor(nchoosek(n,2)/n);

% Estimation du premier point de fuite :
parametres = [S1 S2 k_max];
[rho_F_1,theta_F_1] = RANSAC_2(rho,theta,parametres);

% Trace de la premiere sinusoide :
pas = 0.01;
theta_affichage = -pi:pas:pi;
rho_affichage = rho_F_1*cos(theta_affichage-theta_F_1);
plot(theta_affichage,rho_affichage,'r-','LineWidth',3);

% Affichage des points conformes a la premiere sinusoide :
conformes_1 = abs(rho-rho_F_1*cos(theta-theta_F_1))<=S1;
rho_conformes_1 = rho(conformes_1);
theta_conformes_1 = theta(conformes_1);
plot(theta_conformes_1,rho_conformes_1,'r+','MarkerSize',10,'LineWidth',2);

% Affichage de l'image :
subplot(1,2,2);
hold on;
set(gca,'FontSize',20);
imagesc(I);
axis ij equal off;
colormap gray;

% Affichage du premier point de fuite estime :
x_F_1 = rho_F_1*cos(theta_F_1);
y_F_1 = rho_F_1*sin(theta_F_1);
tracer_droites_vers_point_de_fuite(rho_conformes_1,theta_conformes_1,x_F_1,y_F_1,x_max,y_max,'r');
plot(x_F_1,y_F_1,'b*','MarkerSize',10,'LineWidth',3);

% Donnees non conformes au premier point de fuite :
theta = theta(~conformes_1);
rho = rho(~conformes_1);

% Estimation du deuxieme point de fuite :
[rho_F_2,theta_F_2] = RANSAC_2(rho,theta,parametres);

% Trace de la deuxieme sinusoide :
subplot(1,2,1);
pas = 0.01;
rho_affichage = rho_F_2*cos(theta_affichage-theta_F_2);
plot(theta_affichage,rho_affichage,'g-','LineWidth',3);
title('Sinusoides estimees');

% Affichage des points conformes a la deuxieme sinusoide :
conformes_2 = abs(rho-rho_F_2*cos(theta-theta_F_2))<=S1;
rho_conformes_2 = rho(conformes_2);
theta_conformes_2 = theta(conformes_2);
plot(theta_conformes_2,rho_conformes_2,'g+','MarkerSize',10,'LineWidth',2);

% Affichage du deuxieme point de fuite estime :
subplot(1,2,2);
x_F_2 = rho_F_2*cos(theta_F_2);
y_F_2 = rho_F_2*sin(theta_F_2);
tracer_droites_vers_point_de_fuite(rho_conformes_2,theta_conformes_2,x_F_2,y_F_2,x_max,y_max,'g');
plot(x_F_2,y_F_2,'b*','MarkerSize',10,'LineWidth',3);

% Affichage de la ligne de fuite :

  
line([x_F_1 x_F_2],[y_F_1 y_F_2],'Color','b','LineWidth',3);
title('Points de fuite et ligne de fuite estimes');
