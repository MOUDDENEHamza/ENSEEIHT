/**
 * 
 */
package fr.n7.stl.block.ast;

/**
 * Runtime exception that is triggered when a semantics element is not implemented.
 * @author Marc Pantel
 *
 */
public class SemanticsUndefinedException extends RuntimeException {

	private static final long serialVersionUID = 7306556465369026268L;

	/**
	 * Runtime exception used to indicate when a semantics element must be implemented. 
	 * @param message Usage specific message that relates to the class and method.
	 */
	public SemanticsUndefinedException(String message) {
		super(message);
	}

}
