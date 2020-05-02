function Q = mgs(A)

[n, m] = size(A);
Q = A;

for i = 1:m
    for j = 1:i-1
        h = Q(:,j)'*Q(:,i);
        Q(:,i) = Q(:,i) - h*Q(:,j);
    end
    Q(:,i) = Q(:,i)/norm(Q(:,i));
end


end
