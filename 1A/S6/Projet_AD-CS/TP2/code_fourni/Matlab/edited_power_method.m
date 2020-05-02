function [ w, v0, it, flag ] = edited_power_method(A, m, eps, kmax)
    
    n = size(A,1); %Number of row of Matrix A
    %Question 3 Modification :
    %OLD: v = ones(n,1); v = v / norm(v); % Random normalized Vector
    %NEW:
    v = randn(n, m); v = mgs(v); %Randomized orthonormal n*m Matrix
    
    
    beta = norm(transpose(v)*A*v); %Eventual Eigenvalues
    cv = false; %Did it converge?
    k = 0;  %Number of iterations
    
    while(~cv)
        y = A*v;
        v = y/norm(y);
        beta_old = beta;
        %Question 3 Modification :
        %OLD : beta = transpose(v) * y
        %NEW:
        beta = norm(transpose(v)*y);
        err1 = (abs(beta - beta_old) / abs(beta_old));
        k = k + 1;
        cv = ( (err1 <= eps) | (k >= kmax));
    end
    
    it = k;
    w = beta;
    v0 = v;
    if (cv)
        flag = 0; %raise flag = 0 : converged!
    else
        flag = -3; %raise flag = -3 : could not converge!
    end