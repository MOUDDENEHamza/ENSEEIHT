
let affiche_menu () =
  print_string "\n 0 - Quitter\n";
  print_string " 1 - Chercher un mot\n";
  print_string " 2 - Ajouter un mot\n";
  print_string " 3 - Retirer un mot\n";
  print_string " 4 - Afficher le dictionnaire\n\n> "


let gere_dico fd fr lm em nouveau appartient ajout retrait affiche mots =
   let dico = ref (List.fold_right ajout mots (nouveau fd fr))
   and fin = ref false
   in
     while not !fin
     do
       affiche_menu ();
       let commande = read_line ()
       in
         match commande with
           "0" -> fin := true;
         | "1" -> print_string "\nEntrer le mot à rechercher :\n";
                  let mot = lm ()
                  in
                    print_newline ();
                    print_string " -> ";
                    em mot;
                    if(appartient mot !dico)
                    then print_string " présent\n\n"
                    else print_string " non présent\n\n";
         | "2" ->  print_string "\nEntrer le mot à ajouter :\n";
                  let mot = lm ()
                  in
                    dico := ajout mot !dico;
                    print_newline ();
                    print_string " -> "; em mot; print_string " ajouté\n\n";
         | "3" ->  print_string "\nEntrer le mot à retirer :\n";
                  let mot = lm ()
                  in
                    dico := retrait mot !dico;
                    print_newline ();
                    print_string " <- ";
                    em mot; 
                    print_string " retiré\n\n";
         | "4" -> print_string "\n------------------------------\n\n";
                  affiche em !dico;
                  print_string "\n------------------------------\n\n";
         | _   -> print_string "\n\n**** Erreur de Saisie ****\n\n";
      done
       
