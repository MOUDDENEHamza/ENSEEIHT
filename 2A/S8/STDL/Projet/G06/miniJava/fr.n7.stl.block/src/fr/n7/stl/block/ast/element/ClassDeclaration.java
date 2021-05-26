package fr.n7.stl.block.ast.element;

import java.util.List;

import fr.n7.stl.block.ast.classElement.ClassElement;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.Register;
import fr.n7.stl.tam.ast.TAMFactory;

public class ClassDeclaration implements Element {
    
	protected String permission;

    protected String name;

    protected List<ClassElement> classElements;

	/**
	 * Constructor for a Main.
	 */
	public ClassDeclaration(String _name, List<ClassElement> _classElements) {
		this.permission = "";
		this.name = _name;
		this.classElements = _classElements;
	}

	/**
	 * Constructor for a Main.
	 */
	public ClassDeclaration(String _permission, String _name, List<ClassElement> _classElements) {
		this.permission = _permission;
		this.name = _name;
		this.classElements = _classElements;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		String _result = "";
		_result = this.permission + " class " + this.name + " {\n";
		for (ClassElement c : this.classElements) {
			_result += c.toString(); 
		}
		_result += "}";
		return _result;
	}

	@Override
	public boolean collect(HierarchicalScope<Declaration> _scope) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean resolve(HierarchicalScope<Declaration> _scope) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean checkType() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int allocateMemory(Register _register, int _offset) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Fragment getCode(TAMFactory _factory) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
