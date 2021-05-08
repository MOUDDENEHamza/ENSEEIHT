/** Programme utilisant les comptes bancaires.  */
public class ExempleComptes {
	
	pointcut publicMethod():
	call(void CompteCourant.*(double)) ||
	call(void CompteCourant.debiter(double)) ||
	call(void CompteCourant.editerReleve()) ||
	call(String CompteCourant.toString()) ||
	call (String CompteSimple.getNumero()) ||
	call (double CompteSimple.getSolde()) ||
	call (Personne CompteSimple.getTitulaire()) ||
	call(void CompteSimple.crediter(double)) ||
	call(void CompteSimple.debiter(double)) ||
	call(String CompteSimple.toString())
	/**
	pointcut publicMethod():
	call(public CompteCourant.*(..)) ||
	call (public CompteSimple.*(..)) 
	 */

	before() : publicMethod() {
		System.out.println(thisJoinPoint.getSignature() + "   " + thisJoinPoint.getArgs());
	}



	public static void main (String argv []) {
		Personne p1 = new Personne("Xavier", "Crégut", true);
		CompteSimple cs1 = new CompteSimple(p1, 0);
		CompteCourant cc1 = new CompteCourant(p1, 100);

		cs1.crediter(1000);
		System.out.println("Solde de cs1 = " + cs1.getSolde());

		cc1.crediter(1000);
		System.out.println("Solde de cc1 = " + cc1.getSolde());
		cc1.editerReleve();

		CompteSimple cs = cc1;
		cs.debiter(500);
		System.out.println("Solde de cs = " + cs.getSolde());
		System.out.println("Solde de cc1 = " + cc1.getSolde());
		cc1.editerReleve();
	}
}
