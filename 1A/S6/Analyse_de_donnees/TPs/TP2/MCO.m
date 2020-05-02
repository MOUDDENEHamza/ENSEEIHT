function Beta_chapeau = MCO(x, y)
    A = [x.^2 (x .* y) y.^2 x y ones(size(x, 1), 1)];
    Beta_chapeau = pinv(A) * y; 
end