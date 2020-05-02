function frequences = calcul_frequences(texte,alphabet)
    frequences = zeros(1, length(alphabet));
    for i = 1:length(alphabet)
        for j = 1:length(texte)
            if texte(j) == alphabet(i)
                frequences(i) = frequences(i) + 1 / length(texte);
            end
        end
    end
end