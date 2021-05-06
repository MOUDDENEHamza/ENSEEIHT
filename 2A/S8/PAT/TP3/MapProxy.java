import java.util.*;

public class MapProxy {

    public static void main(String args[]) throws NoSuchMethodException, SecurityException, Throwable {
        Random rand = new Random();
        Map<String, Integer> map = new HashMap<String, Integer>(); 
        System.out.println("Create an empty map : " + map);
        map.put("a", 2); 
        map.put("b", 3); 
        map.put("c", 5); 
        map.put("d", 7); 
        System.out.println("Fill the map : " + map);
        map.remove("d");
        System.out.println("Remove the key d (value = 7), map : " + map);
        String[] methodNames = {"put", "clear"};
        ProtectionHandler proxy = new ProtectionHandler(map, methodNames);
        System.out.println("Create a proxy object of map : " + map);
        if (rand.nextInt(1000) % 2 == 0) {
            proxy.invoke(map, Map.class.getMethod("put",new Class[]{Object.class, Object.class}), new Object[]{"c", 5});
        } else {
            proxy.invoke(map, Map.class.getMethod("clear", new Class[]{}), new Integer[]{});
        }
    }
}
