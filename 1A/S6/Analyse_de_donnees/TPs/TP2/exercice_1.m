clear;
close all;

donnees;

maximum_vraisemblance;

% Estimation des parametres par les moindres carres ordinaires :
x = xy_donnees_bruitees(1, :)';
y = xy_donnees_bruitees(2, :)';
Beta_chapeau = MCO(x, y);

[C_chapeau, theta_0_chapeau, a_chapeau, b_chapeau] = conversion(Beta_chapeau);

% Affichage de l'ellipse estimee par MCO :
affichage_ellipse(C_chapeau, theta_0_chapeau, a_chapeau, b_chapeau, theta_points_ellipse, 'r-');
lg = legend('Ellipse', 'Donnees bruitees', 'Estimation par MV', 'Estimation par MCO', 'Location', 'Best');
set(lg,'FontSize', 15);

% Calcul du score de l'ellipse estimee par MCO :
R_chapeau = [cos(theta_0_chapeau) -sin(theta_0_chapeau) ; sin(theta_0_chapeau) cos(theta_0_chapeau)];
c_chapeau = sqrt(a_chapeau * a_chapeau - b_chapeau * b_chapeau);
F_1_chapeau = R_chapeau * [c_chapeau ; 0] + C_chapeau;
F_2_chapeau = R_chapeau * [-c_chapeau ; 0] + C_chapeau;
fprintf('Score de l''estimation par MCO = %.3f\n', score(F_1, F_2, a, F_1_chapeau, F_2_chapeau, a_chapeau));