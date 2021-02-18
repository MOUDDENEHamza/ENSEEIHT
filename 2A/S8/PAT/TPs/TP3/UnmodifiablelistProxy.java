import java.util.*;

/**
 * Write a similar class to Unmodifiablelist without using
 * Collections.unmodifiableList, but rather a proxy and ProtectionHandler 
 * class.
 * 
 * @author Hamza Mouddene
 * @version 1.0
 */
public class UnmodifiablelistProxy {
    
    /**
     * The main method
     * 
     * @param args command line arguments
     * @throws Throwable
     */
    public static void main(String[] args) throws Throwable {
        Random rand = new Random();
        List<Integer> list = new ArrayList<Integer>();
        System.out.println("Create an empty list : " + list);
        list.addAll(List.of(2, 3, 5, 7));
        System.out.println("Fill the list : " + list);
        list.remove(list.size() - 1);
        System.out.println("Remove 7 from the list : " + list);
        String[] methodNames = {"add", "remove"};
        ProtectionHandler proxy = new ProtectionHandler(list, methodNames);
        System.out.println("Create a proxy object of list : " + list);
        if (rand.nextInt(1000) % 2 == 0) {
            proxy.invoke(list, ArrayList.class.getMethod("add",new Class[]{Object.class}), new Integer[]{list.size() - 1});
        } else {
            proxy.invoke(list, List.class.getMethod("remove", new Class[]{int.class}), new Integer[]{list.size() - 1});
        }
    }
}
