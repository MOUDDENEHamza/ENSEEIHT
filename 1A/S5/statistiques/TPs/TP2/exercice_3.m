donnees;

% Tirages aleatoires de l'angle theta (loi uniforme) :
nb_tests = 100;
theta_tests = pi*rand(nb_tests,1);
[theta_estime,rho_estime] = estimation_3(x_donnees_bruitees,y_donnees_bruitees,theta_tests);

% Affichage de la droite de regression estimee par maximum de vraisemblance :
x_droite_estimee = x_droite_reelle;
y_droite_estimee = y_droite_reelle;
if abs(pi/2-theta_estime)<pi/4
	y_droite_estimee = (rho_estime-x_droite_estimee*cos(theta_estime))/sin(theta_estime);
else
	x_droite_estimee = (rho_estime-y_droite_estimee*sin(theta_estime))/cos(theta_estime);
end
plot(x_droite_estimee,y_droite_estimee,'b','LineWidth',3);
axis(bornes);
lg = legend('~Droite reelle', ...
	'~Donnees bruitees', ...
	'~$D_\perp$ estimee par MV', ...
	'Location','Best');
set(lg,'Interpreter','Latex');

% Calcul et affichage de l'ecart angulaire :
EA = min(abs([theta_estime-theta_0 theta_estime-theta_0+pi theta_estime-theta_0-pi]));
fprintf('D_perp estimee par maximum de vraisemblance : ecart angulaire = %.2f degres\n',EA/pi*180);
