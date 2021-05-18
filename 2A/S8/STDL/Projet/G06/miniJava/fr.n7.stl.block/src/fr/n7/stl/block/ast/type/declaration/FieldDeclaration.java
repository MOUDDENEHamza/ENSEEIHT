/**
 * 
 */
package fr.n7.stl.block.ast.type.declaration;

import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.type.Type;

/**
 * Abstract Syntax Tree node for a field in a record.
 * @author Marc Pantel
 *
 */
public class FieldDeclaration implements Declaration {

	private String name;
	private Type type;
	private int offset;

	public FieldDeclaration(String _name, Type _type) {
		this.name = _name;
		this.type = _type;
		this.offset = -1;
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Declaration#getName()
	 */
	@Override
	public String getName() {
		return this.name;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return this.type + " " + this.name + ";";
	}

	/**
	 * Provide the type of the field in a record.
	 * @return Type of the field.
	 */
	public Type getType() {
		return this.type;
	}

	/**
	 * Provide the offset of the field in a record.
	 * @return Offset of the field.
	 */
	public int getOffset() {
		return this.offset;
	}

}
