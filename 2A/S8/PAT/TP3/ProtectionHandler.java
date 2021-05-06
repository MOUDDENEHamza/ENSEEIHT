import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.util.*;

/**
 * ProtectionHandler implements InvocationHandler
 * @author Hamza Mouddene
 * @version 1.0
 */
public class ProtectionHandler implements InvocationHandler {
    /** Attributes of ProtectionHandler */
    private Object object;
    private String[] methodNames;

    /**
     * Constructio of ProtectionHandler.
     * @param object we will handle.
     * @param methodNames we will disable for object.
     */
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
