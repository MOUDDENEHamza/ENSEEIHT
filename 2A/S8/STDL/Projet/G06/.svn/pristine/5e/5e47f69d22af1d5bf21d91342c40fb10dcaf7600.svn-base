package fr.n7.stl.block.ast.expression;

/**
 * Common elements between left (Assignable) and right (Expression) end sides of assignments. These elements
 * share attributes, toString and getType methods.
 * @author Marc Pantel
 *
 */
public abstract class AbstractIdentifier implements Expression {

	/**
	 * Name of the variable.
	 */
	protected String name;
	
	/**
	 * Creates a variable related expression Abstract Syntax Tree node.
	 * @param _name Name of the variable.
	 */
	public AbstractIdentifier(String _name) {
		this.name = _name;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return " " + this.name + " ";
	}

}