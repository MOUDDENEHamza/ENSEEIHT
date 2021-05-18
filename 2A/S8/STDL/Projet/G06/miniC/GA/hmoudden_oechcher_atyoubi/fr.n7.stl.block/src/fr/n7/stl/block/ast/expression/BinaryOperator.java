/**
 * 
 */
package fr.n7.stl.block.ast.expression;

/**
 * Binary operators in the Bloc language.
 * @author Marc Pantel
 *
 */
public enum BinaryOperator {
	
	/**
	 * Numeric addition and String concatenation
	 */
	Add,
	Substract,
	Multiply,
	Divide,
	Modulo,
	Equals,
	Different,
	Greater,
	Lesser,
	And,
	Or, 
	LesserOrEqual, 
	GreaterOrEqual;

	@Override
	public String toString() {
		switch (this) {
		case Add: return "+";
		case And: return "&&";
		case Different: return "!=";
		case Divide: return "/";
		case Equals: return "==";
		case Greater: return ">";
		case GreaterOrEqual: return ">=";
		case Lesser: return "<";
		case LesserOrEqual: return "<=";
		case Modulo: return "%";
		case Multiply: return "*";
		case Or: return "||";
		case Substract: return "-";
		default: throw new IllegalArgumentException( "The default case should never be triggered.");		
		}
	}
}
