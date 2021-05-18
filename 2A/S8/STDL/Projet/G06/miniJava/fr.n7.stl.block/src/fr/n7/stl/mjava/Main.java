package fr.n7.stl.mjava;

interface I {
	public void m();
}

class A implements I {

	public void m() {
		System.out.println("m() dans A.");
		
	}
	
}

class B implements I {

	public void m() {
		System.out.println("m() dans B.");
		
	}
	
}

public class Main {

	public static void main(String[] args) {
		I a = new A();
		I b = new B();
		// attention, il ne faut pas essayer de déterminer à la compilation que a contient un A
		// il faut gérer cela dynamiquement contrairement aux appels de fonction dans Block
		a.m(); 
		// attention, il ne faut pas essayer de déterminer à la compilation que b contient un B
		// il faut gérer cela dynamiquement contrairement aux appels de fonction dans Block
		b.m(); 
		I i = null;
		boolean expression = true;
		if (expression) {
			i = new A();
		} else {
			i = new B();
		}
		i.m();
	}

}
