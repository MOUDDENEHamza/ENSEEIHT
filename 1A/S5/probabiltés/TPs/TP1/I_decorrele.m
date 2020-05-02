function I = I_decorrele(I)
    for i = 0:size(I, 2) - 2
        I(:, size(I, 2) - i) = I(:, size(I, 2) - i) - I(:, size(I, 2) - i - 1);
    end 
end