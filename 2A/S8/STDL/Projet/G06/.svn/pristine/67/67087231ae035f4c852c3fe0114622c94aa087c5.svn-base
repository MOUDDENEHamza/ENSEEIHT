package fr.n7.stl.block.ast;

import java.util.List;

import fr.n7.stl.block.ast.element.Element;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.Register;
import fr.n7.stl.tam.ast.TAMFactory;

public class Elements {

	/**
	 * Sequence of instructions contained in a block.
	 */
	protected List<Element> elements;

	/**
	 * Constructor for a block.
	 */
	public Elements(List<Element> _elements) {
		this.elements = _elements;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		System.out.println("test");
		String _result = "";
		for (Element _element : this.elements) {
			_result += _element;
		}
		return _result;
	}
	
	/**
	 * Inherited Semantics attribute to collect all the identifiers declaration and check
	 * that the declaration are allowed.
	 * @param _scope Inherited Scope attribute that contains the identifiers defined previously
	 * in the context.
	 * @return Synthesized Semantics attribute that indicates if the identifier declaration are
	 * allowed.
	 */
	public boolean collect(HierarchicalScope<Declaration> _scope) {
		boolean _result = true;
		for (int i = 0; i < this.elements.size(); i++) {
			_result = _result && this.elements.get(i).collect(_scope);
		}
		return _result;
	}
	
	/**
	 * Inherited Semantics attribute to check that all identifiers have been defined and
	 * associate all identifiers uses with their definitions.
	 * @param _scope Inherited Scope attribute that contains the defined identifiers.
	 * @return Synthesized Semantics attribute that indicates if the identifier used in the
	 * block have been previously defined.
	 */
	public boolean resolve(HierarchicalScope<Declaration> _scope) {
		boolean _result = true;
		for (int i = 0; i < this.elements.size(); i++) {
			_result = _result && this.elements.get(i).resolve(_scope);
		}
		return _result;
	}

	/**
	 * Synthesized Semantics attribute to check that an instruction if well typed.
	 * @return Synthesized True if the instruction is well typed, False if not.
	 */	
	public boolean checkType() {
		boolean _result = true;
		for (int i = 0; i < this.elements.size(); i++) {
			_result = _result && this.elements.get(i).checkType();
		}
		return _result;
	}

	/**
	 * Inherited Semantics attribute to allocate memory for the variables declared in the instruction.
	 * Synthesized Semantics attribute that compute the size of the allocated memory. 
	 * @param _register Inherited Register associated to the address of the variables.
	 * @param _offset Inherited Current offset for the address of the variables.
	 */	
	public void allocateMemory(Register _register, int _offset) {
		
	}

	/**
	 * Inherited Semantics attribute to build the nodes of the abstract syntax tree for the generated TAM code.
	 * Synthesized Semantics attribute that provide the generated TAM code.
	 * @param _factory Inherited Factory to build AST nodes for TAM code.
	 * @return Synthesized AST for the generated TAM code.
	 */
	public Fragment getCode(TAMFactory _factory) {
		Fragment _result = _factory.createFragment();
		return _result;
	}

}

