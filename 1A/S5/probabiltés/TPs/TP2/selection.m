function [selection_frequences,selection_alphabet] = selection(frequences,alphabet);
    selection_frequences = frequences(find(frequences>0));
    selection_alphabet = alphabet(find(frequences>0));
end