% projection de Rayleigh-Ritz
% Données
% A : matrice dont on cherche des couples propres
% V : ensemble de m vecteurs orthonormés

% Résultats
% W : vecteur contenant les approximations des valeurs propres
% V : matrice des vecteurs propres correspondant
function [ W, V ] = rayleigh_ritz_projection( A, V )

H = V'*(A*V);

[VH, DH] = eig(H);
[W, indice] = sort(diag(DH), 'descend');

V = V*VH(:, indice);

end
