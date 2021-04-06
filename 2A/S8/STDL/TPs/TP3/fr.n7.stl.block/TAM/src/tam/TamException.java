package tam;

public class TamException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public TamException(String m) {
		super("Tam error : " + m);
	}
}
