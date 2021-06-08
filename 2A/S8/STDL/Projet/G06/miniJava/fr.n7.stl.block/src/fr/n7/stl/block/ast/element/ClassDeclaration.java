package fr.n7.stl.block.ast.element;

import java.util.ArrayList;
import java.util.List;

import fr.n7.stl.block.ast.SemanticsUndefinedException;
import fr.n7.stl.block.ast.classElement.AttributeDeclaration;
import fr.n7.stl.block.ast.classElement.ClassElement;
import fr.n7.stl.block.ast.classElement.ConstructorDeclaration;
import fr.n7.stl.block.ast.classElement.MethodDeclaration;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.block.ast.scope.SymbolTable;
import fr.n7.stl.block.ast.type.Instance;
import fr.n7.stl.block.ast.type.Type;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.Register;
import fr.n7.stl.tam.ast.TAMFactory;
import fr.n7.stl.util.Logger;

public class ClassDeclaration implements Element, Declaration {

	// protected String permission;

	protected String name;

	protected List<ClassElement> classElements;

	protected SymbolTable elementsTable;

	/**
	 * Constructor for a Main.
	 */
	public ClassDeclaration(String _name, List<ClassElement> _classElements) {
		// this.permission = "";
		this.name = _name;
		this.classElements = _classElements;
	}

	/**
	 * Constructor for a Main.
	 */
	public ClassDeclaration(String _permission, String _name, List<ClassElement> _classElements) {
		// this.permission = _permission;
		this.name = _name;
		this.classElements = _classElements;
	}

	public List<ClassElement> getClassElements() {
		return this.classElements;
	}

	public List<AttributeDeclaration> getClassAttributes() {
		List<AttributeDeclaration> list = new ArrayList<>();
		for (Declaration d : classElements) {
			if (d instanceof AttributeDeclaration) {
				list.add((AttributeDeclaration) d);
			}
		}
		return list;
	}

	public List<MethodDeclaration> getClassMethods() {
		List<MethodDeclaration> list = new ArrayList<>();
		for (Declaration d : classElements) {
			if (d instanceof MethodDeclaration) {
				list.add((MethodDeclaration) d);
			}
		}
		return list;
	}

	public List<ConstructorDeclaration> getClassConstructors() {
		List<ConstructorDeclaration> list = new ArrayList<>();
		for (Declaration d : classElements) {
			if (d instanceof ConstructorDeclaration) {
				list.add((ConstructorDeclaration) d);
			}
		}
		return list;
	}

	public SymbolTable getElementsTable() {
		return this.elementsTable;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		String _result = "";
		_result = /* this.permission + */ "class " + this.name + " {\n";

		for (int i = classElements.size() - 1; i >= 0; i--) {
			_result += classElements.get(i).toString();
		}
		_result += "}";
		return _result;
	}

	@Override
	public boolean collect(HierarchicalScope<Declaration> _scope) {
		if (((HierarchicalScope<Declaration>) _scope).accepts(this)) {
			_scope.register(this);
			SymbolTable.classDeclaration = this;
			SymbolTable.classesDeclaration.add(this);
			this.elementsTable = new SymbolTable(_scope);
			boolean _result = true;
			for (int i = classElements.size() - 1; i >= 0; i--) {
				_result = _result && this.classElements.get(i).collectAndBackwardResolve(elementsTable);
			}
			return _result;
		} else {
			Logger.error("The class identifier " + this.name + " is already defined.");
			return false;
		}
	}

	@Override
	public boolean resolve(HierarchicalScope<Declaration> _scope) {
		boolean _result = true;
		for (int i = classElements.size() - 1; i >= 0; i--) {
			_result = _result && this.classElements.get(i).fullResolve(elementsTable);
		}
		return _result;
	}

	@Override
	public boolean checkType() {
		SymbolTable.classDeclaration = this;
		boolean _result = true;
		for (int i = classElements.size() - 1; i >= 0; i--) {
			_result = _result && this.classElements.get(i).checkType();
		}
		return _result;
	}

	@Override
	public int allocateMemory(Register _register, int _offset) {
		return 0;

	}

	@Override
	public Fragment getCode(TAMFactory _factory) {
		Fragment _result = _factory.createFragment();
		SymbolTable.classDeclaration = this;
		for (ClassElement c : this.classElements) {
			_result.append(c.getCode(_factory));
		}
		return _result;
	}

	@Override
	public String getName() {
		return this.name;
	}

	@Override
	public Type getType() {
		return new Instance(name, this);
	}

}
