-- Spécification du module Piles.

generic
    Capacite : Integer;   -- Nombre maximal d'éléments qu'une pile peut contenir
    type T_Element is private;  -- Type des éléments de la pile

package Piles is

    type T_Pile is limited private; --// "très privé" en Algorithmique !
        --// Sur un type privé, on a droit à l'affectation (:=) et l'égalité (=).
        --// On perd ces opérations avec un type "limited private" (très privé).


    -- Initilaiser une pile.  La pile est vide.
    procedure Initialiser (Pile : out T_Pile) with
        Post => Est_Vide (Pile);


    -- Est-ce que la pile est vide ?
    function Est_Vide (Pile : in T_Pile) return Boolean;


    -- Est-ce que la pile est pleine ?
    function Est_Pleine (Pile : in T_Pile) return Boolean;


    -- L'élément en sommet de la pile.
    function Sommet (Pile : in T_Pile) return T_Element with
        Pre => not Est_Vide (Pile);


    -- Empiler l'élément en somment de la pile.
    procedure Empiler (Pile : in out T_Pile; Element : in T_Element) with
        Pre => not Est_Pleine (Pile),
        Post => Sommet (Pile) = Element;


    -- Supprimer l'élément en sommet de pile
    procedure Depiler (Pile : in out T_Pile) with
        Pre => not Est_Vide (Pile);


    -- Afficher les éléments de la pile
    generic
        with procedure Afficher_Element (Un_Element: in T_Element);
    procedure Afficher (Pile : in T_Pile);


private

    type T_Tab_Elements is array (1..Capacite) of T_Element;

    type T_Pile is 
        record
            Elements : T_Tab_Elements;  -- les éléments de la pile
            Taille: Integer;        -- Nombre d'éléments dans la pile
        end record;

end Piles;
