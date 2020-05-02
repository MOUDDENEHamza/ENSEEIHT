function coeff_compression_avant_decorrelation = coeff_compression_image(histogramme,dico)
        n_bits_sans_compression = 8 * sum(histogramme);
        n_bits_avec_compression = 0;
        for i = 1:length(histogramme)
            n_bits_avec_compression = n_bits_avec_compression + histogramme(i) * length(dico{i,2});
        end
        coeff_compression_avant_decorrelation = n_bits_sans_compression / n_bits_avec_compression;
end