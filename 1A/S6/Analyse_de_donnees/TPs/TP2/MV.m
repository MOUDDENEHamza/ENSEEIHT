function [F_1_chapeau,F_2_chapeau,a_chapeau] = MV(xy_donnees_bruitees,x_F_aleatoire,y_F_aleatoire,a_aleatoire)

n = size(xy_donnees_bruitees,2);
nb_tirages = length(a_aleatoire);

sommes_ecarts_carres = [];
for k = 1:nb_tirages
	x_F_1_test = x_F_aleatoire(1,k);
	y_F_1_test = y_F_aleatoire(1,k);
	P_i_F_1_test = [x_F_1_test;y_F_1_test]*ones(1,n)-xy_donnees_bruitees;
	distances_P_i_F_1_test = sqrt(sum(P_i_F_1_test.*P_i_F_1_test));
	x_F_2_test = x_F_aleatoire(2,k);
	y_F_2_test = y_F_aleatoire(2,k);
	P_i_F_2_test = [x_F_2_test;y_F_2_test]*ones(1,n)-xy_donnees_bruitees;
	distances_P_i_F_2_test = sqrt(sum(P_i_F_2_test.*P_i_F_2_test));
	a_test = a_aleatoire(k);
	ecarts_test = distances_P_i_F_1_test+distances_P_i_F_2_test-2*a_test;
	sommes_ecarts_carres = [sommes_ecarts_carres sum(ecarts_test.*ecarts_test)];
end
[E_min,indice_min] = min(sommes_ecarts_carres);

F_1_chapeau = [x_F_aleatoire(1,indice_min) ; y_F_aleatoire(1,indice_min)];
F_2_chapeau = [x_F_aleatoire(2,indice_min) ; y_F_aleatoire(2,indice_min)];
a_chapeau = a_aleatoire(1,indice_min);
