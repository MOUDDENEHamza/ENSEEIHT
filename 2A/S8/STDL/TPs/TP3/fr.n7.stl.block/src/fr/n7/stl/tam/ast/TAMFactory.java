/**
 * 
 */
package fr.n7.stl.tam.ast;

import java.util.List;

import fr.n7.stl.block.ast.SemanticsUndefinedException;
import fr.n7.stl.block.ast.expression.BinaryOperator;
import fr.n7.stl.block.ast.expression.UnaryOperator;

/**
 * Factory to build abstract syntax tree nodes for the TAM language.
 * @author Marc Pantel
 *
 */
public interface TAMFactory {

	/**
	 * Build a TAM Push instruction AST node.
	 * @param _size Size of the memory chunk that is added on top of the stack.
	 * @return A TAM Push instruction AST node.
	 */
	public TAMInstruction createPush(int _size);
	
	/**
	 * Build a TAM Pop instruction AST node.
	 * @param _keep Size of the memory chunk that is preserved on top of the stack.
	 * @param _remove Size of the memory chunk that is removed from the top of the stack.
	 * @return A TAM Pop instruction AST node.
	 */
	public TAMInstruction createPop(int _keep, int _remove);
	
	/**
	 * Build a TAM Load instruction AST node.
	 * @param _register Register for the memory chunk that is copied on the stack.
	 * @param _offset Offset for the memory chunk that is copied on the stack.
	 * @param _size Size of the memory chunk that is copied on the stack.
	 * @return A TAM Load instruction AST node.
	 */
	public TAMInstruction createLoad(Register _register, int _offset, int _size);

	/**
	 * Build a TAM integer constant Load instruction AST node.
	 * @param _value Value of the integer constant that is copied on the stack.
	 * @return A TAM integer constant Load instruction AST node.
	 */
	public TAMInstruction createLoadL(int _value);
	
	/**
	 * Build a TAM address Load instruction AST node whose execution 
	 * loads an address on the stack.
	 * @param _register Register for the address whose value is loaded on the stack.
	 * @param _offset Offset for the address whose value is loaded on the stack.
	 * @return A TAM address Load instruction AST node.
	 */
	public TAMInstruction createLoadA(Register _register, int _offset);
	
	/**
	 * Build a TAM address Load address instruction AST node whose execution 
	 * loads an address on the stack.
	 * @param _label Label that will be translated to an address whose
	 * value is loaded on the stack.
	 * @return A TAM address Load instruction AST node.
	 */
	public TAMInstruction createLoadA(String _label);
	
	/**
	 * Build a TAM Load Immediate instruction AST node whose execution will pop 
	 * an address from the stack and copy on the stack a memory chunk located at
	 * that address of a provided size.
	 * @param _size Size of the memory chunk copied on the stack after popping the address.
	 * @return A TAM Load Immediate instruction AST node.
	 */
	public TAMInstruction createLoadI(int _size);
	
	/**
	 * Build a TAM Store instruction AST node whose execution will copy from the stack
	 * a memory chunk of the provided size to the provided location.
	 * @param _register Register for the address of the memory chunk.
	 * @param _offset Offset for the address of the memory chunk.
	 * @param _size : Size of the memory chunk that is copied.
	 * @return A TAM Store instruction AST node.
	 */
	public TAMInstruction createStore(Register _register, int _offset, int _size);
	
	/**
	 * Build a TAM Store Immediate instruction AST node whose execution will pop a memory
	 * address from the stack and then copy a memory chunk of the provided size to that
	 * address.
	 * @param _size : Size of the memory chunk that is copied.
	 * @return A TAM Store Immediate instruction AST node.
	 */
	public TAMInstruction createStoreI(int _size);

	/**
	 * Build a TAM Jump instruction AST node whose execution will transfer the control 
	 * (register CP - Code Pointer) to the provided location.
	 * @param _register Register for the address where the control is transfered to.
	 * @param _offset Offset for the address where the control is transfered to.
	 * @return A TAM Jump instruction AST node.
	 */
	public TAMInstruction createJump(Register _register, int _offset);
	
	/**
	 * Build a TAM Jump instruction AST node whose execution will transfer the control 
	 * (register CP - Code Pointer) to the address resolved from the provided label.
	 * @param _label Label that will be resolved to an address.
	 * @return A TAM Jump instruction AST node.
	 */
	public TAMInstruction createJump(String _label);

	/**
	 * Build a TAM conditional Jump instruction AST node whose execution will transfer 
	 * the control (register CP - Code Pointer) to the provided location if the top of
	 * the stack contains the provided value.
	 * @param _register Register for the address where the control is transfered to.
	 * @param _offset Offset for the address where the control is transfered to.
	 * @param _value : Integer whose value is compared with the top of the stack.
	 * @return A TAM conditional Jump instruction AST node.
	 */
	public TAMInstruction createJumpIf(Register _register, int _offset, int _value);

