public class UnmodifiableList {
    public static void main(String[] args) {
        List<Integer> list = new ArrayList<Integer>();
        System.out.println("Create an empty list : " + list);
        list.addAll(List.of(2, 3, 5, 7));
        System.out.println("Fill the list : " + list);
        list.remove(list.size() - 1);
        System.out.println("Remove 7 from the list : " + list);
        //***** Immutable List *************************************************
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
        //***** proxy List *************************************************
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
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
public class ProtectionHandler implements InvocationHandler {
    private Object object;
    private String[] methodNames;
    public ProtectionHandler(Object object, String[] methodNames) {
        this.object = object;
        this.methodNames = methodNames;
    }
    @Override
    public Object invoke(Object arg0, Method arg1, Object[] arg2) throws Throwable {
        if (Arrays.asList(this.methodNames).contains(arg1.getName())) {
            System.out.println("The proxy doesn't support " + arg1.getName() + " method.");
            throw new UnsupportedOperationException();
        }
        return arg1.invoke(this.object, arg2);
    }
}
