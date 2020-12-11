package fr.n7.gls.test;

/**
  * ErreursAffichage 
  *
  * @author	Xavier Crégut &lt;Prenom.Nom@enseeiht.fr&gt;
  */

public class ErreursAffichage implements Erreurs {

	public <E> void signaler(E erreur, String explication) {
		System.out.println("Erreur sur " + erreur + " : " + explication);
	}

	

}
