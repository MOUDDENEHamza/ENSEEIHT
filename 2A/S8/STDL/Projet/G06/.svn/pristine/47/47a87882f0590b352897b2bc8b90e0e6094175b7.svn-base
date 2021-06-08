package fr.n7.stl.block.ast.expression;

import fr.n7.stl.block.ast.classElement.AccessRight;
import fr.n7.stl.block.ast.classElement.AttributeDeclaration;
import fr.n7.stl.block.ast.classElement.MethodDeclaration;
import fr.n7.stl.block.ast.element.ClassDeclaration;
import fr.n7.stl.block.ast.instruction.Return;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.block.ast.scope.SymbolTable;
import fr.n7.stl.block.ast.type.AtomicType;
import fr.n7.stl.block.ast.type.Instance;
import fr.n7.stl.block.ast.type.NamedType;
import fr.n7.stl.block.ast.type.RecordType;
import fr.n7.stl.block.ast.type.Type;
import fr.n7.stl.block.ast.type.declaration.FieldDeclaration;
import fr.n7.stl.util.Logger;

/**
 * Common elements between left (Assignable) and right (Expression) end sides of
 * assignments. These elements share attributes, toString and getType methods.
 * 
 * @author Marc Pantel
 *
 */
public abstract class AbstractField implements Expression {

	protected Expression record;
	protected String name;
	protected FieldDeclaration field;
	protected RecordType recordType;

	/**
	 * Construction for the implementation of a record field access expression
	 * Abstract Syntax Tree node.
	 * 
	 * @param _record Abstract Syntax Tree for the record part in a record field
	 *                access expression.
	 * @param _name   Name of the field in the record field access expression.
	 */
	public AbstractField(Expression _record, String _name) {
		this.record = _record;
		this.name = _name;
	}

	public Expression getRecord() {
		return this.record;
	}

	public String getName() {
		return this.name;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return this.record + "." + this.name;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * fr.n7.stl.block.ast.expression.Expression#collect(fr.n7.stl.block.ast.scope.
	 * HierarchicalScope)
	 */
	@Override
	public boolean collectAndBackwardResolve(HierarchicalScope<Declaration> _scope) {
		return this.record.collectAndBackwardResolve(_scope);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * fr.n7.stl.block.ast.expression.Expression#resolve(fr.n7.stl.block.ast.scope.
	 * HierarchicalScope)
	 */
	@Override
	public boolean fullResolve(HierarchicalScope<Declaration> _scope) {
		if (this.record.toString().equals("this") && SymbolTable.classDeclaration != null) {
			if ((SymbolTable.classDeclaration.getElementsTable().knows(this.name))) {
				Declaration _declaration = SymbolTable.classDeclaration.getElementsTable().get(this.name);
				if (_declaration instanceof AttributeDeclaration) {
					return true;
				} else {
					Logger.error("The attribute " + this.name + " isn't a class attribute !");
					return false;
				}
			} else {
				Logger.error("The attribute " + this.name + " doesn't exist !");
				return false;
			}
		}
		Boolean _result = this.record.fullResolve(_scope);
		Type _type = this.record.getType();
		if (_type instanceof Instance) {
			Declaration d = _scope.get(_type.toString());
			if (d instanceof ClassDeclaration) {
				if (((ClassDeclaration) d).getElementsTable().contains(this.name)) {
					Declaration dec = ((ClassDeclaration) d).getElementsTable().get(name);
					if (dec instanceof AttributeDeclaration) {
						if (((AttributeDeclaration) dec).getAccessRight().equals(AccessRight.Private)) {
							Logger.error("The attribute " + name + " is private. It can't be accessed !");
							return false;
						} else {
							_result = _result && ((AttributeDeclaration) dec).fullResolve(_scope);
						}
					}
				} else {
					Logger.error("The element " + name + " doesn't exist !");
					return false;
				}
			}
		}
		if (_type instanceof NamedType) {
			_type = ((NamedType) _type).getType();
		}
		if (_type instanceof RecordType) {
			this.recordType = (RecordType) _type;
			this.field = this.recordType.get(this.name);
		}
		return _result;
	}

	/**
	 * Synthesized Semantics attribute to compute the type of an expression.
	 * 
	 * @return Synthesized Type of the expression.
	 */
	public Type getType() {
		this.record.getType();
		if (this.field != null) {
			return this.field.getType();
		} else {
			return AtomicType.ErrorType;
		}
	}

}