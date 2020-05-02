function [a_estime,b_estime] = estimation_1(x_donnees_bruitees,y_donnees_bruitees,psi_tests)
    n = size(psi_tests,1);
    p = size(x_donnees_bruitees,2);
    x_1 = x_donnees_bruitees - mean(x_donnees_bruitees);
    y_1 = y_donnees_bruitees - mean(y_donnees_bruitees);
    x_new = repmat(x_1,n,1);
    y_new = repmat(y_1,n,1);
    psi_new = repmat(psi_tests,1,p);
    M = (y_new - tan(psi_new).*x_new).^2;
    Vecteur = sum(M,2);
    indice =  find(Vecteur == min(Vecteur));
    a_estime = tan(psi_tests(indice));
    b_estime = (mean(y_donnees_bruitees) - (mean(x_donnees_bruitees))*a_estime);
end
