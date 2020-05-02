function [a_estime,b_estime] = estimation_2(x_donnees_bruitees,y_donnees_bruitees)
    n = size(x_donnees_bruitees,2);
    A = zeros(n,2);
    A(:,1) = transpose(x_donnees_bruitees);
    A(:,2) = transpose(ones(1,n));
    B = transpose(y_donnees_bruitees);
    A_plus =  inv(transpose(A)*A)*transpose(A)*B;
    a_estime = A_plus(1);
    b_estime = A_plus(2);
end
