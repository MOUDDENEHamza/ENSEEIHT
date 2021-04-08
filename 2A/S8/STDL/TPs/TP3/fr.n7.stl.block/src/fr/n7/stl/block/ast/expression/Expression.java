package fr.n7.stl.block.ast.expression;

import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.block.ast.type.Type;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.TAMFactory;

/**
 * Represents an Expression node in the Abstract Syntax Tree node for the Bloc language.
 * Declares the various semantics attributes for the node.
 * @author Marc Pantel
 *
 */
public interface Expression {
	
	/**
	 * Inherited Semantics attribute to collect all the identifiers declaration and check
	 * that the declaration are allowed.
	 * @param _scope Inherited Scope attribute that contains the identifiers defined previously
	 * in the context.
	 * @return Synthesized Semantics attribute that indicates if the identifier declaration are
	 * allowed.
	 */
	public boolean collectAndBackwardResolve(HierarchicalScope<Declaration> _scope);
	
	/**
	 * Inherited Semantics attribute to transmit the scope, fill it and modify the AST
	 * @param _scope Inherited Scope that should contain the declarations used in the Expression
	 * @return Synthesized Semantics attribute that indicates if the identifier used in the
	 * expression have been previously defined.
	 */
	public boolean fullResolve(HierarchicalScope<Declaration> _scope);
	
	/**
	 * Synthesized Semantics attribute to compute the type of an expression.
	 * @return Synthesized Type of the expression.
	 */
	public Type getType();
	
	/**
	 * Inherited Semantics attribute to build the nodes of the abstract syntax tree for the generated TAM code.
	 * Synthesized Semantics attribute that provide the generated TAM code.
	 * @param _factory Inherited Factory to build AST nodes for TAM code.
	 * @return Synthesized AST for the generated TAM code.
	 */
	public Fragment getCode(TAMFactory _factory);

}
