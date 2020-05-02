% procédé d'orthogonalisation de Gram-Schmidt (modifié)
% où les p premières colonnes de A sont déjà orthonormales
% on n'orthonormalise que les m-p dernières colonnes
% (par rapport aux p premières et à elles-même)

function Q = mgs_block(A, p)

[n, m] = size(A);
Q = A;

for i = p+1:m
    for j = 1:i-1
        h = Q(:,j)'*Q(:,i);
        Q(:,i) = Q(:,i) - h*Q(:,j);
    end
    Q(:,i) = Q(:,i)/norm(Q(:,i));
end


end
