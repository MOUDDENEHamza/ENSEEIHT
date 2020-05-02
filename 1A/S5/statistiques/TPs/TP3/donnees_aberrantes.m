clear;
close all;

taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Fenetre d'affichage :
figure('Name','Estimation robuste d''un cercle par RANSAC', ...
       'Position',[0.2*L,0,0.6*L,0.8*H]);
axis equal;
hold on;
set(gca,'FontSize',20);
hx = xlabel('$x$','FontSize',30);
set(hx,'Interpreter','Latex');
hy = ylabel('$y$','FontSize',30);
set(hy,'Interpreter','Latex');

% Bornes d'affichage des donnees centrees en (0,0) :
taille = 20;
bornes = [-taille taille -taille taille];

% Creation du cercle reel et des donnees bruitees :
n = 50;
sigma = 0.5;
[x_cercle_reel,y_cercle_reel,theta_cercle, ...
	x_donnees_bruitees,y_donnees_bruitees,theta_donnees_bruitees] ...
		= creation_cercle_reel_et_donnees_bruitees(taille,n,sigma);

% Affichage du cercle reel :
plot(x_cercle_reel([1:end 1]),y_cercle_reel([1:end 1]),'r','LineWidth',3);

% Donnees aberrantes :
proportion = 0.25;
nb_donnees_aberrantes = floor(proportion*n);
x_donnees_bruitees = [x_donnees_bruitees taille*(2*rand(1,nb_donnees_aberrantes)-1)];
y_donnees_bruitees = [y_donnees_bruitees taille*(2*rand(1,nb_donnees_aberrantes)-1)];
n = n+nb_donnees_aberrantes;

% Affichage des donnees bruitees :
plot(x_donnees_bruitees,y_donnees_bruitees,'k+','MarkerSize',10,'LineWidth',2);
axis(bornes);
lg = legend('~Cercle reel $(C_0,R_0)$', ...
		'~Donnees (bruitees + aberrantes)', ...
		'Location','Best');
set(lg,'Interpreter','Latex');
grid on;
