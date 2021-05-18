/**
 * 
 */
package fr.n7.stl.block.ast.type;

/**
 * @author Marc Pantel
 *
 */
public class PartialArrayType extends ArrayType implements PartialType {

	/**
	 * @param _element
	 */
	public PartialArrayType() {
		super(null);
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.type.PartialType#complete(fr.n7.stl.block.ast.type.Type)
	 */
	@Override
	public Type complete(Type _type) {
		if (this.element == null) {
			return new ArrayType(_type);
		} else {
			return new ArrayType(((PartialType) this.element).complete(_type));
		}
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.type.PartialType#enrich(fr.n7.stl.block.ast.type.PartialType)
	 */
	@Override
	public void enrich(PartialType _type) {
		if (this.element == null) {
			this.element = _type;
		} else {
			((PartialType) this.element).enrich(_type);
		}
	}

}
