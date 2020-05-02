function resultat = score(F_1,F_2,a,F_1_estime,F_2_estime,a_estime)

a_max = max(a,a_estime);
x_min = min([F_1(1),F_2(1),F_1_estime(1),F_2_estime(1)])-a_max;
x_max = max([F_1(1),F_2(1),F_1_estime(1),F_2_estime(1)])+a_max;
y_min = min([F_1(2),F_2(2),F_1_estime(2),F_2_estime(2)])-a_max;
y_max = max([F_1(2),F_2(2),F_1_estime(2),F_2_estime(2)])+a_max;

pas_echantillonnage = 0.25;
[X,Y] = meshgrid(x_min : pas_echantillonnage : x_max, y_min : pas_echantillonnage : y_max);

distance_P_F_1 = sqrt((X-F_1(1)).*(X-F_1(1))+(Y-F_1(2)).*(Y-F_1(2)));
distance_P_F_2 = sqrt((X-F_2(1)).*(X-F_2(1))+(Y-F_2(2)).*(Y-F_2(2)));

distance_P_F_1_estime = sqrt((X-F_1_estime(1)).*(X-F_1_estime(1))+(Y-F_1_estime(2)).*(Y-F_1_estime(2)));
distance_P_F_2_estime = sqrt((X-F_2_estime(1)).*(X-F_2_estime(1))+(Y-F_2_estime(2)).*(Y-F_2_estime(2)));

indices_union = find(distance_P_F_1+distance_P_F_2<2*a | distance_P_F_1_estime+distance_P_F_2_estime<2*a_estime);
indices_intersection = find(distance_P_F_1+distance_P_F_2<2*a & distance_P_F_1_estime+distance_P_F_2_estime<2*a_estime);

union = length(indices_union(:));
intersection = length(indices_intersection(:));

resultat = intersection/union;