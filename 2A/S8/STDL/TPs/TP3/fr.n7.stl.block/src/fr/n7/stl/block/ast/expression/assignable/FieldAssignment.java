/**
 * 
 */
package fr.n7.stl.block.ast.expression.assignable;

import fr.n7.stl.block.ast.expression.AbstractField;
import fr.n7.stl.block.ast.expression.BinaryOperator;
import fr.n7.stl.block.ast.type.declaration.FieldDeclaration;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.TAMFactory;

/**
 * Abstract Syntax Tree node for an expression whose computation assigns a field in a record.
 * @author Marc Pantel
 *
 */
public class FieldAssignment extends AbstractField implements AssignableExpression {

	/**
	 * Construction for the implementation of a record field assignment expression Abstract Syntax Tree node.
	 * @param _record Abstract Syntax Tree for the record part in a record field assignment expression.
	 * @param _name Name of the field in the record field assignment expression.
	 */
	public FieldAssignment(AssignableExpression _record, String _name) {
		super(_record, _name);
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.impl.FieldAccessImpl#getCode(fr.n7.stl.tam.ast.TAMFactory)
	 */
	@Override
	public Fragment getCode(TAMFactory _factory) {
		FieldDeclaration _field = null;
		int _value = 0;
        for (FieldDeclaration fieldDeclaration: recordType.getFields()) {
            if (fieldDeclaration.getName().equals(name)) {
                _field = fieldDeclaration;
				break;
            }
            _value += fieldDeclaration.getType().length();
        }
		
		Fragment _result = _factory.createFragment();
		_result.add(_factory.createLoadL(((VariableAssignment) this.record).declaration.getOffset()));
		_result.add(_factory.createLoadL(_value));
		_result.add(TAMFactory.createBinaryOperator(BinaryOperator.Add));
		_result.add(_factory.createStoreI(_field.getType().length()));
		return _result;
	}
	
}