	/**
	 * Build a TAM conditional Jump instruction AST node whose execution will transfer 
	 * the control (register CP - Code Pointer) to the address resulting from the
	 * resolution of the provided label if the top of the stack contains the provided value.
	 * @param _label : Label which is resolved to the address assigned to the Code Pointer.
	 * @param _value : Integer whose value is compared with the top of the stack.
	 * @return A TAM conditional Jump instruction AST node.
	 */
	public TAMInstruction createJumpIf(String _label, int _value);
	
	/**
	 * Build a TAM Halt instruction AST node whose execution will halt the program.
	 *  @return A TAM Halt instruction AST node.
	 */
	public TAMInstruction createHalt();

	/**
	 * Build a TAM Call instruction AST node whose execution will build a call frame 
	 * (current value of LB, current value of ST, current value of CP), push it
	 * on the stack and transfer the control to the provided location (assign the Control Pointer
	 * register to the address of the provided location).
	 * @param _register Register for the address where the control is transfered to.
	 * @param _offset Offset for the address where the control is transfered to.
	 * @param _frame The caller frame in the call stack.
	 * @return A TAM Call instruction AST node.
	 */
	public TAMInstruction createCall(Register _register, int _offset, Register _frame);

	/**
	 * Build a TAM Call instruction AST node whose execution will build a call frame 
	 * (current value of LB, current value of ST, current value of CP), push it
	 * on the stack and transfer the control to the address resolved from the provided
	 * label (assign the Control Pointer register to that address).
	 * @param _label : Label whose resolved address is where the control will be transfered.
	 * @param _frame The caller frame in the call stack.
	 * @return A TAM Call instruction AST node.
	 */
	public TAMInstruction createCall(String _label, Register _frame);

	/**
	 * Build a TAM Call Immediate instruction AST node whose execution will pop an address
	 * from the stack, build a call frame (current value of LB, current value of ST, current
	 * value of CP), push it on the stack and transfer the control to the popped address
	 * (assign the Control Pointer register to that address).
	 * @param _frame The caller frame in the call stack.
	 * @return A TAM Call Immediate instruction AST node.
	 */
	public TAMInstruction createCallI(Register _frame);

	/**
	 * Build a TAM Return instruction AST node whose execution will pop a memory chunk of the
	 * provided _keep size then will pop a call frame from the stack, then will pop a second memory
	 * chunk from the stack of the provided _remove size, restore the various registers from the call
	 * frame and push the first chunk on the stack.
	 * @param _keep : The size of the memory chunk that is copied from the top of the stack
	 * before removing the execution frame from the call stack, and copied back to the top of the 
	 * stack after removing the execution frame.
	 * @param _remove : The size of the memory chunk that is removed with the execution frame.
	 * @return A TAM Return instruction AST node.
	 */
	public TAMInstruction createReturn(int _keep, int _remove);

	/**
	 * Build an empty TAM fragment AST node.
	 * @return An empty TAM fragment AST node.
	 */
	public Fragment createFragment();

	/**
	 * Build a TAM fragment AST node that executes a sequence of TAMInstruction.
	 * @param _instructions The sequence of TAMInstruction that makes the fragment.
	 * @return A TAM fragment AST node containing a sequence of TAMInstruction.
	 */
	public Fragment createFragment(List<TAMInstruction> _instructions);

	/**
	 * Build a TAM binary operator instruction AST node whose execution will pop two
	 * values from the stack, compute the result of the binary operator applied to
	 * these values and push the result on the stack.
	 * @param _operator The binary operator from the Bloc language.
	 * @return A TAM instruction AST node corresponding to a binary operator.
	 */
	public static TAMInstruction createBinaryOperator(BinaryOperator _operator) {
		switch (_operator) {
		case Add : return Library.IAdd;
		case And: return Library.BAnd;
		case Different: return Library.INeq;
		case Divide: return Library.IDiv;
		case Equals: return Library.IEq;
		case Greater: return Library.IGtr;
		case GreaterOrEqual: return Library.IGeq;
		case Lesser: return Library.ILss;
		case LesserOrEqual: return Library.ILeq;
		case Modulo: return Library.IMod;
		case Multiply: return Library.IMul;
		case Or: return Library.BOr;
		case Substract: return Library.ISub;
		default: throw new SemanticsUndefinedException("Unexpected unary operator: " + _operator);
		}
	}
	
	/**
	 * Build a TAM unary operator instruction AST node whose execution will pop one
	 * value from the stack, compute the result of the unary operator applied to
	 * that value and push the result on the stack.
	 * @param _operator The unary operator from the Bloc language.
	 * @return A TAM instruction AST node corresponding to an unary operator.
	 */
	public static TAMInstruction createUnaryOperator(UnaryOperator _operator) {
		switch (_operator) {
		case Negate : return Library.BNeg;
		case Opposite : return Library.INeg;
		default: return null;
		}
	}
	
	public int createLabelNumber();

}
