--------------------------------------------------------------------------------
--  Fichier  : input.ads
--  Auteur   : MOUDDENE Hamza & CAZES Noa
--  Objectif : Spécification du module Input
--  Crée     : Dimanche Déc 01 2019
--------------------------------------------------------------------------------


with Registre; 			use Registre;


package Input is


    -- lire au clavier un entier quelconque.
    --
    -- Param Value : Value est l'entier lu au clavier.
    --
    -- Exception : DATA_ERROR_EXCEPTION.
    procedure Input_Integer (Value : out Integer);


    -- Entrer le choix du menu.
    --
    -- Param Choice : Choice est le choix d'une option dans le menu.
    procedure Input_Choice (Choice : out Integer);


    -- Entrer le sexe d'un individu.
    function Input_Sex return Character;


    -- Entrer les données personnelles d'une personne.
    --
    -- Return T_Donnee : T_Donnee est le type qui contient les données personnelles d'une personne.
    function Demander_Donnee return T_Donnee;


    -- Entrer l'ID d'un individu.
    --
    -- Param ID : ID lu au clavier.
    -- Param Message : Message associé à chaque opération de saisie.
    procedure Input_ID (ID : out Integer; Message : in String);


    -- Entrer si le parent que vous souhaiterez ajouter est le père ou la mère.
    -- Entrer 0 s'il s'agit d'un père, 1 si c'est la mère.
    --
    -- Param Flag : Flag 0 si c'est le père, 1 si c'est la mère.
    procedure Input_Flag (Flag : out Integer);


    -- Entrez la géneration des ancetres.
    --
    -- Param Generation : La génération des ancestres.
    procedure Input_Generation (Generation : out Integer);


end Input;
