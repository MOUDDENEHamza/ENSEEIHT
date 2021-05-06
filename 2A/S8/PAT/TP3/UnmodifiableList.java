import java.util.*;

/**
 * This class has as purpose to get familiar with Collections.unmodifiableList
 * method.
 * @author Hamza Mouddene
 * @version 1.0
 */
public class UnmodifiableList {

    /**
     * Main method
     * @param args command line arguments
     */
    public static void main(String[] args) {
        List<Integer> list = new ArrayList<Integer>();
        System.out.println("Create an empty list : " + list);
        list.addAll(List.of(2, 3, 5, 7));
        System.out.println("Fill the list : " + list);
        list.remove(list.size() - 1);
        System.out.println("Remove 7 from the list : " + list);
        List<Integer> immutablelist = Collections.unmodifiableList(list);
        System.out.println("Create an immutablelist : " + immutablelist);
        try {
            System.out.println("Trying to add 10 to the unmodifiablelist"); 
            immutablelist.add(10);
        } catch (UnsupportedOperationException e) {
            System.out.println("Exception thrown : immutablelist is in " + 
            "read-only, editing is Unsupported.");
        }
        try {
            System.out.println("Trying to remove 10 to the unmodifiablelist"); 
            immutablelist.remove(immutablelist.size() - 1);
        } catch (UnsupportedOperationException e) {
            System.out.println("Exception thrown : immutablelist is in " + 
            "read-only, removing is unsupported.");
        }
    }
}