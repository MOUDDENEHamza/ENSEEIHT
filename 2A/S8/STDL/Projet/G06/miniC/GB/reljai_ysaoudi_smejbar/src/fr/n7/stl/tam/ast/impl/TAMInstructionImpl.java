/**
 * 
 */
package fr.n7.stl.tam.ast.impl;

import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

import fr.n7.stl.tam.ast.Register;
import fr.n7.stl.tam.ast.TAMInstruction;

/**
 * Abstract class that gathers the common attributes for all TAM instructions.
 * @author Marc Pantel
 *
 */
class TAMInstructionImpl implements TAMInstruction {

	/**
	 * Each TAM instruction has a unique kind, i.e. the name of the instruction.
	 */
	private TAMInstructionKind kind;
	
	/**
	 * Each TAM instruction can have prefix comments used for relating this instruction 
	 * to the block source code.
	 */
	protected List<String> comments;
	
	/**
	 * Each TAM instruction can have prefix labels used for computing locations to that instruction 
	 * for JUMP and CALL instructions.
	 */
	protected List<String> prefixes;
	
	/**
	 * Each TAM instruction can have suffix labels used for computing locations following that instruction 
	 * for JUMP and CALL instructions.
	 */
	protected List<String> suffixes;
	
	/**
	 * Some TAM instructions manipulate explicitly the memory (LOAD and STORE instructions).
	 * This is the register of the manipulated memory.
	 */
	protected Optional<Register> register;

	/**
	 * Some TAM instructions manipulate explicitly the memory (LOAD and STORE instructions).
	 * This is the offset of the register of the manipulated memory.
	 */
	protected Optional<Integer> offset;

	/**
	 * Some TAM instructions use labels that are resolved by the TAM assembler tool (JUMP,
	 * JUMPIF, CALL).
	 * This is the target label for these instructions.
	 */	
	protected Optional<String> target;

	/**
	 * Some TAM instructions manipulate explicitly the memory (LOAD and STORE instructions).
	 * This is the size the manipulated memory chunk.
	 * It is also used by other instructions like PUSH and POP that manipulates the stack.
	 */
	protected Optional<Integer> size;

	/**
	 * Some TAM instructions manipulate explicitly the call stack and the current frame (CALL, CALLI instructions).
	 * This is the frame of the caller function.
	 * It is stored in the size bitfield in the instructions.
	 */
	private Optional<Register> frame;
	
	/**
	 * Construction for a full TAM instruction with kind, label, location and size.
	 * @param _kind Kind for the TAM instruction.
	 * @param _label Optional Label for the TAM instruction.
	 * @param _location Optional Register for the TAM instruction.
	 * @param _offset Optional Integer offset for the TAM instruction.
	 * @param _target Optional Label target for the TAM instruction.
	 * @param _size Optional Integer size for the TAM instruction.
	 * @param _frame Optional Register frame for the TAM instruction.
	 */
	public TAMInstructionImpl(TAMInstructionKind _kind, Optional<String> _label, 
			Optional<Register> _register, Optional<Integer> _offset, 
			Optional<String> _target, Optional<Integer> _size, Optional<Register> _frame) {
		this.kind = _kind;
		this.comments = new LinkedList<String>();
		this.prefixes = new LinkedList<String>();
		this.suffixes = new LinkedList<String>();
		if (_label.isPresent()) {
			this.prefixes.add(_label.get());
		}
		this.register = _register;
		this.offset = _offset;
		this.target = _target;
		this.size = _size;
		this.frame = _frame;
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMInstruction#addPrefix(fr.n7.stl.tam.ast.Label)
	 */
	@Override
	public void addPrefix(String _label) {
		this.prefixes.add(_label);
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMInstruction#addSuffix(fr.n7.stl.tam.ast.Label)
	 */
	@Override
	public void addSuffix(String _label) {
		this.suffixes.add(_label);
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.tam.ast.TAMInstruction#addComment(java.lang.String)
	 */
	@Override
	public void addComment(String _comment) {
		this.comments.add(_comment);		
	}
	
	public String toString() {
		String _result = "";
		for (String _comment : this.comments) {
			_result += ";" + _comment + "\n";
		}
		for (String _label : this.prefixes) {
			_result += _label + "\n";
		}
		_result += this.kind;
		_result += ((this.size.isPresent())?(" (" + this.size.get() + ")"):((this.frame.isPresent())?(" (" + this.frame.get() +")"):""));
		_result += ((this.offset.isPresent())?(" " + this.offset.get()):"");
		_result += ((this.register.isPresent())?("[" + this.register.get() + "]"):"");
		_result += ((this.target.isPresent())?(" " + this.target.get()):"");
		_result += "\n";
		for (String _label : this.suffixes) {
			_result += _label + "\n";
		}
		return _result;
	}

}
