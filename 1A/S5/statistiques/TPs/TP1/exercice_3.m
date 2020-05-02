donnees_occultees;

% Le rayon R_0 est connu :
R_0 = 8;

% Tirage aleatoire uniforme de positions du centre C : 
nb_tests = 10000;
C_tests = (taille-R_0)*(2*rand(nb_tests,2)-1);
[C_estime, R_estime] = estimation_2(x0,y0,C_tests,R_0);

% Affichage du cercle estime :
x_cercle_estime = C_estime(1) + R_estime * cos(theta_cercle);
y_cercle_estime = C_estime(2) + R_estime * sin(theta_cercle);
plot(x_cercle_estime([1:end 1]),y_cercle_estime([1:end 1]),'b','LineWidth',3);
lg = legend('~Cercle reel $(C_0,R_0)$', ...
		'~Donnees bruitees', ...
		'~Cercle estime $(C^*,R_0)$', ...
		'Location','Best');
set(lg,'Interpreter','Latex');