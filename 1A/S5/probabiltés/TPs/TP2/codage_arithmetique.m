function [borne_inf,borne_sup] = codage_arithmetique(texte,selection_alphabet,bornes)
  borne_inf = 0;
  borne_sup = 1;
  n = length(texte);
  m = length(selection_alphabet);
  for i = 1:n
      for j = 1:m
          if texte(i) == selection_alphabet(j)
              largeur = borne_sup - borne_inf;
              borne_sup = borne_inf + largeur * bornes(2, j);
              borne_inf = borne_inf + largeur * bornes(1, j);
          end
      end
  end
end