/**
 * 
 */
package fr.n7.stl.util;

/**
 * @author Marc Pantel
 *
 */
public class Logger {
	
	public static void warning(String _message) {
		System.err.println( "Warning : " + _message);
	}
	
	public static void error(String _message) {
		System.err.println( "Error : " + _message);
		throw new BlockSemanticsError();
	}

}
