clear;
close all;
taille_ecran = get( 0, 'ScreenSize' );
L = taille_ecran( 3 );
H = taille_ecran( 4 );

load exercice_0;

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

% Estimation de la sinusoide :
[rho_F,theta_F] = estimation_F(rho,theta);

% Trace de la sinusoide estimee :
pas = 0.01;
theta_affichage = -pi:pas:pi;
rho_affichage = rho_F*cos(theta_affichage-theta_F);
plot(theta_affichage,rho_affichage,'r-','LineWidth',3);
title('Sinusoide estimee');

% Affichage de l'image :
subplot(1,2,2);
hold on;
set(gca,'FontSize',20);
imagesc(I);
axis ij equal off;
colormap gray;

% Affichage du point de fuite estime :
[y_max, x_max] = size(I);
x_F = rho_F*cos(theta_F);
y_F = rho_F*sin(theta_F);
plot(x_F,y_F,'r*','MarkerSize',10,'LineWidth',3);
tracer_droites_vers_point_de_fuite(rho,theta,x_F,y_F,x_max,y_max,'r');
title('Point de fuite estime');
