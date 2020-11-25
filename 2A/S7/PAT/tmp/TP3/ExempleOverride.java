class A {
	public String unNomTresTresLong(int n) {
		return "A" + n;
}	}

class B extends A {
	@Override
	public String unNomTresTresLong(int n) {
		return "B" + n;
}	}

class C extends A {
	@Override
	public String unNonTresTresLong(int n) {
		return "C" + n;
}	}

class D extends A {
	@Override
	public String unNomTresTresLong(long n) {
		return "D" + n;
}	}

public class ExempleOverride {
	static void verifier(String attendu, int i, A a) {
		String calcul = a.unNomTresTresLong(i);
		if (! calcul.equals(attendu)) {
			System.out.println("Erreur: " + calcul + " au lieu de " + attendu);
	}	}

	public static void main(String[] args) {
		verifier("A0", 0, new A());
		verifier("B1", 1, new B());
		verifier("C2", 2, new C());
		verifier("D3", 3, new D());
}	}
