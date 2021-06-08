/**
 * 
 */
package fr.n7.stl.block.ast.instruction;

import fr.n7.stl.block.ast.classElement.AttributeDeclaration;
import fr.n7.stl.block.ast.classElement.MethodDeclaration;
import fr.n7.stl.block.ast.element.ClassDeclaration;
import fr.n7.stl.block.ast.expression.AbstractField;
import fr.n7.stl.block.ast.expression.Expression;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.block.ast.scope.SymbolTable;
import fr.n7.stl.block.ast.type.AtomicType;
import fr.n7.stl.block.ast.type.Instance;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.Library;
import fr.n7.stl.tam.ast.Register;
import fr.n7.stl.tam.ast.TAMFactory;
import fr.n7.stl.util.Logger;

/**
 * Implementation of the Abstract Syntax Tree node for a printer instruction.
 * @author Marc Pantel
 *
 */
public class Printer implements Instruction {

	protected Expression parameter;

	public Printer(Expression _value) {
		this.parameter = _value;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "print " + this.parameter + ";\n";
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.instruction.Instruction#collect(fr.n7.stl.block.ast.scope.Scope)
	 */
	@Override
	public boolean collectAndBackwardResolve(HierarchicalScope<Declaration> _scope) {
		return this.parameter.collectAndBackwardResolve(_scope);
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.instruction.Instruction#resolve(fr.n7.stl.block.ast.scope.Scope)
	 */
	@Override
	public boolean fullResolve(HierarchicalScope<Declaration> _scope) {
		return this.parameter.fullResolve(_scope);
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Instruction#checkType()
	 */
	@Override
	public boolean checkType() {
		if (this.parameter instanceof AbstractField) {
			Expression record = ((AbstractField) this.parameter).getRecord();
			String name = ((AbstractField) this.parameter).getName();
			if (record.getType() instanceof Instance) {
				for (ClassDeclaration c : SymbolTable.classesDeclaration) {
					if (c.getName().equals(record.getType().toString())) {
						for (AttributeDeclaration a : c.getClassAttributes()) {
							if (a.getName().equals(name)) {
								if (a.getType().equalsTo(AtomicType.BooleanType) || 
									a.getType().equalsTo(AtomicType.IntegerType) || 
									a.getType().equalsTo(AtomicType.StringType) ||
									a.getType().equalsTo(AtomicType.CharacterType) || 
									a.getType().equalsTo(AtomicType.FloatingType)) {
									return true;
								}
							}
						}
						for (MethodDeclaration m : c.getClassMethods()) {
							if (m.getName().equals(name)) {
								if (m.getType().equalsTo(AtomicType.BooleanType) || 
									m.getType().equalsTo(AtomicType.IntegerType) || 
									m.getType().equalsTo(AtomicType.StringType) ||
									m.getType().equalsTo(AtomicType.CharacterType) || 
									m.getType().equalsTo(AtomicType.FloatingType)) {
									return true;
								}
							}
						}
					}
				}
			} else {
				return false;
			}
		}
		if (this.parameter.getType().equalsTo(AtomicType.BooleanType) || 
			this.parameter.getType().equalsTo(AtomicType.IntegerType) || 
			this.parameter.getType().equalsTo(AtomicType.StringType) ||
			this.parameter.getType().equalsTo(AtomicType.CharacterType) || 
			this.parameter.getType().equalsTo(AtomicType.FloatingType)) {
			return true;
		} else {
			Logger.error("The type of printer is incompatible.");
			return false;
		}
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Instruction#allocateMemory(fr.n7.stl.tam.ast.Register, int)
	 */
	@Override
	public int allocateMemory(Register _register, int _offset) {
		return 0;
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Instruction#getCode(fr.n7.stl.tam.ast.TAMFactory)
	 */
	@Override
	public Fragment getCode(TAMFactory _factory) {
		Fragment _result = _factory.createFragment();
		
		if (this.parameter instanceof AbstractField) {
			_result.add(_factory.createLoad(Register.HT, 1, 1));
			_result.add(Library.IOut);
		} else {
			_result.append(this.parameter.getCode(_factory));
		}

		//if (this.parameter instanceof AccessibleExpression) {
		//	_result.add(_factory.createLoadI(this.parameter.getType().length()));
		//}
		
		if (this.parameter.getType() == AtomicType.BooleanType) {
			_result.add(Library.BOut);
		} else if (this.parameter.getType() == AtomicType.IntegerType ){
			_result.add(Library.IOut);
		} else if (this.parameter.getType() == AtomicType.CharacterType) {
			_result.add(Library.COut);
		} else if (this.parameter.getType() == AtomicType.StringType) {
			//_result.add(Library.SOut);
		}
		_result.add(_factory.createLoadL('\n'));
		_result.add(Library.COut);
		return _result;
	}

}
