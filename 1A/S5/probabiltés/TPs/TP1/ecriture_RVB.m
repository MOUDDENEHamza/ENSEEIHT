function image_RVB = ecriture_RVB(image_originale)
    image_RVB = ones( size(image_originale, 1) / 2 , size(image_originale, 2) / 2 , 3 );
    V1 = image_originale(1:2:end , 1:2:end);
    V2 = image_originale(2:2:end , 2:2:end);
    image_RVB (: , : , 2) = (V1 + V2) / 2;
    image_RVB (: , : , 3) = image_originale(2:2:end , 1:2:end);
    image_RVB (: , : , 1) = image_originale(1:2:end , 2:2:end);
end