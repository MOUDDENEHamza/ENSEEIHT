exercice_1;


% Resolution du systeme lineaire AX = B :
[a_estime,b_estime] = estimation_2(x_donnees_bruitees,y_donnees_bruitees);

% Affichage de la droite de regression estimee par resolution d'un systeme lineaire :
x_droite_estimee = x_droite_reelle;
y_droite_estimee = y_droite_reelle;
if abs(a_estime)<1
	y_droite_estimee = a_estime*x_droite_estimee+b_estime;
else
	x_droite_estimee = (y_droite_estimee-b_estime)/a_estime;
end
plot(x_droite_estimee,y_droite_estimee,'g','LineWidth',3);
lg = legend('~Droite reelle', ...
	'~Donnees bruitees', ...
	'~$D_{YX}$ estimee par MV', ...
	'~$D_{YX}$ estimee par resolution de AX = B', ...
	'Location','Best');
set(lg,'Interpreter','Latex');

% Calcul et affichage de l'ecart angulaire :
theta_estime = atan(a_estime)+pi/2;
EA = min(abs([theta_estime-theta_0 theta_estime-theta_0+pi theta_estime-theta_0-pi]));
fprintf('D_YX estimee par resolution d''un systeme lineaire : ecart angulaire = %.2f degres\n',EA/pi*180);
