// Time-stamp: <02 mai 2013 10:16 queinnec@enseeiht.fr>

package Synchro;

/**
 * Exception levée en cas d'assertion invalide.
 * Il s'agit d'une <code>Error</code>, qui ne doit pas être capturée
 * ou traitée.
 * @see Assert
 *
 * @author Philippe Quéinnec
 */
@SuppressWarnings("serial")
public class AssertionViolation extends Error
{
    public AssertionViolation () {}
    public AssertionViolation (String s) {super(s);}
}
