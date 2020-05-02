function [theta_estime,rho_estime] = estimation_3(x_donnees_bruitees,y_donnees_bruitees,theta_tests)
    n = size(theta_tests,1);
    p = size(x_donnees_bruitees,2);
    x_1 = x_donnees_bruitees - mean(x_donnees_bruitees);
    y_1 = y_donnees_bruitees - mean(y_donnees_bruitees);
    x_new = repmat(x_1,n,1);
    y_new = repmat(y_1,n,1);
    theta_new = repmat(theta_tests,1,p);
    M = (x_new.*cos(theta_tests) + y_new.*sin(theta_tests)).^2
    Vecteur = sum(M,2);
    indice =  find(Vecteur == min(Vecteur));
    theta_estime = theta_tests(indice);
    rho_estime = mean(x_donnees_bruitees)*cos(theta_estime) + mean(y_donnees_bruitees)*sin(theta_estime);
end