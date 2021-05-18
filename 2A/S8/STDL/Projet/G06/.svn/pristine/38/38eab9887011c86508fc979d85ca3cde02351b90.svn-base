/**
 * 
 */
package fr.n7.stl.block.ast.instruction.declaration;

import fr.n7.stl.block.ast.SemanticsUndefinedException;
import fr.n7.stl.block.ast.expression.Expression;
import fr.n7.stl.block.ast.instruction.Instruction;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.block.ast.type.NamedType;
import fr.n7.stl.block.ast.type.Type;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.Register;
import fr.n7.stl.tam.ast.TAMFactory;
import fr.n7.stl.util.Logger;

/**
 * Implementation of the Abstract Syntax Tree node for a constant declaration instruction.
 * @author Marc Pantel
 *
 */
public class ConstantDeclaration implements Instruction, Declaration {

	/**
	 * Name of the constant
	 */
	protected String name;
	
	/**
	 * AST node for the type of the constant
	 */
	protected Type type;
	
	/**
	 * AST node for the expression that computes the value of the constant
	 */
	protected Expression value;

	/**
	 * Builds an AST node for a constant declaration
	 * @param _name : Name of the constant
	 * @param _type : AST node for the type of the constant
	 * @param _value : AST node for the expression that computes the value of the constant
	 */
	public ConstantDeclaration(String _name, Type _type, Expression _value) {
		this.name = _name;
		this.type = _type;
		this.value = _value;
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Declaration#getName()
	 */
	@Override
	public String getName() {
		return this.name;
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Declaration#getType()
	 */
	@Override
	public Type getType() {
		return this.type;
	}
	
	/**
	 * Provide the value associated to a name in constant declaration.
	 * @return Value from the declaration.
	 */
	public Expression getValue() {
		return this.value;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	public String toString() {
		return "const " + this.type + " " + this.name + " = " + this.value + ";\n";
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.instruction.Instruction#collect(fr.n7.stl.block.ast.scope.Scope)
	 */
	@Override
	public boolean collectAndBackwardResolve(HierarchicalScope<Declaration> _scope) {
		//Enregistrer la variable si elle est valide
		if(((HierarchicalScope<Declaration>)_scope).accepts(this)) {
			_scope.register(this);
			return this.value.collectAndBackwardResolve(_scope);
		}
		else {
			Logger.error("The identifier " + this.name + " has not been found.");
			return false;
		}
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.instruction.Instruction#resolve(fr.n7.stl.block.ast.scope.Scope)
	 */
	@Override
	public boolean fullResolve(HierarchicalScope<Declaration> _scope) {
		return this.type.resolve(_scope) && this.value.fullResolve(_scope);
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Instruction#checkType()
	 */
	@Override
	public boolean checkType() {
		Type type1 = this.value.getType();
        if(type1 instanceof NamedType) {
            type1 = ((NamedType)type1).getType();
        }
        Type type2 = this.getType();
        if(type2 instanceof NamedType) {
            type2 = ((NamedType)type2).getType();
        }
		return type1.compatibleWith(type2);
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Instruction#allocateMemory(fr.n7.stl.tam.ast.Register, int)
	 */
	@Override
	public int allocateMemory(Register _register, int _offset) {
		return this.type.length();
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Instruction#getCode(fr.n7.stl.tam.ast.TAMFactory)
	 */
	@Override
	public Fragment getCode(TAMFactory _factory) {
		return this.value.getCode(_factory);
	}

}
