donnees;


% Tirages aleatoires de l'angle psi (loi uniforme) :
nb_tests = 100;
psi_tests = pi*(rand(nb_tests,1)-0.5);
[a_estime,b_estime] = estimation_1(x_donnees_bruitees,y_donnees_bruitees,psi_tests);

% Affichage de la droite de regression estimee par maximum de vraisemblance :
x_droite_estimee = x_droite_reelle;
y_droite_estimee = y_droite_reelle;
if abs(a_estime)<1
	y_droite_estimee = a_estime*x_droite_estimee+b_estime;
else
	x_droite_estimee = (y_droite_estimee-b_estime)/a_estime;
end
plot(x_droite_estimee,y_droite_estimee,'b','LineWidth',3);
axis(bornes);
lg = legend('~Droite reelle', ...
	'~Donnees bruitees', ...
	'~$D_{YX}$ estimee par MV', ...
	'Location','Best');
set(lg,'Interpreter','Latex');

% Calcul et affichage de l'ecart angulaire :
theta_estime = atan(a_estime)+pi/2;
EA = min(abs([theta_estime-theta_0 theta_estime-theta_0+pi theta_estime-theta_0-pi]));
fprintf('D_YX estimee par maximum de vraisemblance : ecart angulaire = %.2f degres\n',EA/pi*180);
