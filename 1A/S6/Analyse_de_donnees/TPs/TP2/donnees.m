clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);
figure('Name','Simulation des donnees','Position',[0.33*L,0,0.67*L,H]);

% Parametres de l'ellipse :
taille = 20;
c = 2*taille/5*(rand+0.25);
a = 2*taille/5*(rand+1);
if a<c
	aux = a;
	a = c;
	c = aux;
end
b = sqrt(a^2-c^2);
C = (taille-a)*(2*rand(2,1)-1);
theta_0 = 2*pi*rand;

% Affichage de l'ellipse :
nb_points_ellipse = 100;
deux_pi = 2*pi;
theta_points_ellipse = deux_pi/nb_points_ellipse:deux_pi/nb_points_ellipse:deux_pi;
affichage_ellipse(C,theta_0,a,b,theta_points_ellipse,'g-');
hx = xlabel('$x$','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('$y$','FontSize',20);
set(hy,'Interpreter','Latex');
axis equal;
hold on;

% Foyers :
R = [cos(theta_0) -sin(theta_0) ; sin(theta_0) cos(theta_0)];
F_1 = R*[c ; 0]+C;
F_2 = R*[-c ; 0]+C;

% Calcul et affichage des donnees bruitees :
n = 200;
theta_donnees_bruitees = 2*pi*rand(1,n)+2*pi*rand;
xy_donnees_bruitees = [a*cos(theta_donnees_bruitees) ; b*sin(theta_donnees_bruitees)];
xy_donnees_bruitees = R*xy_donnees_bruitees+C*ones(1,n);
sigma = 1;
xy_donnees_bruitees = xy_donnees_bruitees+sigma*randn(2,n);
plot(xy_donnees_bruitees(1,:),xy_donnees_bruitees(2,:),'k*');

echelle = [-taille taille -taille taille];
axis(echelle);
lg = legend('Ellipse','Donnees bruitees','Location','Best');
set(lg,'FontSize',15);
