/*
 * @(#)Machine.java                        2.1 2003/10/07
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

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.EOFException;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Stack;
import java.util.Vector;
import io.*;

public class Machine {
	public final static int maxRoutineLevel = 7;

	// Operation codes
	public final static int LOADop = 0, LOADAop = 1, LOADIop = 2, LOADLop = 3, STOREop = 4, STOREIop = 5, CALLop = 6,
			CALLIop = 7, RETURNop = 8, SUBRop = 9, PUSHop = 10, POPop = 11, JUMPop = 12, JUMPIop = 13, JUMPIFop = 14,
			HALTop = 15;
	public final static int LOADL_int = 0, LOADL_string = 1, LOADL_char = 2;
	// CODE STORE
	private static int CODESIZE = 262144;

	public Instruction[] code;

	private Map<Integer, String> labels;

	private Vector<String> strings;
	// CODE STORE REGISTERS
	public final static int CB = 0, PB = CODESIZE, PT = PB;

	// REGISTER NUMBERS

	public final static int CBr = 0, CTr = 1, PBr = 2, PTr = 3, SBr = 4, STr = 5, HBr = 6, HTr = 7, LBr = 8,
			L1r = LBr + 1, L2r = LBr + 2, L3r = LBr + 3, L4r = LBr + 4, L5r = LBr + 5, L6r = LBr + 6, CPr = 15;

	public String getLabel(int d) {
		String l = labels.get(d);
		if (l == null)
			l = ""; //$NON-NLS-1$
		return l;
	}

	public Map<Integer, String> getLabels() {
		return labels;
	}

	static String reg_name[] = { "CB", "CT", "PB", "PT", "SB", "ST", "HB", "HT", "LB", "L1", "L2", "L3", "L4", "L5",
			"L6", "CP" };

	static String inst_name[] = { "LOAD", "LOADA", "LOADI", "LOADL", "STORE", "STOREI", "CALL", "CALLI", "RETURN",
			"SUBR", "PUSH", "POP", "JUMP", "JUMPI", "JUMPIF", "HALT" };

	static String fun_name[] = { "BNeg", "BOr", "BAnd", "BOut", "BIn", "B2c", "B2i", "B2s", "COut", "CIn", "C2b", "C2i",
			"C2s", "INeg", "IAdd", "ISub", "IMul", "IDiv", "IMod", "IEq", "INeq", "ILss", "ILeq", "IGtr", "IGeq",
			"IOut", "IIn", "I2b", "I2c", "I2s", "MVoid", "MAlloc", "MFree", "MCompare", "MCopy", "SAlloc", "SFree",
			"SCopy", "SConcat", "SOut", "SIn", "S2B", "S2C", "S2I" };
	// DATA REPRESENTATION

	public final static int booleanSize = 1, characterSize = 1, integerSize = 1, addressSize = 1,
			closureSize = 2 * addressSize, linkDataSize = 3 * addressSize, falseRep = 0, trueRep = 1,
			maxintRep = 16777216;

	public final static int
	/* Fonctions Booleennes */
	BNeg = 0, BOr = 1, BAnd = 2, BOut = 3, BIn = 4, B2C = 5, B2I = 6, B2S = 7,
			/* Fonctions Caracteres */
			COut = 8, CIn = 9, C2B = 10, C2I = 11, C2S = 12,
			/* Fonctions Entiers */
			INeg = 13, IAdd = 14, ISub = 15, IMul = 16, IDiv = 17, IMod = 18, IEq = 19, INeq = 20, ILss = 21, ILeq = 22,
			IGtr = 23, IGeq = 24, IOut = 25, IIn = 26, I2B = 27, I2C = 28, I2S = 29,
			/* Fonctions Memoires */
			MVoid = 30, MAlloc = 31, MFree = 32, MCompare = 33, MCopy = 34,
			/* Fonctions Chaines */
			SAlloc = 35, SFree = 36, SCopy = 37, SConcat = 38, SOut = 39, SIn = 40, S2B = 41, S2C = 42, S2I = 43;

	// DATA STORE
	final public static int MEMSIZE = 1048576;

	int[] data = new int[MEMSIZE];

	// DATA STORE REGISTERS AND OTHER REGISTERS

	final static int SB = 0, HB = MEMSIZE;

	// = upper bound of data array + 1

	static int CT, CP, ST = SB, HT = HB, LB = SB, status;

	// status values
	final static int running = 0, halted = 1, failedDataStoreFull = 2, failedInvalidCodeAddress = 3,
			failedInvalidInstruction = 4, failedOverflow = 5, failedZeroDivide = 6, failedIOError = 7,
			failedPrimitive = 8, failedMemory = 9;

	private long accumulator;

	private Stack<Frame> callStack = new Stack<Frame>();

	// Pour les entrées - sorties
	private IO io;

	public Machine(IO i) {
		this.io = i;
	}

	// Récupération de la pile d'appels pour mettre en évidence les enregistrements d'activation
	public Stack<Frame> getCallStack() {
		return callStack;
	}

	// Récupération des chaînes de caractères pour les afficher
	public Vector<String> getStrings(){
		return this.strings;
	}

	public void setLabel(int d, String l) {
		labels.put(d, l);
	}

	public int addString(String s) {
		strings.add(s);
		return strings.size() - 1;
	}

	public String getString(int d) {
		return strings.elementAt(d);
	}

	public int getCP() {
		return CP;
	}

	public int getCT() {
		return CT;
	}

	public int getST() {
		return ST;
	}

	public int getHB() {
		return HB;

	}

	// TODO : Etrange : cela renvoie la taille du tas, pas le HT qui est l'adresse
	// du sommet
	public int getHT() {
		return HT;
	}

	public int getLB() {
		return LB;
	}

	public int getCB() {
		return CB;
	}

	public int getSB() {
		return SB;
	}

	private String writeR(char leftbracket, int r, char rightbracket) {
		return (leftbracket + reg_name[r] + rightbracket);
	}

	private String writeS(int r) {
		return (fun_name[r]);
	}

	private String writeString(int r) {
		byte[] bytes = getString(r).getBytes();
		StringBuffer sb = new StringBuffer();
		for (byte b : bytes) {
			switch (b) {
				case '\n':
					sb.append("\\\\\n");
					break;
				case '\r':
					sb.append("\\\\\r");
					break;
				case '\t':
					sb.append("\\\\\t");
					break;
				default:
					sb.append((char) b);
			}
		}
		return sb.toString();
	}

	private String writeI(int r) {
		return (inst_name[r] + "   ");
	}

	private String blankN() {
		return ("    ");
	}

	private String writeN(int n) {
		return ("(" + n + ") ");
	}

	private String writeL(int d) {
		String label = getLabel(d);
		if (label != null)
			return (label);
		else
			return writeD(d);
	}

	private String writeD(int d) {
		return ("" + d);
	}

	public String writeA(int d, int r) {
		if (r == Machine.CBr) {
			return writeL(d);
		} else {
			return writeD(d) + writeR('[', r, ']');
		}
	}

	public String writeA(int a) {
		return writeL(a);
	}

	public String writeInst(int inst) {
		Instruction i = code[inst];
		int op = i.op;
		int r = i.r;
		int d = i.d;
		int n = i.n;
		StringBuffer sb = new StringBuffer();
		sb.append(writeI(op));
		switch (op) {
			case LOADop:
				sb.append(writeN(n));
				sb.append(writeA(d, r));
				break;

			case LOADAop:
				sb.append(blankN());
				sb.append(writeA(d, r));
				break;

			case LOADIop:
				sb.append(writeN(n));
				break;

			case LOADLop:
				sb.append(blankN());
				// hack pour cstes
				switch (r) {
					case LOADL_int:
						sb.append(writeD(d));
						break;
					case LOADL_string:
						sb.append(writeString(d));
						break;
					case LOADL_char:
						sb.append("'" + (char) d + "'");
						break;
					default:
				}
				break;

			case STOREop:
				sb.append(writeN(n));
				sb.append(writeA(d, r));
				break;

			case STOREIop:
				sb.append(writeN(n));
				break;

			case CALLop:
				sb.append(writeR('(', n, ')') + ' ');
				sb.append(writeA(d, r));
				break;

			case CALLIop:
				break;

			case RETURNop:
				sb.append(writeN(n));
				sb.append(writeD(d));
				break;

			case SUBRop:
				sb.append(" " + writeS(d));
				break;

			case PUSHop:
				sb.append(blankN());
				sb.append(writeD(d));
				break;

			case POPop:
				sb.append(writeN(n));
				sb.append(writeD(d));
				break;

			case JUMPop:
				sb.append(blankN());
				sb.append(writeA(d, r));
				break;

			case JUMPIop:
				break;

			case JUMPIFop:
				sb.append(writeN(n));
				sb.append(writeA(d, r));
				break;

			case HALTop:
		}
		return sb.toString();
	}

	public Instruction[] getCode() {
		return code;
	}

	public int[] getData() {
		return data;
	}

	// public void setBreakPoint(int i) {
	// if (i >= CB && i < CT)
	// code[i].setBreakpoint();
	// }
	//
	// public void unsetBreakPoint(int i) {
	// if (i >= CB && i < CT)
	// code[i].unsetBreakpoint();
	// }

	public void toggleBreakPoint(int i) {
		if (i >= CB && i < CT)
			code[i].toggleBreakpoint();
	}

	public void clearBreakPoint(int i) {
		if (i >= CB && i < CT)
			code[i].unsetBreakpoint();
	}

	public boolean isBreakPoint(int i) {
		if (i >= CB && i < CT)
			return code[i].isBreakpoint();
		return false;
	}

	private int content(int r) {
		switch (r) {
			case CBr:
				return CB;
			case CTr:
				return CT;
			case PBr:
				return PB;
			case PTr:
				return PT;
			case SBr:
				return SB;
			case STr:
				return ST;
			case HBr:
				return HB;
			case HTr:
				return HT;
			case LBr:
				return LB;
			case L1r:
				return data[LB];
			case L2r:
				return data[data[LB]];
			case L3r:
				return data[data[data[LB]]];
			case L4r:
				return data[data[data[data[LB]]]];
			case L5r:
				return data[data[data[data[data[LB]]]]];
			case L6r:
				return data[data[data[data[data[data[LB]]]]]];
			case CPr:
				return CP;
			default:
				return 0;
		}
	}

	private static String sstatus[] = { Messages.getString("Machine.Program_Running"), //$NON-NLS-1$
			Messages.getString("Machine.Program_Halted_Normally"), //$NON-NLS-1$
			Messages.getString("Machine.Data_Store_Exhausted"), //$NON-NLS-1$
			Messages.getString("Machine.Invalid_Code_Address"), //$NON-NLS-1$
			Messages.getString("Machine.Invalid_Instruction"), //$NON-NLS-1$
			Messages.getString("Machine.Overflow"), //$NON-NLS-1$
			Messages.getString("Machine.Divide_By_Zero"), //$NON-NLS-1$
			Messages.getString("Machine.IO_Error"), //$NON-NLS-1$
			Messages.getString("Machine.Subr_Error"), //$NON-NLS-1$
			Messages.getString("Machine.Data_Error") }; //$NON-NLS-1$

	public String showStatus() {
		return sstatus[status];
	}

	// INTERPRETATION

	private void checkSpace(int spaceNeeded) {
		// Signals failure if there is not enough space to expand the stack or
		// heap by spaceNeeded.

		if (HT - ST < spaceNeeded)
			status = failedDataStoreFull;
	}

	private boolean isTrue(int datum) {
		// Tests whether the given datum represents true.
		return (datum == trueRep);
	}

	private boolean equal(int size, int addr1, int addr2) {
		// Tests whether two multi-word objects are equal, given their common
		// size and their base addresses.

		boolean eq;
		int index;

		eq = true;
		index = 0;
		while (eq && (index < size))
			if (data[addr1 + index] == data[addr2 + index])
				index = index + 1;
			else
				eq = false;
		return eq;
	}

	private int overflowChecked(long datum) {
		// Signals failure if the datum is too large to fit into a single word,
		// otherwise returns the datum as a single word.

		if ((-maxintRep <= datum) && (datum <= maxintRep))
			return (int) datum;
		else {
			status = failedOverflow;
			return 0;
		}
	}

	private int toInt(boolean b) {
		return b ? trueRep : falseRep;
	}

	private char currentChar;

	private void callPrimitive(int deplacement) {
		int addr, size;
		char ch;
		int ns, ns1, ns2;
		int v;
		String s, s1, s2;
		switch (deplacement) {
			case BNeg:
				data[ST - 1] = toInt(!isTrue(data[ST - 1]));
				break;
			case BOr:
				ST = ST - 1;
				data[ST - 1] = toInt(isTrue(data[ST - 1]) | isTrue(data[ST]));
				break;
			case BAnd:
				ST = ST - 1;
				// accumulator = data[ST - 1];
				data[ST - 1] = toInt(isTrue(data[ST - 1]) & isTrue(data[ST]));
				// data[ST - 1] = overflowChecked(accumulator + data[ST]);
				break;
			case BOut:
				ST = ST - 1;
				io.print(isTrue(data[ST]) + "");
				break;
			case BIn:
				addr = ST;
				ST++;
				if (io.readBool()) {
					data[addr] = trueRep;
				} else {
					data[addr] = falseRep;
				}
				break;
			case B2C:
				if (data[ST - 1] == 0){ 
					data[ST - 1] = 48; // code ASCII de '0'
				}
				else {data[ST - 1] = 49; // code ASCII de '1'
				}
				break;
			case B2I:
				break;
			case B2S:
				if (isTrue(data[ST - 1])) {
					data[ST - 1] = addString("true");
				} else {
					data[ST - 1] = addString("false");
				}
				break;
			case COut:
				ST = ST - 1;
				ch = (char) data[ST];
				io.print(ch + "");
				break;
			case CIn:
				ST++;
				addr = data[ST];
				currentChar = io.readChar();
				data[addr] = (int) currentChar;
				break;
			case C2B:
				if (data[ST - 1] == 48){ // code ASCII de '0'
					data[ST - 1] = 0;}
				else {data[ST - 1] = 1;}
				break;
			case C2I:
				break;
			case C2S:
				data[ST - 1] = addString(String.valueOf(((char) data[ST - 1])));
				break;
			case INeg:
				data[ST - 1] = overflowChecked(-data[ST - 1]);
				break;
			case IAdd:
				ST = ST - 1;
				accumulator = data[ST - 1];
				data[ST - 1] = overflowChecked(accumulator + data[ST]);
				break;
			case ISub:
				ST = ST - 1;
				accumulator = data[ST - 1];
				data[ST - 1] = overflowChecked(accumulator - data[ST]);
				break;
			case IMul:
				ST = ST - 1;
				accumulator = data[ST - 1];
				data[ST - 1] = overflowChecked(accumulator * data[ST]);
				break;
			case IDiv:
				ST = ST - 1;
				accumulator = data[ST - 1];
				if (data[ST] != 0)
					data[ST - 1] = (int) (accumulator / data[ST]);
				else
					status = failedZeroDivide;
				break;
			case IMod:
				ST = ST - 1;
				accumulator = data[ST - 1];
				if (data[ST] != 0)
					data[ST - 1] = (int) (accumulator % data[ST]);
				else
					status = failedZeroDivide;
				break;
			case IEq:
				ST = ST - 1;
				data[ST - 1] = toInt(data[ST - 1] == data[ST]);
				break;
			case INeq:
				ST = ST - 1;
				data[ST - 1] = toInt(data[ST - 1] != data[ST]);
				break;
			case ILss:
				ST = ST - 1;
				data[ST - 1] = toInt(data[ST - 1] < data[ST]);
				break;
			case ILeq:
				ST = ST - 1;
				data[ST - 1] = toInt(data[ST - 1] <= data[ST]);
				break;
			case IGtr:
				ST = ST - 1;
				data[ST - 1] = toInt(data[ST - 1] > data[ST]);
				break;
			case IGeq:
				ST = ST - 1;
				data[ST - 1] = toInt(data[ST - 1] >= data[ST]);
				break;
			case IOut:
				ST = ST - 1;
				accumulator = data[ST];
				this.io.print(accumulator + "");
				break;
			case IIn:
				addr = ST;
				ST++;
				accumulator = io.readInt();
				data[addr] = (int) accumulator;
				break;
			case I2B:
				if (data[ST - 1] == 0){ 
					data[ST - 1] = 0;}
				else {data[ST - 1] = 1;}
				break;
			case I2C:
				break;
			case I2S:
				data[ST - 1] = addString(String.valueOf(((int) data[ST - 1])));
				break;
			case MVoid:
				ST++;
				data[ST - 1] = 0;
				break;
			case MAlloc:
				size = data[ST - 1];
				checkSpace(size);
				HT = HT - size;
				data[ST - 1] = HT;
				break;
			case MFree:
				ST = ST - 1; // no action taken at present
				status = failedPrimitive;
				break;
			case MCompare:
				ST = ST - 1;
				data[ST - 1] = toInt(data[data[ST - 1]] == data[data[ST]]);
				break;
			case MCopy:
				size = data[ST - 3];
				int a1 = data[ST - 2];
				int a2 = data[ST - 1];
				for (int i = 0; i < size; i++) {
					data[a1 + i] = data[a2 + i];
				}
				ST = ST - 3;
				break;
			case SAlloc:
				ST++;
				data[ST - 1] = addString(new String());
				break;
			case SFree:
				strings.set(data[ST-1],new String());
				ST--;
				break;
			case SCopy:
				ns = data[ST - 1];
				s = strings.get(ns);
				data[ST - 1] = addString(new String(s));
				break;
			case SConcat:
				ns1 = data[ST - 2];
				s1 = strings.get(ns1);
				ns2 = data[ST-1];
				s2 = strings.get(ns2);
				strings.setElementAt(s1 + s2, ns1);
				ST = ST - 1;
				break;
			case SOut:
				ns = data[ST - 1];
				s = strings.get(ns);
				io.print(s);
				ST = ST - 1;
				break;
			case SIn:
				data[ST] = addString(io.readString());
				ST++;
				break;
			case S2B:
				ns = data[ST - 1];
				s = strings.elementAt(ns).toLowerCase();
				//if (s.contentEquals("true") || s.equals("t") || s.equals("" + trueRep)) {
				//	data[ST - 1] = 1;
				//}
				if (s.contentEquals("false") || s.equals("f") || s.equals("" + falseRep)) {
					data[ST - 1] = 0;
				} else {
					data[ST - 1] = 1;
				}
				break;
			case S2C:
				ns = data[ST - 1];
				s = strings.elementAt(ns);
				if ((s != null) && (s.length() > 0)) {
					data[ST - 1] = s.charAt(0);
				}
				break;
			case S2I:
				ns = data[ST - 1];
				s = strings.elementAt(ns);
				try {
					v = Integer.parseInt(s);
				} catch (NumberFormatException e) {
					e.printStackTrace();
					v = ns;
				}
				data[ST - 1] = v;
				break;
			default:
				status = failedPrimitive;
		}
	}

	public Frame getFrame() {
		return callStack.peek();
	}

	public String getFunName() {
		return writeA(callStack.peek().getAddr());
	}

	private int nextCP(Instruction currentInstr) {
		int next;
		int op, r, n, d;
		// Decode instruction ...
		op = currentInstr.op;
		r = currentInstr.r;
		n = currentInstr.n;
		d = currentInstr.d;
		// Execute instruction ...
		switch (op) {
			case RETURNop:
				next = data[LB + 2];
				break;
			case JUMPop:
				next = d + content(r);
				break;
			case JUMPIop:
				next = data[ST - 1];
				break;
			case JUMPIFop:
				if (data[ST - 1] == n)
					next = d + content(r);
				else
					next = CP + 1;
				break;
			default:
				next = CP + 1;
				break;
		}
		return next;
	}

	private void eval_inst(Instruction currentInstr) throws TamException {
		try {
			int op, r, n, d, addr, index;
			// Decode instruction ...
			op = currentInstr.op;
			r = currentInstr.r;
			n = currentInstr.n;
			d = currentInstr.d;
			// Execute instruction ...
			switch (op) {
				case LOADop:
					addr = d + content(r);
					checkSpace(n);
					for (index = 0; index < n; index++)
						data[ST + index] = data[addr + index];
					ST = ST + n;
					CP = CP + 1;
					break;
				case LOADAop:
					addr = d + content(r);
					checkSpace(1);
					data[ST] = addr;
					ST = ST + 1;
					CP = CP + 1;
					break;
				case LOADIop:
					ST = ST - 1;
					addr = data[ST];
					checkSpace(n);
					for (index = 0; index < n; index++)
						data[ST + index] = data[addr + index];
					ST = ST + n;
					CP = CP + 1;
					break;
				case LOADLop:
					checkSpace(1);
					data[ST] = d;
					ST = ST + 1;
					CP = CP + 1;
					break;
				case STOREop:
					addr = d + content(r);
					ST = ST - n;
					for (index = 0; index < n; index++)
						data[addr + index] = data[ST + index];
					CP = CP + 1;
					break;
				case STOREIop:
					ST = ST - 1;
					addr = data[ST];
					ST = ST - n;
					for (index = 0; index < n; index++)
						data[addr + index] = data[ST + index];
					CP = CP + 1;
					break;
				case CALLop:
					addr = d + content(r);
					checkSpace(3);
					if ((0 <= n) && (n <= 15))
						data[ST] = content(n); // static link
					else
						status = failedInvalidInstruction;
					data[ST + 1] = LB; // dynamic link
					data[ST + 2] = CP + 1; // return address
					LB = ST;
					ST = ST + 3;
					CP = addr;
					callStack.push(new Frame(addr, data[ST], LB, CP + 1));
					break;
				case CALLIop:
					ST = ST - 2;
					addr = data[ST + 1];
					// data[ST] = static link already
					data[ST + 1] = LB; // dynamic link
					data[ST + 2] = CP + 1; // return address
					LB = ST;
					ST = ST + 3;
					CP = addr;
					callStack.push(new Frame(addr, data[ST], LB, CP + 1));
					break;
				case RETURNop:
					addr = LB - d;
					CP = data[LB + 2];
					LB = data[LB + 1];
					ST = ST - n;
					for (index = 0; index < n; index++)
						data[addr + index] = data[ST + index];
					ST = addr + n;
					callStack.pop();
					break;
				case SUBRop:
					addr = d;
					callPrimitive(d);
					CP = CP + 1;
					break;
				case PUSHop:
					checkSpace(d);
					ST = ST + d;
					CP = CP + 1;
					break;
				case POPop:
					addr = ST - n - d;
					ST = ST - n;
					for (index = 0; index < n; index++)
						data[addr + index] = data[ST + index];
					ST = addr + n;
					CP = CP + 1;
					break;
				case JUMPop:
					CP = d + content(r);
					break;
				case JUMPIop:
					ST = ST - 1;
					CP = data[ST];
					break;
				case JUMPIFop:
					ST = ST - 1;
					if (data[ST] == n)
						CP = d + content(r);
					else
						CP = CP + 1;
					break;
				case HALTop:
					status = halted;
					CP = CB;
					break;
			}
			if ((CP < CB) || (CP >= CT)) {
				status = failedInvalidCodeAddress;
				throw new TamException(sstatus[status]);
			}
		} catch (ArrayIndexOutOfBoundsException e) {
			status = failedMemory;
			throw new TamException(sstatus[status]);
			// e.printStackTrace() ;
		}
	}

	private void readStrings(int n, DataInputStream f) throws IOException {
		strings = new Vector<String>();
		for (int i = 0; i < n; i++) {
			// int ls = f.read();
			// byte[] s = new byte[ls];
			// f.read(s);
			// addString(new String(s));
			int ls = f.readInt();
			String s = f.readUTF();
			int p = addString(s.substring(1, s.length() - 1));
		}
	}

	private void readLabels(int n, DataInputStream f) throws IOException {
		labels = new HashMap<Integer, String>();
		for (int i = 0; i < n; i++) {
			int ls = f.read();
			byte[] s = new byte[ls];
			f.read(s);
			int sn = f.readInt();
			setLabel(sn, new String(s));
		}
	}

	public Instruction read(DataInputStream input) throws IOException {
		Instruction inst = new Instruction();
		try {
			int i1 = input.readUnsignedByte();
			inst.op = i1 >> 4;
			inst.r = (i1 & 0x0000F);

			int j1 = input.readUnsignedByte();
			inst.n = j1;

			int i2 = input.readShort();
			inst.d = i2;

			return inst;
		} catch (EOFException s) {
			return null;
		}
	}

	public void mnext() throws TamException {
		if (status != running)
			return;
		// int end = CP + 1;
		Instruction currentInstr = code[CP];
		int end = nextCP(currentInstr);
		eval_inst(currentInstr);
		while (status == running && CP != end) {
			// break point ?
			if (!currentInstr.s && currentInstr.b)
				break;
			currentInstr.s = false;
			currentInstr = code[CP];
			eval_inst(currentInstr);
		}
		code[CP].s = true;
	}

	public void mcont() throws TamException {
		if (status != running)
			return;
		do {
			Instruction currentInstr = code[CP];
			// break point ?
			if (!currentInstr.s && currentInstr.b)
				break;
			currentInstr.s = false;
			eval_inst(currentInstr);
		} while (status == running);
		code[CP].s = true;
		checkStatus();
	}

	public void mstep() throws TamException {
		if (status != running)
			return;
		eval_inst(code[CP]);
		checkStatus();
	}

	public void mrun() throws TamException {
		// mreset();
		status = running;
		mcont();
		checkStatus();
	}

	public void mreset() throws TamException {
		status = halted;
		CP = CB;
		ST = SB;
		HT = HB;
		LB = SB;
		data = new int[MEMSIZE];
		callStack.clear();
		status = running;
		checkStatus();
	}

	private void checkStatus() throws TamException {
		if (status > halted)
			throw new TamException(sstatus[status]);
	}

	public void loadObjectProgram(ByteArrayOutputStream out) throws TamException {
		try {
			if (out == null)
				throw new TamException(Messages.getString("Machine.Null_Error")); //$NON-NLS-1$
			DataInputStream objectStream = new DataInputStream(new ByteArrayInputStream(out.toByteArray()));
			// entete TAMX nl ns ni
			byte sig[] = new byte[4];
			objectStream.read(sig);
			int nl = objectStream.readInt();
			int ns = objectStream.readInt();
			int ni = objectStream.readInt();
			readLabels(nl, objectStream);
			readStrings(ns, objectStream);
			int addr = CB;
			code = new Instruction[ni];
			for (int i = 0; i < ni; i++) {
				code[addr++] = read(objectStream);
			}
			objectStream.close();
			CT = addr;
			mreset();
		} catch (FileNotFoundException s) {
			CT = CB;
			throw new TamException(Messages.getString("Machine.Opening_Error") + s); //$NON-NLS-1$
		} catch (IOException s) {
			CT = CB;
			throw new TamException(Messages.getString("Machine.Read_Error") + s); //$NON-NLS-1$
		}
	}

}
