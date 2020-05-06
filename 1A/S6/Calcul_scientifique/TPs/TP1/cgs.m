%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Calcul scientifique
% TP1 - Orthogonalisation de Gram-Schmidt
% cgs.m
%--------------------------------------------------------------------------

function Q = cgs(A)

    % Recuperation du nombre de colonnes de A
    [~, m] = size(A);
    
    % Initialisation de la matrice Q avec la matrice A
    Q = A;
    
    %------------------------------------------------
    % A remplir
    % Algorithme de Gram-Schmidt classique
    %------------------------------------------------
    for i = 1 : m
        y = A(:, i);
        for j = 1 : i - 1
            Q(:, i) = Q(:, i) - Q(:, j) * transpose(y) * Q(:, j);
        end
        Q(:, i) = Q(:, i) / norm(Q(:, i));
    end
end