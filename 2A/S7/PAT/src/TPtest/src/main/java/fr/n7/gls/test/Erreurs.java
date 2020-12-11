package fr.n7.gls.test;

/**
 * Erreurs permet de signaler des erreurs.
 *
 * @author	Xavier Crégut &lt;Prenom.Nom@enseeiht.fr&gt;
 */
public interface Erreurs {

	/** Signaler une erreur et l'explication associé.
	 *
	 * @param erreur l'erreur signalée
	 * @param explication explication de l'erreur signalée
	 * @param <E> le type de erreur
	 */
	<E> void signaler(E erreur, String explication);

}
