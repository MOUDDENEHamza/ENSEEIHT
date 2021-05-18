/**
 * 
 */
package fr.n7.stl.block.ast.instruction;

import fr.n7.stl.block.ast.Block;
import fr.n7.stl.block.ast.expression.BinaryExpression;
import fr.n7.stl.block.ast.expression.BinaryOperator;
import fr.n7.stl.block.ast.expression.Expression;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.block.ast.type.AtomicType;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.Register;
import fr.n7.stl.tam.ast.TAMFactory;

/**
 * Implementation of the Abstract Syntax Tree node for a conditional instruction.
 * @author Marc Pantel
 *
 */
public class Conditional implements Instruction {

	protected Expression condition;
	protected Block thenBranch;
	protected Block elseBranch;

	public Conditional(Expression _condition, Block _then, Block _else) {
		this.condition = _condition;
		this.thenBranch = _then;
		this.elseBranch = _else;
	}

	public Conditional(Expression _condition, Block _then) {
		this.condition = _condition;
		this.thenBranch = _then;
		this.elseBranch = null;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "if (" + this.condition + " )" + this.thenBranch + ((this.elseBranch != null)?(" else " + this.elseBranch):"");
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.instruction.Instruction#collect(fr.n7.stl.block.ast.scope.Scope)
	 */
	@Override
	public boolean collectAndBackwardResolve(HierarchicalScope<Declaration> _scope) {
		if (elseBranch == null) {
			return this.condition.collectAndBackwardResolve(_scope) && this.thenBranch.collect(_scope);
		} else {
			return this.condition.collectAndBackwardResolve(_scope) && this.thenBranch.collect(_scope) && this.elseBranch.collect(_scope);
		}
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.instruction.Instruction#resolve(fr.n7.stl.block.ast.scope.Scope)
	 */
	@Override
	public boolean fullResolve(HierarchicalScope<Declaration> _scope) {
		if (elseBranch == null) {
			return this.condition.fullResolve(_scope) && this.thenBranch.resolve(_scope);
		} else {
			return this.condition.fullResolve(_scope) && this.thenBranch.resolve(_scope) && this.elseBranch.resolve(_scope);
		}
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Instruction#checkType()
	 */
	@Override
	public boolean checkType() {
		boolean result = this.condition.getType().compatibleWith(AtomicType.BooleanType);
		if (elseBranch == null) {
			result = result && this.thenBranch.checkType() ;
		} else {
			result = result && this.thenBranch.checkType() && this.elseBranch.checkType();
		}
		return result;
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Instruction#allocateMemory(fr.n7.stl.tam.ast.Register, int)
	 */
	@Override
	public int allocateMemory(Register _register, int _offset) {
		this.thenBranch.allocateMemory(_register, _offset);
		if (this.elseBranch != null) {
			this.elseBranch.allocateMemory(_register, _offset);
		}
		return 0;
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Instruction#getCode(fr.n7.stl.tam.ast.TAMFactory)
	 */
	@Override
	public Fragment getCode(TAMFactory _factory) {
		Fragment _result = _factory.createFragment();
		int id = _factory.createLabelNumber();
		_result.append(this.condition.getCode(_factory));
		//_result.add(_factory.createPop(0, 1));
		//_result.add(_factory.createPush(1));
		if (this.elseBranch == null) {
			_result.add(_factory.createJumpIf("endif" + id, 0));
			_result.append(this.thenBranch.getCode(_factory ));
		} else {
			_result.add(_factory.createJumpIf("else" + id, 0));
			_result.append(this.thenBranch.getCode(_factory));
			_result.add(_factory.createJump("endif" + id));
			_result.addSuffix("else" + id);
			_result.append(this.elseBranch.getCode(_factory));
		}
		_result.addSuffix("endif" + id);
		return _result;
	}

}
