function bornes = partitionnement(selection_frequences)
    bornes = zeros(2, length(selection_frequences));
    bornes(1, 1) = 0;
    bornes(2, 1) = selection_frequences(1); 
    for i = 2:length(selection_frequences)
        bornes(1, i) = bornes(2, i - 1);
        bornes(2, i) = bornes(1, i) + selection_frequences(i);
    end
end