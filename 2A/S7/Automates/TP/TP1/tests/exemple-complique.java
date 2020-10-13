
/* Cet exemple respecte la syntaxe (grammaire) de microjava, avec des
 * commentaires, des chaînes complexes, des réels bizarres...
 * Les constructions qui ne sont pas trait
 * Ce programme est sémantiquement faux (typage en particulier)
 */

/* class Point {
    private int x;
    private int y;

    private String toto;

    // rien {
    public int get_x () */
{ return x; }
//    public void set_x (int _x) 
{ x = _x; }

//    private void essai_string ()
 {
        toto  = "machin avec des espaces et des \" quotes
et multiligne avec echappement \n meme a la fin \\"; foo(); "et une autre chaine";
        x = 3.14 + .14 + 3. + 14e-1 + .3e1;
        y = 'a' + '\13' + 0x2A;
    }
}

/* ghjd /* ****/
/* class PointColore extends Point {
    public int c;
    public int get_c () */
 { return c*2; }
/* } */
/*****
class PointColore extends Point **g
   // dfgkhdk *f ** */

/* public class Exemple {
    public static void main (String[] argv) */
 {
        int x;
        bool b;
        b = true;
        if (b) {
            x = 2*x + 3;
        }
    }
// }
