function [cos_theta_estime,sin_theta_estime,rho_estime] = estimation_4(x_donnees_bruitees,y_donnees_bruitees)
    n = size(x_donnees_bruitees,2);
    C = zeros(n,2);
    x_1 = x_donnees_bruitees - mean(x_donnees_bruitees);
    y_1 = y_donnees_bruitees - mean(y_donnees_bruitees);
    C(:,1) = transpose(x_1);
    C(:,2) = transpose(y_1);
    M = transpose(C)*C;
    [vecteurs_propres,matrice_propres] = eig(M);
    indice = find(diag(matrice_propres) == min(diag(matrice_propres)));
    Vecteur = vecteurs_propres(:,indice);
    cos_theta_estime = Vecteur(1);
    sin_theta_estime = Vecteur(2);
    rho_estime = mean(x_donnees_bruitees)*cos_theta_estime + mean(y_donnees_bruitees)*sin_theta_estime;
end
