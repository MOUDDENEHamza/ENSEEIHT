/**
 * 
 */
package fr.n7.stl.block.ast.expression.assignable;

import fr.n7.stl.block.ast.expression.AbstractArray;
import fr.n7.stl.block.ast.expression.BinaryOperator;
import fr.n7.stl.block.ast.expression.Expression;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.Register;
import fr.n7.stl.tam.ast.TAMFactory;

/**
 * Abstract Syntax Tree node for an expression whose computation assigns a cell in an array.
 * @author Marc Pantel
 */
public class ArrayAssignment extends AbstractArray implements AssignableExpression {

	/**
	 * Construction for the implementation of an array element assignment expression Abstract Syntax Tree node.
	 * @param _array Abstract Syntax Tree for the array part in an array element assignment expression.
	 * @param _index Abstract Syntax Tree for the index part in an array element assignment expression.
	 */
	public ArrayAssignment(AssignableExpression _array, Expression _index) {
		super(_array, _index);
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.impl.ArrayAccessImpl#getCode(fr.n7.stl.tam.ast.TAMFactory)
	 */
	@Override
	public Fragment getCode(TAMFactory _factory) {
		Fragment _result = _factory.createFragment();
		int _offset = ((VariableAssignment) this.array).declaration.getOffset();
		Register _register = ((VariableAssignment) this.array).getDeclaration().getRegister();
		int _size = this.getType().length();
		_result.add(_factory.createLoad(_register, _offset, _size));
		_result.append(this.index.getCode(_factory));
		_result.add(_factory.createLoadL(_size));
		_result.add(TAMFactory.createBinaryOperator(BinaryOperator.Multiply));
		_result.add(TAMFactory.createBinaryOperator(BinaryOperator.Add));
		_result.add(_factory.createStoreI(_size));
		return _result;
	}

	
}
