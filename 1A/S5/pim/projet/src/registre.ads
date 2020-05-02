-- Spécification du module Registre.


with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;



package registre is


    type T_Registre is limited private;

    type T_Donnee is private;

    type T_Date is private;

    type T_Tableau is array(1..2) of Integer;

    type T_Tab is record
        Elt : T_Tableau;
        Taille : Integer;
    end record;

    type T_Null_Record is record
        Null;
    end record;


    Id_Present_Exception_R : Exception;                -- un identifiant est déjà présent dans le registre.
    Id_Absent_Exception_R : Exception;                 -- un identifiant est absent du registre.
    Registre_Vide_Exception : Exception;             -- le registre est vide.
    Ecart_Age_Parent_Enfant_Exception : Exception;   -- avoir un minimum de 18 ans entre la date de naissance des parents et des enfants.

    ----------------------------------Constuctor--------------------------------

    -- Nom : Initialiser_Donnee
    -- Sémantique : Initialiser la donnée avec les paramètres donnés
    -- Type_De_Retour : T_Donnee
    -- Paramètres:
    --      Nom : in Unbounde_String        -- le nom
    --      Prenom : in Unbounde_String     -- le prénom
    --      Date_N : in Integer            -- la date de naissance
    --      Lieu_N : in Unbounde_String     -- le lieu de naissance
    --      Date_D : in Integer            -- la date de décès
    --      Lieu_D : in Unbounde_String     -- le lieu de décès
    --      Sexe : in Character            -- le sexe
    --      Email : in Unbounde_String      -- l'email
    --      Tel : in Integer               -- le numéro de téléphone portable

    function Initialiser_Donnee (Nom : in Unbounded_String; Prenom : in Unbounded_String;
                                 Date_N : in T_Date; Lieu_N : in Unbounded_String;
                                 Date_D : in T_Date; Lieu_D : in Unbounded_String;
                                 Sexe : in Character; Email : in Unbounded_String;
                                 Tel : in Integer) return T_Donnee;

    -----------------------------------Getters----------------------------------

    -- Nom 	      : Get_Last_Name
    -- Sémantique     : Obtenir le nom d'un individu.
    -- Type_De_Retour : Unbounded_String est le nom de l'individu.
    -- Paramètres
    --     	Data  : Data est la structure de donnéées contenant toutes les informations.
    function Get_Last_Name (Data : in T_Donnee) return Unbounded_String;


    -- Nom 	      : Get_First_Name
    -- Sémantique     : Obtenir le prénom d'un individu.
    -- Type_De_Retour : Unbounded_String est le prénom de l'individu.
    -- Paramètres
    --     	Data  : Data est la structure de donnéées contenant toutes les informations.
    function Get_First_Name (Data : in T_Donnee) return Unbounded_String;


    -- Nom 	      : Get_Birthday
    -- Sémantique     : Obtenir la date de naissance d'un individu.
    -- Type_De_Retour : Integer est la date de naissance de l'individu.
    -- Paramètres
    --     	Data  : Data est la structure de données contenant toutes les informations.
    function Get_Birthday (Data : in T_Donnee) return T_Date;

     -- Nom 	      : Get_Birthday_Day
    -- Sémantique     : Obtenir le jour de naissance d'un individu.
    -- Type_De_Retour : Integer est lle jour de naissance de l'individu.
    -- Paramètres
    --     	Data  : Data est la structure de données contenant toutes les informations.
    function Get_Birthday_Day (Data : in T_Donnee) return Integer;

    -- Nom 	      : Get_Birthday_Month
    -- Sémantique     : Obtenir le mois de naissance d'un individu.
    -- Type_De_Retour : Integer est le mois de naissance de l'individu.
    -- Paramètres
    --     	Data  : Data est la structure de données contenant toutes les informations.
    function Get_Birthday_Month (Data : in T_Donnee) return Integer;


    -- Nom 	      : Get_Birthday_Year
    -- Sémantique     : Obtenir l'année de naissance d'un individu.
    -- Type_De_Retour : Integer est l'année de naissance de l'individu.
    -- Paramètres
    --     	Data  : Data est la structure de données contenant toutes les informations.
    function Get_Birthday_Year (Data : in T_Donnee) return Integer;

    -- Nom 	      : Get_Birthplace
    -- Sémantique     : Obtenir le lieu de naissance d'un individu.
    -- Type_De_Retour : Unbounded_String est le lieu de naissance de l'individu.
    -- Paramètres
    --     	Data  : Data est la structure de données contenant toutes les informations.
    function Get_Birthplace (Data : in T_Donnee) return Unbounded_String;


    -- Nom 	      : Get_Deathday
    -- Sémantique     : Obtenir la date de decés d'un individu.
    -- Type_De_Retour : Integer est la date de décès de l'individu.
    -- Paramètres
    --     	Data  : Data est la structure de données contenant toutes les informations.
    function Get_Deathday (Data : in T_Donnee) return T_Date;

    -- Nom 	      : Get_Deathday_Day
    -- Sémantique     : Obtenir le jour de décès d'un individu.
    -- Type_De_Retour : Integer est lle jour de décès de l'individu.
    -- Paramètres
    --     	Data  : Data est la structure de données contenant toutes les informations.
    function Get_Deathday_Day (Data : in T_Donnee) return Integer;

    -- Nom 	      : Get_Deathday_Month
    -- Sémantique     : Obtenir le mois de décès d'un individu.
    -- Type_De_Retour : Integer est le mois de décès de l'individu.
    -- Paramètres
    --     	Data  : Data est la structure de données contenant toutes les informations.
    function Get_Deathday_Month (Data : in T_Donnee) return Integer;


    -- Nom 	      : Get_Deathday_Year
    -- Sémantique     : Obtenir l'année de décès d'un individu.
    -- Type_De_Retour : Integer est l'année de décès de l'individu.
    -- Paramètres
    --     	Data  : Data est la structure de données contenant toutes les informations.
    function Get_Deathday_Year (Data : in T_Donnee) return Integer;


    -- Nom 	      : Get_Deathplace
    -- Sémantique     : Obtenir le lieu de décès d'un individu.
    -- Type_De_Retour : Integer est le lieu de décès de l'individu.
    -- Paramètres
    --     	Data  : Data est la structure de données contenant toutes les informations.
    function Get_Deathplace (Data : in T_Donnee) return Unbounded_String;


    -- Nom 	      : Get_Sex
    -- Sémantique     : Obtenir le sexe d'un individu.
    -- Type_De_Retour : Character est le sexe de l'individu.
    -- Paramètres
    --     	Data  : Data est la structure de données contenant toutes les informations.
    function Get_Sex (Data : in T_Donnee) return Character;


    -- Nom 	      : Get_Email
    -- Sémantique     : Obtenir l'email d'un individu.
    -- Type_De_Retour : Unbounded_String est l'email de l'individu.
    -- Paramètres
    --     	Data  : Data est la structure de donnéées contenant toutes les informations.
    function Get_Email (Data : in T_Donnee) return Unbounded_String;


    -- Nom 	      : Get_Tel
    -- Sémantique     : Obtenir le telephone d'un individu.
    -- Type_De_Retour : Integer est le telephone de l'individu.
    -- Paramètres
    --     	Data  : Data est la structure de donnéées contenant toutes les informations.
    function Get_Tel (Data : in T_Donnee) return Integer;


    ----------------------------------------------------------------------------

    -- Nom : Ecart_Age_Parent_Enfant_R
    -- Sémantique : définir s'il y a bien un écart de 18 ans entre un enfant et ses parents ou son parent.
    -- Type_De_Retour : Boolean
    -- Paramètres:
    --     Registre : in T_Registre  -- le registre que l'on étudie
    --     Id : in Integer           -- l'identifiant unique d'un élément du registre.
    function Ecart_Age_Parent_Enfant_R (Registre : in T_Registre ; Id : in Integer ; Parents : in T_Tab) return Boolean;

    -- Nom : Registre_Vide
    -- Sémantique : définir si le registre est vide.
    -- Paramètres:
    --     Registre : in T_Registre   -- le registre que l'on étudie
    procedure Registre_Vide (Registre : in T_Registre);

    -- Nom : Initialiser_R
    -- Sémantique : Initialier le Registre. le Registre est vide.
    -- Paramètres:
    --      Registre : in T_Registre -- le registre que l'on veut initialiser.
    procedure Initialiser_R (Registre : out T_Registre) with
            Post => Est_Vide_R (Registre);

    -- Nom : Est_Vide_R
    -- Sémantique : Annonce si le registre est vide ou non.
    -- Type_De_Retour : Booléen annonçant si le registre est vide ou non.
    -- Paramètres:
    --      Registre : in T_Registre -- le registre pour lequel on veut tester s'il est vide ou non.
    function Est_Vide_R (Registre : in T_Registre) return Boolean;

    -- Nom : Taille_R
    -- Sémantique : Obtenir la taille du registre.
    -- Type_De_Retour : Entier représentant la taille du registre.
    -- Paramètres:
    --      Registre : in T_Registre -- le registre dont on veut la taille.
    function Taille_R (Registre : in T_Registre) return Integer with
            Post => Taille_R'Result >= 0 and (Taille_R'Result = 0) = Est_Vide_R(Registre);

    -- Nom : Inserer_R
    -- Sémantique : Insérer une nouvelle donnée dans le Registre pour un Id donné, à sa place, en terme de croissance des identifiants.
    -- Exception : Id_Present_Exception si Id est déjà dans le registre.
    -- Paramètres:
    --      Registre : in out T_Registre -- le registre dans lequel on veut insérer une donnée.
    --      Id : in Integer -- l'identifiant unique d'un élément du registre.
    --      Donnee : in T_Donnee -- enregistrement contenant toutes les données concernant Id.
    procedure Inserer_R (Registre : in out T_Registre ; Id : in Integer ; Donnee : in T_Donnee);
    --Post => La_Donnee_R (Registre, Id) = Donnee and Taille_R(Registre) = Taille_R (Registre)'Old + 1; -- un élément de plus

    -- Nom : Modifier_R
    -- Sémantique : Modifier la donnée associée à l'identifiant Id dans le Registre.
    -- Exception : Id_Absent_Exception si Id n'est pas utilisé dans le Registre.
    -- Paramètres:
    --      Registre : in out T_Registre -- le registre dans lequel on veut modifier les donées associées à l'identifiant Id.
    --      Id : in Integer -- l'identifiant unique d'un élément du registre.
    --      Donnee : in T_Donnee -- enregistrement contenant toutes les données concernant Id et que l'on veut modifier.
    procedure Modifier_R (Registre : in out T_Registre ; Id : in Integer ; Donnee : in T_Donnee) with
            Post => La_Donnee_R (Registre, Id) = Donnee; -- donnée mise à jour

    -- Nom : Supprimer
    -- Sémantique : Supprimer la donnée associée à l'identifiant Id dans le Registre.
    -- Exception : Id_Absent_Exception si Id n'est pas utilisé dans le Registre.
    -- Paramètres:
    --      Registre : in out T_Registre -- le registre dans lequel on veut supprimer un identifiant et ses données..
    --      Id :  in Integer -- l'identifiant unique d'un élément du registre.
    procedure Supprimer_R(Registre : in out T_Registre ; Id : in Integer) with
            Pre => not(Est_Vide_R(Registre)),
            Post =>  Taille_R (Registre) = Taille_R (Registre)'Old - 1; -- un élément de moins

    -- Nom : La_Donnee_R
    -- Sémantique : Obtenir la donnée associée à l'identifiant Id dans le Registre.
    -- Exception : Id_Absent_Exception si Id n'est pas utilisé dans le Registre.
    -- Type_De_Retour : T_Donnee représentant toutes les données concernant Id.
    -- Paramètres:
    --      Registre : in T_Registre -- le registre dans lequel on veut obtenir les donées associées à l'identifiant Id.
    --      Id : in Integer -- l'identifiant unique d'un élément du registre.
    function La_Donnee_R (Registre : in T_Registre ; Id : in Integer) return T_Donnee;

    -- Nom : Vider_R
    -- Sémantique : Supprimer tous les éléments d'un Registre.
    -- Doit être utilisé dès qu'on sait qu'un registre ne sera plus utilisé.
    -- Paramètre:
    --      Registre : in out T_Registre -- le registre que l'on veut vider.
    procedure Vider_R (Registre : in out T_Registre) with
            Post => Est_Vide_R (Registre);

    -- Nom : Age
    -- Sémantique : Déterminer l'âge d'un individu.
    -- Type_De_Retour : Integer représentant l'âge de l'individu.
    -- Paramètre :
    --     Id : in -- identifiant de l'individu dont on veut l'âge
    --    Registre : in -- registre où sont présentes les dates de naissance et de mort
    function Age (Registre : in T_Registre; Id : in Integer) return Integer;




    -- Nom : Initialiser_Date
    -- Type_De_Retour : T_Date
    -- Sémantique : Initialiser une donnée de type T_Date.
    -- Paramètres :
    --      Jour : in Integer
    --      Mois : in Integer
    --      Annee : in Integer
    function Initialiser_Date (Jour : in Integer; Mois : in Integer; Annee : in Integer) return T_Date;

    -- Nom : Date_D_Inconnue
    -- Type_De_Retour : Boolean
    -- Sémantique : Determiner si une date de décès est inconnue.
    -- Paramètre :
    --      Date_D : in T_Date
    function Date_D_Inconnue (Date_D : in T_Date) return Boolean;


