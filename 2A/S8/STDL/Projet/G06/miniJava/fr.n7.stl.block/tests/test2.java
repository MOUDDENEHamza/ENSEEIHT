class A {
	
	public int v;
	
	public void setV(int _v) {
		this.v = _v;
	}

	
	public int getV() {
		return this.v;
	}
	
	
	public A(int _v) {
		this.v = _v;
	}

	public A() {
		this.v = 10;
	}
	
}

public class Main {

	public static void main(String args[]) {
		A a1 = new A();
    }
}
