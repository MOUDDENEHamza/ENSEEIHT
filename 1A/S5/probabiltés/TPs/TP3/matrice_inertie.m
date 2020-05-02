function [C_x,C_y,M] = matrice_inertie(E_x,E_y,G_norme_E)
    N = size(E_x);
    pi = sum(G_norme_E(1:N));
    C_x = sum(G_norme_E(1:N) .* E_x(1:N) / pi);
    C_y = sum(G_norme_E(1:N) .* E_y(1:N) / pi);
    M(1, 1) = sum((1 / pi) * G_norme_E(1:N) .* (E_x - C_x).^ 2);
    M(1, 2) = sum((1 / pi) * G_norme_E(1:N) .* (E_x(1:N) - C_x).*(E_y(1:N) - C_y));
    M(2, 1) = M(1, 2);
    M(2, 2) = sum((1 / pi) * (G_norme_E(1:N) .* (E_y(1:N) - C_y).^2));
end