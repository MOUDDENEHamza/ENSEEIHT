/**
 * 
 */
package fr.n7.stl.block.ast.expression;

import fr.n7.stl.block.ast.SemanticsUndefinedException;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.block.ast.type.AtomicType;
import fr.n7.stl.block.ast.type.Type;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.TAMFactory;
import fr.n7.stl.util.Logger;

/**
 * Abstract Syntax Tree node for a conditional expression.
 * @author Marc Pantel
 *
 */
public class ConditionalExpression implements Expression {

	/**
	 * AST node for the expression whose value is the condition for the conditional expression.
	 */
	protected Expression condition;
	
	/**
	 * AST node for the expression whose value is the then parameter for the conditional expression.
	 */
	protected Expression thenExpression;
	
	/**
	 * AST node for the expression whose value is the else parameter for the conditional expression.
	 */
	protected Expression elseExpression;
	
	/**
	 * Builds a binary expression Abstract Syntax Tree node from the left and right sub-expressions
	 * and the binary operation.
	 * @param _left : Expression for the left parameter.
	 * @param _operator : Binary Operator.
	 * @param _right : Expression for the right parameter.
	 */
	public ConditionalExpression(Expression _condition, Expression _then, Expression _else) {
		this.condition = _condition;
		this.thenExpression = _then;
		this.elseExpression = _else;
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.expression.Expression#collect(fr.n7.stl.block.ast.scope.Scope)
	 */
	@Override
	public boolean collectAndBackwardResolve(HierarchicalScope<Declaration> _scope) {
		boolean elseExists = (this.elseExpression != null);
        boolean _result = (this.condition.collectAndBackwardResolve(_scope) && this.thenExpression.collectAndBackwardResolve(_scope));
		//Sans else Branch
        if (!elseExists) {
            return _result;
		//Avec else Branch
        } else {
            return _result && this.elseExpression.collectAndBackwardResolve(_scope);
        }
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.expression.Expression#resolve(fr.n7.stl.block.ast.scope.Scope)
	 */
	@Override
	public boolean fullResolve(HierarchicalScope<Declaration> _scope) {
		boolean elseExists = (this.elseExpression != null);
        boolean _result = (this.condition.fullResolve(_scope) && this.thenExpression.fullResolve(_scope));
        if (!elseExists) {
            return _result;
        } else {
            return _result && this.elseExpression.fullResolve(_scope);
        }
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "(" + this.condition + " ? " + this.thenExpression + " : " + this.elseExpression + ")";
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Expression#getType()
	 */
	@Override
	public Type getType() {
		Type _result;
		
		if (this.condition.getType().compatibleWith(AtomicType.BooleanType)) {
			if (this.thenExpression.getType().compatibleWith(this.elseExpression.getType())) {
				_result = this.thenExpression.getType().merge(this.elseExpression.getType());
			} else {
				Logger.error("Incompatible types for then and else expressions.");
				_result = AtomicType.ErrorType;	
			}
		} else {
			Logger.error("Condition expression is not of BooleanType.");
			_result = AtomicType.ErrorType;
		}
		return _result;
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Expression#getCode(fr.n7.stl.tam.ast.TAMFactory)
	 */
	@Override
	public Fragment getCode(TAMFactory _factory) {
		Fragment fragment = _factory.createFragment();
		String endLabel ="fin_expression_" + _factory.createLabelNumber();
		String elseLabel = "sinon_expression_" + _factory.createLabelNumber();
		
		fragment.append(this.condition.getCode(_factory));
		fragment.add(_factory.createJumpIf(elseLabel, 0));
		fragment.append(this.thenExpression.getCode(_factory));
		fragment.add(_factory.createJump(endLabel));
		fragment.addSuffix(elseLabel);
		fragment.append(this.elseExpression.getCode(_factory));
		fragment.addSuffix(endLabel);
		return fragment;
	}

}
