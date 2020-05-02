clear;
close all;

taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Fenetre d'affichage :
figure('Name','Donnees situees au voisinage d''une droite', ...
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

% Parametres de la droite reelle :
theta_0 = pi*rand;
cos_theta_0 = cos(theta_0);
sin_theta_0 = sin(theta_0);
marge = 5;
rho_0 = (taille-marge)*(2*rand-1);

% Affichage de la droite reelle :
droite_horizontale = abs(cos_theta_0)<abs(sin_theta_0);
pas = 0.01;
x_droite_reelle = -taille:pas:taille;
y_droite_reelle = -taille:pas:taille;
if droite_horizontale
	y_droite_reelle = (rho_0-cos_theta_0*x_droite_reelle)/sin_theta_0;
else
	x_droite_reelle = (rho_0-sin_theta_0*y_droite_reelle)/cos_theta_0;
end
plot(x_droite_reelle,y_droite_reelle,'r-','LineWidth',3);

% Donnees non bruitees :
n = 50;
if droite_horizontale
	x_donnees = taille*(2*rand(1,n)-1);
	y_donnees = (rho_0-cos_theta_0*x_donnees)/sin_theta_0;
else
	y_donnees = taille*(2*rand(1,n)-1);
	x_donnees = (rho_0-sin_theta_0*y_donnees)/cos_theta_0;
end

% Donnees bruitees :
sigma = 2;
x_donnees_bruitees = x_donnees+sigma*randn(1,n);
y_donnees_bruitees = y_donnees+sigma*randn(1,n);
indices_visibles = find(x_donnees_bruitees>-taille & ...
			x_donnees_bruitees<taille & ...
			y_donnees_bruitees>-taille & ...
			y_donnees_bruitees<taille);
x_donnees_bruitees = x_donnees_bruitees(indices_visibles);
y_donnees_bruitees = y_donnees_bruitees(indices_visibles);
n = length(indices_visibles);

% Affichage des donnees bruitees :
plot(x_donnees_bruitees,y_donnees_bruitees,'k+','MarkerSize',10,'LineWidth',2);
axis(bornes);
lg = legend('~Droite reelle', ...
	'~Donnees bruitees', ...
	'Location','Best');
set(lg,'Interpreter','Latex');
grid on;
