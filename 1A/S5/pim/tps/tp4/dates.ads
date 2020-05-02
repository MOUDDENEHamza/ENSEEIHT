-- Spécification d'un module Dates très simplifié.
--
-- Attention : Bien gérer les dates est compliqué. Les dates et opéraitons
-- associées sont disponibles dans les bibliothèques des langages de
-- programmation. Par exemple dans le paquetage Ada.Calendar pour Ada.

package Dates is

    type T_Mois is (JANVIER, FEVRIER, MARS, AVRIL, MAI, JUIN, JUILLET,
                    AOUT, SEPTEMBRE, OCTOBRE, NOVEMBRE, DECEMBRE);

    type T_Date is limited private;

    -- Initialiser une date à partir du jour, du mois et de l'année.
    --
    -- Paramètres :
    --     Date : la date à initialiser
    --     Jour : la valeur du jour
    --     Mois : la valeur du mois
    --     Annee : la valeur du mois
    --
    --  Nécessite :
    --     Jour/Mois/Annee constituent une date valide
    --
    --  Assure
    --     Le_Jour (Date) = Jour
    --     Le_Mois (Date) = Mois
    --     L_Annee (Date) = Annee
    --
    procedure Initialiser ( Date  : out T_Date  ;
                            Jour  : in  Integer ;
                            Mois  : in  T_Mois  ;
                            Annee : in  Integer )
    with
        Pre => Annee >= 0 and Jour >= 1 and Jour <= 31, -- simplifiée !
        Post => Le_Jour (Date) = Jour and Le_Mois (Date) = Mois and L_Annee (Date) = Annee;

    -- Afficher une date sous la forme jj/mm/aaaa
    procedure Afficher (Date : in T_Date);

    -- Obtenir le mois d'une date.
    -- Paramètres
    --     Date : la date dont on veut obtenir le moi
    function Le_Mois (Date : in T_Date) return T_Mois;

    -- Obtenir le jour d'une date.
    -- Paramètres
    --     Date : la date dont on veut obtenir le jour
    function Le_Jour (Date : in T_Date) return Integer;

    -- Obtenir l'année d'une date.
    -- Paramètres
    --     Date : la date dont on veut obtenir l'année
    function L_Annee (Date : in T_Date) return Integer;


private

    type T_Date is
        record
            Jour : Integer;
            Mois : T_Mois;
            Annee : Integer;
            -- Invariant
            --    Annee > 0
            --    Jour >= 1
            --    Jour <= Nombre_Jours (Mois, Annee)
        end record;

end Dates;
