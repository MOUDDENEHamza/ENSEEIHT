/**
 * 
 */
package fr.n7.stl.tam.ast;

/**
 * Sequence of TAMInstruction.
 * @author Marc Pantel
 *
 */
public interface Fragment {
	
	/**
	 * Adds a TAM instruction at the end of the fragment.
	 * @param _instruction TAM instruction added at the end of the fragment.
	 */
	public void add(TAMInstruction _instruction);
	
	/**
	 * Adds a prefix comment to the first TAM instruction of the fragment.
	 * @param _comment Comment that is added to the first TAM instruction of the fragment.
	 */
	public void addComment(String _comment);
	
	/**
	 * Adds a prefix label to the first TAM instruction of the fragment.
	 * @param _label Label that is added to the first TAM instruction of the fragment.
	 */
	public void addPrefix(String _label);
	
	/**
	 * Adds a suffix label to the last TAM instruction of the fragment.
	 * @param _label Label that is added to the last TAM instruction of the fragment.
	 */
	public void addSuffix(String _label);
	
	/**
	 * Add the instructions from the provided fragment at the end of the fragment.
	 * @param _fragment Fragment whose instructions are added at the end of the fragment.
	 */
	public void append(Fragment _fragment);

}
