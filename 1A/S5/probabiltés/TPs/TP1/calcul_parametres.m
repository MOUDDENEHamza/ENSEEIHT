function [r, a, b] = calcul_parametres(X, Y)
    sigma_x2 = mean(X.*X) - mean(X)^2;
    sigma_x = sqrt(sigma_x2);
    sigma_y2 = mean(Y .* Y) - mean(Y)^2;
    sigma_y = sqrt(sigma_y2);
    sigma_xy = mean(X .* Y) - mean(X) * mean(Y);
    r = sigma_xy / (sigma_x * sigma_y);
    a = sigma_xy / sigma_x2;
    b = -a * mean(X) + mean(Y); 
end