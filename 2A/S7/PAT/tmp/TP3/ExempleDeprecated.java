@Deprecated
class A { }

class B {
	@Deprecated
	public void m() {
		System.out.println("B.m();");
}	}

public class ExempleDeprecated {
	void m1() {
		A a = new A();
		B b = new B();
		b.m();
	}

	@SuppressWarnings("deprecation")
	void m2() {
		A a = new A();
		B b = new B();
		b.m();
}	}
