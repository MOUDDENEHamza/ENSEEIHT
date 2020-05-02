package TP08;

public class EnsembleChaine<T extends Comparable<T>> implements Ensemble<T> {
	
	// Ensemble chainé
	Cellule<T> ens;
	
	/**Cosntructeur de la classe EnsembleChaine
	 */
	public EnsembleChaine() {
		this.ens = null;
	}
	
	/**Obtenir le nombre d'élements de l'ensemble
	 * @ return int : le nombre d'élements
	 */
	public int cardinal() {
		if (estVide()) {
			return 0;
		} else {
			this.ens = this.ens.getSuiv();
			return 1 + cardinal();
		}
	}

	/**Vérifier si l'ensemble est vide
	 * @return boolean : vrai si l'ensemble est vide, sinon faux
	 */
	public boolean estVide() {
		return (this.ens == null);
	}

	/**Vérifier si l'ensemble comntient l'élement x
	 * @param x est l'élement qu'on souhaite vérifier son existence
	 * @return boolean : vrai si x est dans ens,sinon faux
	 */
	public boolean contient(T x) {
		if (estVide()) {
			return false;
		} else {
			Cellule<T> tmp = ens;
			while (tmp != null) {
				if (tmp.getValeur() == x) {
					return true;
				}
				tmp = tmp.getSuiv();
			}
			return false;
		}
	}

	/**Ajouter un element a l'ensemble
	 * @param x ; l'element à ajouter
	 */
	public void ajouter(T x) {
		Cellule<T> nvCellule = new Cellule<T>(x, null);
		if (estVide()) {
			this.ens = nvCellule;
		} else {
			Cellule<T> tmp = ens;
			while (tmp != null) {
				tmp = tmp.getSuiv();
			}
			tmp = nvCellule;
		}		
	}

	/**Supprimer un element a l'ensemble
	 * @param x ; l'element à supprimer
	 */
	public void supprimer(T x) {
		if (!estVide()) {
			Cellule<T> tmp = ens;
			while (tmp != null) {
				if (tmp.getValeur() == x) {
					tmp = tmp.getSuiv();
				} else {
					tmp = tmp.getSuiv();
				}
			}
		}
	}

}
