/**
 * 
 */
package fr.n7.stl.util;

/**
 * @author Marc Pantel
 *
 */
public class Pair <L,R> {

	private L left;
	private R right;

	/**
	 * 
	 */
	public Pair(L _left, R _right) {
		this.left= _left;
		this.right = _right;
	}
	
	public L getLeft() {
		return this.left;
	}
	
	public R getRight() {
		return this.right;
	}
	
	public void setLeft(L _left) {
		this.left = _left;
	}
	
	public void setRight(R _right) {
		this.right = _right;
	}

}
