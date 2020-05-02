-------------------------------------------------------------------------------
--  Fichier  : main.adb
--  Auteur   : MOUDDENE Hamza & CAZES Noa
--  Objectif : Programme principal
--  Crée     : Dimanche Nov 25 2019
--------------------------------------------------------------------------------

 
with Arbre_Genealogique;	use Arbre_Genealogique;
with Registre;			use Registre;
with Input;			use Input;
with Display_Shell;		use Display_Shell;
with Foret;			use Foret;


procedure main is
    
    
    F : Forest;
    Ab, Old_Ab, Ab1, Ab2 : T_ABG;
    Data : T_Node;
    Registre : T_Registre;
    ID, ID1, ID2, New_ID, Choice, Flag, Generation: Integer;
	

begin
    -- Afficher la barre d'initialisation.
    Init_Bar;
    
    -- Initialiser Forest.  Forest est vide.
    Initialize_Forest (F);
    
    <<RESTART>>
    loop
        Display_Menu;
        Input_Choice (Choice);
        
        case Choice is
      
            when 1 =>  -- Créer un arbre minimal.
                begin
                    -- Entrer l'ID de l'individu que vous souhaitez créer son arbre.
                    loop
                        Input_ID ( ID, "Entrez l'ID de l'individu : ");
                        if (Is_Present_Forest (F, ID)) then
                            Display_TREE_IN_FOREST;
                        end if;
                        exit when (not (Is_Present_Forest (F, ID)));
                    end loop;
                    Initialize_Data (Data, ID);
                    
                    -- Création du nouveau noeud.
                    Initialize_Genealogical_Tree (Ab);
                    Creer_Arbre_Minimal (Ab, Data);
                    
                    -- Ajouter le nouvel arbre dans la foret.
                    Add_To_Forest (F, Ab);
                    
                    -- Insérer le nouveau parent dans le registre.
                    Inserer_R (Registre, ID, Demander_Donnee);
                    
                    -- Affichage.
                    Display_Success_Minimal_Tree_Ceation;
                    Afficher_Arbre_Noeud (Ab, ID);
                
                exception -- Gérez les exceptions.
                    when ARBRE_NON_VIDE_EXCEPTION =>
                        Display_ARBRE_NON_VIDE_EXCEPTION;
                        goto RESTART;
                end;

            when 2 =>  -- Ajouter un parent.
                <<TRY>>
                begin
                    -- Entrer l'ID de l'individu que vous souhaitez connaitre ses ancetres.
                    Input_ID ( ID, "Entrez l'ID de l'individu racine d'un arbre dans la foret : ");
					
                    -- Trouver l'arbre dans la foret.
                    Initialize_Genealogical_Tree (Ab);
                    Find_Tree (F, Ab, ID);
                    Old_Ab := Ab;
                    
                    -- Entrer l'ID de l'individu qu'on lui ajoutera un parent.
                    Input_ID ( ID1, "Entrez l'ID de l'individu qu'on lui ajoutera un parent : ");
                    
                    -- Entrer 0 s'il s'agit d'un père, 1 si c'est la mère.
                    Input_Flag (Flag);
                    
                    -- Génerer un ID unique.
                    Input_ID ( New_ID, "Entrez l'ID du nouveau parent : ");
                    Initialize_Data (Data, New_ID);
                               
                    -- Ajout du nouveau parent.
                    Ajouter_Parent (Ab, Data, ID1, Flag);
                    
                    -- Mettre à jour la foret.
                    Update_Forest (F, Old_Ab, Ab);
                    
                    -- Affichage.
                    Inserer_R (Registre, New_ID, Demander_Donnee);
                    Display_Success_Add_Parent;
                    Afficher_Arbre_Noeud (Ab, ID);

                exception -- Gérez les exceptions.
                    when ARBRE_VIDE_EXCEPTION =>
                        Display_ARBRE_VIDE_EXCEPTION ("L'ajout du parent a échoué.", 1);
                        goto RESTART;
                    when ID_ABSENT_EXCEPTION => 
                        Display_ID_ABSENT_EXCEPTION ("L'ajout du parent a échoué.", 0);
                        goto TRY;
                    when DEUX_PARENTS_PRESENTS_EXCEPTION => 
                        Display_DEUX_PARENTS_PRESENTS_EXCEPTION;
                        goto TRY;
                    when ABSENT_TREE_EXCEPTION => 
                        Display_Exception ("L'ID entré n'est pas racine d'un arbre dans la foret. Ajouter parent échoué.", 1);
                        goto Restart;
                end;

            when 3 =>  -- Obtenir le nombre d'ancêtres.
                begin
                    -- Entrer l'ID de l'arbre dans la foret.
                    Input_ID ( ID, "Entrez l'ID de la racine d'arbre dans la foret : ");
                    
                    -- Trouver l'arbre dans la foret.
                    Initialize_Genealogical_Tree (Ab);
                    Find_Tree (F, Ab, ID);
                    
                    -- Entrer l'ID de l'arbre dans la foret.
                    Input_ID ( ID, "Entrez l'ID de l'individu que vous souhaitez connaitre le nombre des ancetres dans cet arbre : ");
                                       
                    -- Afficher le nombre d'ancetres.
                    Display_Number_Ancestors (Ab, ID);
                    
                exception -- Gérez les exceptions.
                    when ARBRE_VIDE_EXCEPTION =>
                        Display_ARBRE_VIDE_EXCEPTION ("Nombre d'ancêtres a échoué.", 1);
                        goto RESTART;
                    when ID_ABSENT_EXCEPTION =>
                        Display_ID_ABSENT_EXCEPTION ("Nombre d'ancetres a échoué.", 1);
                        goto RESTART;
                    when ABSENT_TREE_EXCEPTION => 
                        Display_Exception ("L'ID entré n'est pas racine d'un arbre dans la foret. Ajouter parent échoué.", 1);
                        goto Restart;
                end;

            when 4 =>  -- Obtenir l'ensemble des ancêtres situés à une certaine génération.
                begin
                    -- Entrer l'ID de l'arbre dans la foret.
                    Input_ID ( ID, "Entrez l'ID de la racine d'arbre dans la foret : ");
                    
                    -- Trouver l'arbre dans la foret.
                    Initialize_Genealogical_Tree (Ab);
                    Find_Tree (F, Ab, ID);
                    
                    -- Entrer l'ID de l'individu que vous souhaitez connaitre ses ancetres.
                    Input_ID ( ID, "Entrez l'ID de l'individu que vous souhaitez connaitre ses ancetres sur N générations dans cet arbre : ");
                
                    -- Entrez la géneration de ses ancetres.
                    Input_Generation (Generation);
                
                    -- Obtenir l'ensemble de ces ancetres.
                    Ancetres_N_Generation (Ab, ID, Generation);

                exception -- Gérez les exceptions.
                    when ARBRE_VIDE_EXCEPTION =>
                        Display_ARBRE_VIDE_EXCEPTION ("Nombre d'ancêtres situés à la génération n a échoué.", 1);
                        goto RESTART;
                    when ID_ABSENT_EXCEPTION =>
                        Display_ID_ABSENT_EXCEPTION ("Nombre d'ancetres situés à la générations n a échoué.", 1);
                        goto RESTART;
                    when ABSENT_TREE_EXCEPTION => 
                        Display_Exception ("L'ID entré n'est pas racine d'un arbre dans la foret. Ajouter parent échoué.", 1);
                        goto Restart;
                end;

            when 5 =>  -- Afficher l'arbre génealogqiue.
                begin
                    -- Entrer l'ID de l'arbre dans la foret.
                    Input_ID ( ID, "Entrez l'ID de la racine d'arbre dans la foret : ");
                    
                    -- Trouver l'arbre dans la foret.
                    Initialize_Genealogical_Tree (Ab);
                    Find_Tree (F, Ab, ID);
                    
                    -- Entrez l'ID de l'individu que vous souhaitez afficher son arbre génealogique.
                    Input_ID ( ID, "Entrez l'ID de l'individu que vous souhaitez afficher son arbre génealogique dans cet arbre : ");
                
                    -- Afficher l'arbre correspondante a l'ID lu au clavier.
                    Afficher_Arbre_Noeud (Ab, ID);
                
                exception -- Gérez les exceptions.
                    when ARBRE_VIDE_EXCEPTION =>
                        Display_ARBRE_VIDE_EXCEPTION ("Afficher l'arbre génealogique a échoué.", 1);
                        goto RESTART;
                    when ID_ABSENT_EXCEPTION =>
                        Display_ID_ABSENT_EXCEPTION ("Afficher l'arbre génealogique a échoué.", 1);
                        goto RESTART;
                    when ABSENT_TREE_EXCEPTION => 
                        Display_Exception ("L'ID entré n'est pas racine d'un arbre dans la foret. Ajouter parent échoué.", 1);
                        goto Restart;
                end;

            when 6 =>  -- Supprimer l'arbre généalogique.
                begin
                    -- Entrer l'ID de l'arbre dans la foret.
                    Input_ID ( ID, "Entrez l'ID racine d'arbre dans la foret : ");
                    
                    -- Trouver l'arbre dans la foret.
                    Initialize_Genealogical_Tree (Ab);
                    Find_Tree (F, Ab, ID);
                    Old_Ab := Ab;
                    
                    -- Entrez l'ID de l'individu que vous souhaitez afficher son arbre génealogique.
                    Input_ID ( ID, "Entrez l'ID de l'individu que vous souhaitez supprimer son arbre génealogique dans cet arbre: ");
                   
                    if (ID = Get_ID (Ab)) then
                        Remove_Tree (F, Ab); -- Supprimer l'arbre de la foret.
                    else -- Mettre à jour la foret.
                        -- Supprimer l'arbre correspondant à l'ID lu au clavier..
                        Supprimer (Ab, ID);
                        Update_Forest (F, Old_Ab, Ab);
                    end if;
                    Supprimer_R (Registre, ID);
                    
                    -- Affichage.
                    Display_Success ("La Suppression de l'arbre ");
                    
                exception -- Gérez les exceptions.
                    when ARBRE_VIDE_EXCEPTION =>
                        Display_ARBRE_VIDE_EXCEPTION ("Supprimer l'arbre généalogique a échoué.", 1);
                        goto RESTART;
                    when ID_ABSENT_EXCEPTION =>
                        Display_ID_ABSENT_EXCEPTION ("Supprimer l'arbre généalogique a échoué.", 1);
                        goto RESTART;
                    when ABSENT_TREE_EXCEPTION => 
                        Display_Exception ("L'ID entré n'est pas racine d'un arbre dans la foret. Ajouter parent échoué.", 1);
                        goto Restart;
                end;
            
            when 7 =>  -- Obtenir l'ensemble des individus qui n'ont qu'un parent connu.
                begin
                    -- Entrer l'ID de l'arbre dans la foret.
                    Input_ID ( ID, "Entrez l'ID de la racine d'arbre dans la foret : ");
                    
                    -- Trouver l'arbre dans la foret.
                    Initialize_Genealogical_Tree (Ab);
                    Find_Tree (F, Ab, ID);
                    
                    -- Afficher l'ensemble des individus avec un seul parent.
                    Individus_1_Parent_Connu (Ab);

                exception -- Gérez les exceptions.
                    when ARBRE_VIDE_EXCEPTION =>
                        Display_ARBRE_VIDE_EXCEPTION ("Obtenir l'ensemble des individus qui n'ont qu'un parent connu a échoué.", 1);
                        goto RESTART;
                    when ABSENT_TREE_EXCEPTION => 
                        Display_Exception ("L'ID entré n'est pas racine d'un arbre dans la foret. Ajouter parent échoué.", 1);
                        goto Restart;
                end;
                
            when 8 =>  -- Obtenir l'ensemble des individus dont les deux parents sont connus.
                begin
                    -- Entrer l'ID de l'arbre dans la foret.
                    Input_ID ( ID, "Entrez l'ID de la racine d'arbre dans la foret : ");
                    
                    -- Trouver l'arbre dans la foret.
                    Initialize_Genealogical_Tree (Ab);
                    Find_Tree (F, Ab, ID);
                    
                    -- Afficher l'ensemble des individus avec les deux parents connus.
                    Individus_2_Parent_Connu (Ab);

                exception -- Gérez les exceptions.
                    when ARBRE_VIDE_EXCEPTION =>
                        Display_ARBRE_VIDE_EXCEPTION ("Obtenir l'ensemble des individus dont les deux parents sont connus a échoué.", 1);
                        goto RESTART;
                    when ABSENT_TREE_EXCEPTION => 
                        Display_Exception ("L'ID entré n'est pas racine d'un arbre dans la foret. Ajouter parent échoué.", 1);
                        goto Restart;
                end;
            when 9 =>  -- Obtenir l'ensemble des individus dont les deux parents sont inconnus.
                begin
                    -- Entrer l'ID de l'arbre dans la foret.
                    Input_ID ( ID, "Entrez l'ID de la racine d'arbre dans la foret : ");
                    
                    -- Trouver l'arbre dans la foret.
                    Initialize_Genealogical_Tree (Ab);
                    Find_Tree (F, Ab, ID);
                    
                    -- Afficher l'ensemble des individus qui n'ont aucun parent.
                    Ensemble_Feuilles (AB);

                exception -- Gérez les exceptions.
                    when ARBRE_VIDE_EXCEPTION =>
                        Display_ARBRE_VIDE_EXCEPTION ("Obtenir l'ensemble des individus dont les deux parents sont inconnus a échoué.", 1);
                        goto RESTART;
                    when ABSENT_TREE_EXCEPTION => 
                        Display_Exception ("L'ID entré n'est pas racine d'un arbre dans la foret. Ajouter parent échoué.", 1);
                        goto Restart;
                end;
                
            when 10 =>  -- Identifier les ancêtres d'un individu donné sur N generations données par un noeud donné.
                begin
                    -- Entrer l'ID de l'arbre dans la foret.
                    Input_ID ( ID, "Entrez l'ID de la racine d'arbre dans la foret : ");
                    
                    -- Trouver l'arbre dans la foret.
                    Initialize_Genealogical_Tree (Ab);
                    Find_Tree (F, Ab, ID);
                    
                    -- Entrer l'ID de l'individu que vous souhaitez connaitre ses ancetres.
                    Input_ID ( ID, "Entrez l'ID de l'individu que vous souhaitez connaitre ses ancetres dans cet arbre : ");
                
                    -- Entrez la géneration de ses ancetres.
                    Input_Generation (Generation);
                    
                    -- Identifier les ancêtres d'un individu donné sur N generations.
                    Ancetres_Sur_N_Generation (Ab, ID, Generation);

                exception -- Gérez les exceptions.
                    when ARBRE_VIDE_EXCEPTION =>
                        Display_ARBRE_VIDE_EXCEPTION ("les ancêtres d'un individu donné sur n generations a échoué.", 1);
                        goto RESTART;
                    when ABSENT_TREE_EXCEPTION => 
                        Display_Exception ("L'ID entré n'est pas racine d'un arbre dans la foret. Ajouter parent échoué.", 1);
                        goto Restart;
                end;
            
            when 11 =>  -- Vérifier que deux individus n et m ont un ou plusieurs ancêtres homonymes (mêmes non et prénom).
                begin
                    
                    -- Entrer l'ID de l'individu que vous souhaitez connaitre ses ancetres.
                    Input_ID ( ID1, "Entrez l'ID de la racine de l'arbre dans la foret où se trouve l'individu 1 : ");
                    
                    -- Trouver l'arbre dans la foret.
                    Initialize_Genealogical_Tree (Ab1);
                    Find_Tree (F, Ab1, ID1);
                    
                    -- Entrer l'ID de l'individu que vous souhaitez connaitre ses ancetres.
                    Input_ID ( ID2, "Entrez l'ID de la racine de l'arbre dans la foret où se trouve l'individu 2 : ");
                    
                    -- Trouver l'arbre dans la foret.
                    Initialize_Genealogical_Tree (Ab2);
                    Find_Tree (F, Ab2, ID2);
                    
                    -- Entrer l'ID de l'individu que vous souhaitez connaitre ses ancetres.
                    Input_ID ( ID1, "Entrez l'ID de l'individu 1 : ");
                    Input_ID ( ID2, "Entrez l'ID de l'individu 2 : ");
                    
                    -- Vérifier que deux individus n et m ont un ou plusieurs ancêtres homonymes (mêmes non et prénom).
                    Display_Is_Homonym (Ancetres_Homonymes (Ab1, Ab2, Registre, ID1, ID2));

                exception -- Gérez les exceptions.
                    when ID_ABSENT_EXCEPTION =>
                        Display_ID_ABSENT_EXCEPTION ("Ancêtres homonymes a échoué.", 1);
                        goto RESTART;
                end;
                
            when 12 =>  -- Obtenir l'ensemble des demi-frères.
                begin
                    loop
                        -- Entrer l'ID de l'individu que vous souhaitez connaitre ses ancetres.
                        Input_ID ( ID, "Entrez l'ID de l'individu racine d'un arbre dans la foret : ");
                
                        -- Trouver l'arbre dans la foret.
                        Initialize_Genealogical_Tree (Ab);
                        Find_Tree (F, Ab, ID);
                        
                        -- Entrer l'ID de l'individu que vous souhaitez connaitre ses ancetres.
                        Input_ID ( ID, "Entrez l'ID de l'individu que vous souhaitez connaitre ses demi-frères : ");
                        
                        exit when (Nombre_Ancetres (Ab, ID) >= 3);
                    end loop;
                    
                    -- Obtenir l'ensemble des demi-frères.
                    Display_Title_Set ("L'ensemble des demi-frères", -1);
                    Get_Set_Half_Brother (F, ID, Get_ID_Father (Ab), Get_ID_Mother (Ab));
                
                exception -- Gérez les exceptions.
                    when ABSENT_TREE_EXCEPTION =>
                        Display_ABSENT_TREE_EXCEPTION ("Obtenir ensemble des demi-frères");
                        goto RESTART;
                end;
                
            when 13 =>  -- Obtenir l'ensemble des demi-frères.
                begin
                    loop
                        -- Entrer l'ID de l'individu que vous souhaitez connaitre ses ancetres.
                        Input_ID ( ID, "Entrez l'ID de l'individu racine d'un arbre dans la foret : ");
                
                        -- Trouver l'arbre dans la foret.
                        Initialize_Genealogical_Tree (Ab);
                        Find_Tree (F, Ab, ID);
                        
                        -- Entrer l'ID de l'individu que vous souhaitez connaitre ses ancetres.
                        Input_ID ( ID, "Entrez l'ID de l'individu que vous souhaitez connaitre ses demi-frères : ");
                        
                        exit when (Nombre_Ancetres (Ab, ID) >= 3);
                    end loop;
                    
                    -- Obtenir l'ensemble des demi-frères.
                    Display_Title_Set ("L'ensemble des conjoints ", -1);
                    Get_Set_Half_Brother (F, ID, Get_ID_Father (Ab), Get_ID_Mother (Ab));
                
                exception -- Gérez les exceptions.
                    when ABSENT_TREE_EXCEPTION =>
                        Display_ABSENT_TREE_EXCEPTION ("Obtenir ensemble des demi-frères");
                        goto RESTART;
                end;
                
            when others =>
                Null;
                
        end case;
        
        exit when (choice = 0);  -- Quitter le programme.
    end loop;
	
    -- Afficher la barre de fin d'exécution.
    End_Bar;
    
    -- Libérer la mémoire.
    Destruct_Forest (F);
    Vider_R (Registre);
    
end main;
