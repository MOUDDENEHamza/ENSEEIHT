package TP08;

public interface EnsembleOrdonne<T extends Comparable<T>>{
	//@ public invariant estVide() <==> cardinal() == 0;
	//@ public invariant 0 <= cardinal();
	/** Obtenir le nombre d'éléments dans l'ensemble.
	 * @return nombre d'éléments dans l'ensemble. */
	/*@ pure helper @*/ int cardinal();
	
	/** Savoir si l'ensemble est vide.
	 * @return Est-ce que l'ensemble est vide ? */
	/*@ pure helper @*/ boolean estVide();
	/** Savoir si un élément est présent dans l'ensemble.
	 * @param x l'élément cherché
	 * @return x est dans l'ensemble */
	/*@ pure helper @*/ boolean contient(T x);
	
	/**Obtenir le plus petit element
	 * @return T le plus petit element*/
	//@ requires !estVide();
	T petitElement();
	
	/**Obtenir le plus petit élément strictement plus grand que celui passé en 
	 * paramètre
	 * @param x l'élement qu'on souhaite trouvé son supérieur
	 * @return le plus petit élément strictement plus grand que x
	 */
	T justePlusGrandQue(T x);
	
	/** Ajouter un élément dans l'ensemble.
	 * @param x l'élément à ajouter */
	//@ ensures contient(x); // élément ajouté
	void ajouter(T x);
	
	/** Enlever un élément de l'ensemble.
	 * @param x l'élément à supprimer */
	//@ ensures ! contient(x); // élément supprimé
	void supprimer(T x);
}
