function [X,Y] = vectorisation(I)
    X = I(:, 1 : size(I, 2) - 1);
    Y = I(:, 2 : size(I, 2));
    X = X(:);
    Y = Y(:);
end