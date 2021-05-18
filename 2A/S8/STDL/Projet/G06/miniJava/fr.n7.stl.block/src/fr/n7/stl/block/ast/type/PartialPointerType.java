/**
 * 
 */
package fr.n7.stl.block.ast.type;

/**
 * @author Marc Pantel
 *
 */
public class PartialPointerType extends PointerType implements PartialType {

	/**
	 * @param _element
	 */
	public PartialPointerType() {
		super(null);
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.type.PartialType#complete(fr.n7.stl.block.ast.type.Type)
	 */
	@Override
	public Type complete(Type _type) {
		if (this.element == null) {
			return new PointerType(_type);
		} else {
			return new PointerType(((PartialType) this.element).complete(_type));
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