private

    type T_Cellule;

    type T_Date is record
        Jour : Integer;
        Mois : Integer;
        Annee : Integer;
    end record;

    type T_Donnee is record
        Nom : Unbounded_String;        -- le nom
        Prenom : Unbounded_String;     -- le prénom
        Date_N : T_Date;              -- la date de naissance, de la forme JJMMAAAA
        Lieu_N : Unbounded_String;     -- le lieu de naissance
        Date_D : T_Date;              -- la date de décès, de la forme JJMMAAAA. Si Id est toujours vivant, inscrire 0000000.
        Lieu_D : Unbounded_String;     -- le lieu de décès. Si Id est toujours vivant, inscrire "Vivant".
        Sexe : Character;              -- le sexe, 'F' pour femme, 'H' pour Homme, 'U' pour non-genré
        Email : Unbounded_String;      -- l'email
        Tel : Integer;                 -- le numéro de téléphone portable, de la forme XXXXXXXXXX

    end record;

    type T_Cellule is record
        Id : Integer;                -- l'identifiant. Enier naturel.
        Donnee : T_Donnee;           -- les données concernant l'identifiant
        Suivant : T_Registre;        -- pointeur vers l'identidiant suivant (forcément plus grand que Id)
    end record;

    type T_Registre is access T_Cellule;

end registre;


