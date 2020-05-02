function coeff_compression = coeff_compression_texte(texte,texte_encode)
    coeff_compression = (8 * length(texte)) / length(texte_encode);
end