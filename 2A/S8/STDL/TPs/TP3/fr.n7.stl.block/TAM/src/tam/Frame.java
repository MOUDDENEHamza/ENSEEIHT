package tam;

public class Frame {
	private int addr;

	private int ls;

	private int ld;

	private int ret;

	public Frame(int a, int s, int d, int r) {
		addr = a;
		ls = s;
		ld = d;
		ret = r;
	}

	public int getLd() {
		return ld;
	}

	public int getLs() {
		return ls;
	}

	public int getRet() {
		return ret;
	}

	public int getAddr() {
		return addr;
	}

	public String toString() {
		return "[" + addr + ", " + ld + "]";
	}
}
