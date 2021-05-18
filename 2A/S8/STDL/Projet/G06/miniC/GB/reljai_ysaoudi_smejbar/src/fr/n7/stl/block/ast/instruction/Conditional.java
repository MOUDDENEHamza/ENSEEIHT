/**
 * 
 */
package fr.n7.stl.block.ast.instruction;

import java.util.Optional;

import fr.n7.stl.block.ast.Block;
import fr.n7.stl.block.ast.SemanticsUndefinedException;
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
		boolean elseExists = (this.elseBranch != null);
        boolean _result = (this.condition.collectAndBackwardResolve(_scope) && this.thenBranch.collect(_scope));
		//Sans else Branch
        if (!elseExists) {
            return _result;
		//Avec else Branch
        } else {
            return _result && this.elseBranch.collect(_scope);
        }
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.instruction.Instruction#resolve(fr.n7.stl.block.ast.scope.Scope)
	 */
	@Override
	public boolean fullResolve(HierarchicalScope<Declaration> _scope) {
		boolean elseExists = (this.elseBranch != null);
        boolean _result = (this.condition.fullResolve(_scope) && this.thenBranch.resolve(_scope));
        if (!elseExists) {
            return _result;
        } else {
            return _result && this.elseBranch.resolve(_scope);
        }
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Instruction#checkType()
	 */
	@Override
	public boolean checkType() {
		boolean _result = this.condition.getType().compatibleWith(AtomicType.BooleanType) 
						  && this.thenBranch.checkType();
		if (elseBranch != null) {
			_result = _result && this.elseBranch.checkType();
		}
		return _result;
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Instruction#allocateMemory(fr.n7.stl.tam.ast.Register, int)
	 */
	@Override
	public int allocateMemory(Register _register, int _offset) {
		boolean elseExists = (this.elseBranch != null);
		this.thenBranch.allocateMemory(_register, _offset);
		if (elseExists) {
			this.elseBranch.allocateMemory(_register, _offset);
		}
		return 0;
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Instruction#getCode(fr.n7.stl.tam.ast.TAMFactory)
	 */
	@Override
	public Fragment getCode(TAMFactory _factory) {
		boolean elseExists = (this.elseBranch != null);
		Fragment fragment = _factory.createFragment();
		//Labels
        String endLabel ="fin_conditionnelle_" + _factory.createLabelNumber();
		String elseLabel = "sinon_conditionnelle_" + _factory.createLabelNumber();
		
		fragment.append(condition.getCode(_factory));
		if (! elseExists) {
			fragment.add(_factory.createJumpIf(endLabel, 0));
			fragment.append(thenBranch.getCode(_factory));
        } else {
			fragment.add(_factory.createJumpIf(elseLabel, 0));
			fragment.append(thenBranch.getCode(_factory));
			fragment.add(_factory.createJump(endLabel));
			fragment.addSuffix(elseLabel);
			fragment.append(elseBranch.getCode(_factory));
		}
		fragment.addSuffix(endLabel);
        return fragment;
	}

}
