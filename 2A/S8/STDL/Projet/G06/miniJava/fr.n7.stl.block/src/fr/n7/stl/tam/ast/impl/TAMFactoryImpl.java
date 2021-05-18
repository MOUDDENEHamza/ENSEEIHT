/**
 * 
 */
package fr.n7.stl.tam.ast.impl;

import java.util.List;
import java.util.Optional;

import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.Register;
import fr.n7.stl.tam.ast.TAMFactory;
import fr.n7.stl.tam.ast.TAMInstruction;

/**
 * Implementation of the factory to build a TAM program AST.
 * It relies on a single implementation class TAMInstructionImpl.
 * @author Marc Pantel
 *
 */
public class TAMFactoryImpl implements TAMFactory {
	
	private static int labelNumber = 0;

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createFragment()
	 */
	@Override
	public Fragment createFragment() {
		return new FragmentImpl();
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createLoadL(int)
	 */
	@Override
	public TAMInstruction createLoadL(int _value) {
		return new TAMInstructionImpl(
				TAMInstructionKind.LOADL,
				Optional.empty(),
				Optional.empty(),
				Optional.of(_value),
				Optional.empty(), 
				Optional.empty(),
				Optional.empty());
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createPush(int)
	 */
	@Override
	public TAMInstruction createPush(int _size) {
		return new TAMInstructionImpl(
				TAMInstructionKind.PUSH,
				Optional.empty(),
				Optional.empty(),
				Optional.of(_size),
				Optional.empty(), 
				Optional.empty(),
				Optional.empty());
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createPop(int, int)
	 */
	@Override
	public TAMInstruction createPop(int _keep, int _remove) {
		return new TAMInstructionImpl(
				TAMInstructionKind.POP,
				Optional.empty(),
				Optional.empty(),
				Optional.of(_remove),
				Optional.empty(), 
				Optional.of(_keep),
				Optional.empty());
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createLoad(fr.n7.stl.tam.ast.Register, int, int)
	 */
	@Override
	public TAMInstruction createLoad(Register _register, int _offset, int _size) {
		return new TAMInstructionImpl(
				TAMInstructionKind.LOAD,
				Optional.empty(),
				Optional.of(_register),
				Optional.of(_offset),
				Optional.empty(), 
				Optional.of(_size),
				Optional.empty());
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createLoadA(fr.n7.stl.tam.ast.Register, int)
	 */
	@Override
	public TAMInstruction createLoadA(Register _register, int _offset) {
		return new TAMInstructionImpl(
				TAMInstructionKind.LOADA,
				Optional.empty(),
				Optional.of(_register),
				Optional.of(_offset),
				Optional.empty(), 
				Optional.empty(),
				Optional.empty());
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createLoadA(java.lang.String)
	 */
	@Override
	public TAMInstruction createLoadA(String _label) {
		return new TAMInstructionImpl(
				TAMInstructionKind.LOADA,
				Optional.empty(),
				Optional.empty(), 
				Optional.empty(), 
				Optional.of(_label),
				Optional.empty(),
				Optional.empty());
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createLoadI(int)
	 */
	@Override
	public TAMInstruction createLoadI(int _size) {
		return new TAMInstructionImpl(
				TAMInstructionKind.LOADI,
				Optional.empty(),
				Optional.empty(),
				Optional.empty(), 
				Optional.empty(), 
				Optional.of(_size),
				Optional.empty());
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createStore(fr.n7.stl.tam.ast.Register, int, int)
	 */
	@Override
	public TAMInstruction createStore(Register _register, int _offset, int _size) {
		return new TAMInstructionImpl(
				TAMInstructionKind.STORE,
				Optional.empty(),
				Optional.of(_register),
				Optional.of(_offset),
				Optional.empty(), 
				Optional.of(_size),
				Optional.empty());
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createStoreI(int)
	 */
	@Override
	public TAMInstruction createStoreI(int _size) {
		return new TAMInstructionImpl(
				TAMInstructionKind.STOREI,
				Optional.empty(),
				Optional.empty(),
				Optional.empty(),
				Optional.empty(), 
				Optional.of(_size),
				Optional.empty());
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createJump(fr.n7.stl.tam.ast.Register, int)
	 */
	@Override
	public TAMInstruction createJump(Register _register, int _offset) {
		return new TAMInstructionImpl(
				TAMInstructionKind.JUMP,
				Optional.empty(),
				Optional.of(_register),
				Optional.of(_offset),
				Optional.empty(), 
				Optional.empty(),
				Optional.empty());
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createJump(java.lang.String)
	 */
	@Override
	public TAMInstruction createJump(String _label) {
		return new TAMInstructionImpl(
				TAMInstructionKind.JUMP,
				Optional.empty(),
				Optional.empty(), 				
				Optional.empty(), 
				Optional.of(_label),
				Optional.empty(),
				Optional.empty());
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createJumpIf(fr.n7.stl.tam.ast.Register, int, int)
	 */
	@Override
	public TAMInstruction createJumpIf(Register _register, int _offset, int _value) {
		return new TAMInstructionImpl(
				TAMInstructionKind.JUMPIF,
				Optional.empty(),
				Optional.of(_register),
				Optional.of(_offset),
				Optional.empty(), 
				Optional.empty(),
				Optional.empty());
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createJumpIf(java.lang.String, int)
	 */
	@Override
	public TAMInstruction createJumpIf(String _label, int _value) {
		return new TAMInstructionImpl(
				TAMInstructionKind.JUMPIF,
				Optional.empty(),
				Optional.empty(), 
				Optional.empty(), 
				Optional.of(_label),
				Optional.of(_value),
				Optional.empty());
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createHalt()
	 */
	@Override
	public TAMInstruction createHalt() {
		return new TAMInstructionImpl(
				TAMInstructionKind.HALT,
				Optional.empty(),
				Optional.empty(), 
				Optional.empty(),
				Optional.empty(), 
				Optional.empty(),
				Optional.empty());
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createCall(fr.n7.stl.tam.ast.Register, int, int)
	 */
	@Override
	public TAMInstruction createCall(Register _register, int _offset, Register _frame) {
		return new TAMInstructionImpl(
				TAMInstructionKind.CALL,
				Optional.empty(),
				Optional.of(_register),
				Optional.of(_offset),
				Optional.empty(), 
				Optional.empty(),
				Optional.of(_frame));
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createCall(java.lang.String, int)
	 */
	@Override
	public TAMInstruction createCall(String _label, Register _frame) {
		return new TAMInstructionImpl(
				TAMInstructionKind.CALL,
				Optional.empty(),
				Optional.empty(), 
				Optional.empty(), 
				Optional.of(_label),
				Optional.empty(),
				Optional.of(_frame));
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createCallI(int)
	 */
	@Override
	public TAMInstruction createCallI(Register _frame) {
		return new TAMInstructionImpl(
				TAMInstructionKind.CALLI,
				Optional.empty(),
				Optional.empty(), 
				Optional.empty(),
				Optional.empty(), 
				Optional.empty(),
				Optional.of(_frame));
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createReturn(int, int)
	 */
	@Override
	public TAMInstruction createReturn(int _keep, int _remove) {
		return new TAMInstructionImpl(
				TAMInstructionKind.RETURN,
				Optional.empty(),
				Optional.empty(), 
				Optional.of(_remove),
				Optional.empty(), 
				Optional.of(_keep),
				Optional.empty());
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMFactory#createFragment(java.util.List)
	 */
	@Override
	public Fragment createFragment(List<TAMInstruction> _instructions) {
		Fragment _local = new FragmentImpl();
		for (TAMInstruction _instruction : _instructions) {
			_local.add(_instruction);
		}
		return _local;
	}

	@Override
	public int createLabelNumber() {
		labelNumber++;
		return labelNumber;
	}

}
