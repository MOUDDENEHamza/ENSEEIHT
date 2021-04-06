/*
 * @(#)Instruction.java                        2.1 2003/10/07
 *
 * Copyright (C) 1999, 2003 D.A. Watt and D.F. Brown
 * Dept. of Computing Science, University of Glasgow, Glasgow G12 8QQ Scotland
 * and School of Computer and Math Sciences, The Robert Gordon University,
 * St. Andrew Street, Aberdeen AB25 1HG, Scotland.
 * All rights reserved.
 *
 * This software is provided free for educational use only. It may
 * not be used for commercial purposes without the prior written permission
 * of the authors.
 */

package tam;

public class Instruction {
	// Represents TAM instructions.
	int op; // OpCode
	int r; // RegisterNumber
	int n; // Length
	int d; // Operand
	boolean b; // breakpoint set
	boolean s;

	public Instruction() {
		op = 0;
		r = 0;
		n = 0;
		d = 0;
		b = false;
		s = false;
	}

	public void setBreakpoint() {
		b = true;
	}

	public void unsetBreakpoint() {
		b = false;
		s = false;
	}

	public boolean isBroken() {
		return s;
	}

	public boolean isBreakpoint() {
		return b;
	}

	public void setBroken(boolean b) {
		s = b;
	}

	public void toggleBreakpoint() {
		b = !b;
	}
}
