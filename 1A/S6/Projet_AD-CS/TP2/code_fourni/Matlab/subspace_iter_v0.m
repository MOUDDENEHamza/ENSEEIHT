% version basique de la méthode de l'espace invariant (v0)

% Données
% A          : matrice dont on cherche des couples propres
% m          : nombre de valeurs propres que l'on veut calculer
% eps        : seuil pour déterminer si un vecteur de l'espace invariant a convergé
% maxit      : nombre maximum d'itération de la méthode

% Résultats
% W : vecteur contenant les valeurs propres (ordre décroissant)
% V : matrice des vecteurs propres correspondant
% it : nombre d'itérations de la méthode
% flag : indicateur sur la terminaison de l'algorithme
    %  flag = 0  : on a convergé (on a calculé m valeurs propores)
    %  flag = -3 : on n'a pas convergé en maxit itérations

function [ W, V, it, flag ] = subspace_iter_v0( A, m, eps, maxit )

    % calcul de la norme de A (pour le critère de convergence d'un vecteur)
    normA = norm(A, 'fro');

    n = size(A,1);
    
    % indicateur de la convergence
    conv = 0;
    % numéro de l'itération courante
    k = 0;

    % on génère un ensemble initial de m vecteurs orthogonaux
    V = randn(n, m);
    V = mgs(V);

    % rappel : conv = invariance du sous-espace V ||AV - VH||/||A|| <= eps
    while (~conv & k < maxit),
        
        k = k + 1;
        
        % calcul de Y = A.V
        Y = A*V;
        % calcul du quotient de Rayleigh V^T.A.V
        H = V'*Y;
        % vérification de la convergence
        aux = Y - V*H;
        conv = (norm(aux, 'fro')/normA < eps);
        
        % orthonormalisation
        V = mgs(Y);
        
    end

    % décomposition spectrale du quotient de Rayleigh H
    [VH, DH] = eig(H);
    
    % on range les valeurs propres dans l'ordre décroissant
    [W, indice] = sort(diag(DH), 'descend');
    % on permute les vecteurs propres en conséquence
    S = VH(:, indice);
    
    %orthoS = norm(eye(size(S,1)) - S * S')
    %orthoV = norm(eye(size(V,2)) - V' * V)
    
    % les m vecteurs propres de A
    V = V*S;
    %orthoV = norm(eye(size(V,2)) - V' * V)
        
    it = k;

    if (conv)
      flag = 0;
    else
      flag = -3;
    end
    
end
