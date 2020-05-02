/**Lors de l'éxection de ce programme en utilisant l'outil JML le compilateur
detecte plusieurs erreurs qui sont les suivantes :
ExempleDate1.java:7: JML precondition is false
		Date d3 = new Date(31, 6, 2001);
		          ^
Date.java:56: Associated declaration: ExempleDate1.java:7:
	public Date(int j, int m, int a) {
	       ^
Date.java:57: JML precondition is false
		this._set(j, m, a);
		         ^
Date.java:89: Associated declaration: Date.java:57:
	private void _set(int j, int m, int a) {
	             ^
Date.java:56: JML invariant is false on leaving method Date.Date(int,int,int)
	public Date(int j, int m, int a) {
	       ^
Date.java:10: Associated declaration: Date.java:56:
		public invariant
		       ^
d1 = 20/05/1989
d2 = 13/02/1993
Date.java:209: JML invariant is false on leaving method Date.toString()
	public String toString() {
	              ^
Date.java:10: Associated declaration: Date.java:209:
		public invariant
		       ^
d3 = 31/06/2001
*/
public class ExempleDate1 {
	public static void main (String args []) {
		// Construire les dates
		Date d1 = new Date(20, 5, 1989);
		Date d2 = new Date(13, 2, 1993);
		Date d3 = new Date(31, 6, 2001);

		// Afficher les dates
		System.out.println("d1 = " + d1);
		System.out.println("d2 = " + d2);
		System.out.println("d3 = " + d3);
	}
}
