/**
 * 
 */
package fr.n7.stl.block.ast.expression;

import java.util.Iterator;
import java.util.List;

import fr.n7.stl.block.ast.SemanticsUndefinedException;
import fr.n7.stl.block.ast.instruction.declaration.FunctionDeclaration;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.block.ast.type.AtomicType;
import fr.n7.stl.block.ast.type.Type;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.Register;
import fr.n7.stl.tam.ast.TAMFactory;
import fr.n7.stl.util.Logger;
import fr.n7.stl.block.ast.instruction.declaration.ParameterDeclaration;

/**
 * Abstract Syntax Tree node for a function call expression.
 * @author Marc Pantel
 *
 */
public class FunctionCall implements Expression {

	/**
	 * Name of the called function.
	 * TODO : Should be an expression.
	 */
	protected String name;
	
	/**
	 * Declaration of the called function after name resolution.
	 * TODO : Should rely on the VariableUse class.
	 */
	protected FunctionDeclaration function;
	
	/**
	 * List of AST nodes that computes the values of the parameters for the function call.
	 */
	protected List<Expression> arguments;
	
	/**
	 * @param _name : Name of the called function.
	 * @param _arguments : List of AST nodes that computes the values of the parameters for the function call.
	 */
	public FunctionCall(String _name, List<Expression> _arguments) {
		this.name = _name;
		this.function = null;
		this.arguments = _arguments;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		String _result = this.name + "( ";
		Iterator<Expression> _iter = this.arguments.iterator();
		if (_iter.hasNext()) {
			_result += _iter.next();
		}
		while (_iter.hasNext()) {
			_result += " ," + _iter.next();
		}
		return  _result + ")";
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.expression.Expression#collect(fr.n7.stl.block.ast.scope.HierarchicalScope)
	 */
	@Override																																												
	public boolean collectAndBackwardResolve(HierarchicalScope<Declaration> _scope) {
		boolean _result = true;
		//On récupère la fonction
		Declaration dec = _scope.get(this.name);
		//Function bien définie
		if (dec instanceof FunctionDeclaration) {																																																																							
			this.function = (FunctionDeclaration) dec;
			if (this.arguments.size() != function.getParameters().size()) {
				Logger.error("Expected " + this.arguments.size() +" arguments, but found " + this.function.getParameters().size() );
    			return _result && false;
			} else {
				for (Expression arg : this.arguments) {
					_result = _result && arg.collectAndBackwardResolve(_scope);																	
				}
				return _result;		
			}													
		} else {
			Logger.error("The function identifier " + this.name + " is not defined.");
			return false;
		}
	}

	/* (non-Javadoc)																																																																																																																																																																														
	 * @see fr.n7.stl.block.ast.expression.Expression#resolve(fr.n7.stl.block.ast.scope.HierarchicalScope)
	 */
	@Override
	public boolean fullResolve(HierarchicalScope<Declaration> _scope) {
		boolean _result = true;
		//On récupère la fonction
		Declaration dec = _scope.get(this.name);
		//Function bien définie
		if (dec instanceof FunctionDeclaration) {																																																																							
			this.function = (FunctionDeclaration) dec;
			if (this.arguments.size() != function.getParameters().size()) {
				Logger.error("Expected " + this.arguments.size() +" arguments, but found " + this.function.getParameters().size() );
    			return _result && false;
			} else {
				for (Expression arg : this.arguments) {
					_result = _result && arg.fullResolve(_scope);																	
				}
				return _result;		
			}													
		} else {
			Logger.error("The function identifier " + this.name + " is not defined.");
			return false;
		}

	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Expression#getType()
	 */
	@Override
	public Type getType() {
        List<ParameterDeclaration> listParameters = this.function.getParameters();
        for(int i = 0; i<arguments.size();i++)
        {
            if(!(this.arguments.get(i).getType().compatibleWith(listParameters.get(i).getType()))) {
                return AtomicType.ErrorType;
            }
        }
        return this.function.getType();
    }

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Expression#getCode(fr.n7.stl.tam.ast.TAMFactory)
	 */
	@Override
	public Fragment getCode(TAMFactory _factory) {
		Fragment fragment = _factory.createFragment();
		for (Expression arg : this.arguments) {
			fragment.append(arg.getCode(_factory));
		}
		fragment.add(_factory.createCall(this.name,Register.SB));
		return fragment;
	}

}
