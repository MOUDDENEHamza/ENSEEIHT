function [C_estime, R_estime] = estimation_2(x_donnees_bruitees,y_donnees_bruitees,C_tests,R_0)
    p = size(x_donnees_bruitees, 2);
    C_x = repmat(C_tests(:, 1), 1, p);
    C_y = repmat(C_tests(:, 2), 1, p);
    x_C_x = repmat(x_donnees_bruitees, 10000, 1) - C_x;
    y_C_y = repmat(y_donnees_bruitees, 10000, 1) - C_y;
    R_tests = 2 * R_0 * rand(10000, 1);
    L = (sqrt(x_C_x.^2 + y_C_y.^2) - R_tests * ones(1, p)).^2;
    [valeur_min, indice] = min(sum(L,2));
    C_estime = C_tests(indice, :);
    R_estime = R_tests(indice, :);
end