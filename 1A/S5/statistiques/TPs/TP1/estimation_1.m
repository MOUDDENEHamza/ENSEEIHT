function C_estime = estimation_1(x_donnees_bruitees,y_donnees_bruitees,C_tests,R_0)
    [n, p] = size(x_donnees_bruitees);
    C_x = repmat(C_tests(:, 1), 1, p);
    C_y = repmat(C_tests(:, 2), 1, p);
    x_C_x = repmat(x_donnees_bruitees, 1000, 1) - C_x;
    y_C_y = repmat(y_donnees_bruitees, 1000, 1) - C_y;
    L = (sqrt(x_C_x.^2 + y_C_y.^2) - R_0).^2;
    Vecteur = sum(L, 2);
    indice = find(Vecteur==min(Vecteur));
    C_estime = [C_tests(indice, 1) C_tests(indice, 2)];
end