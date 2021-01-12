
import org.mule.api.MuleEventContext;
import org.mule.api.lifecycle.Callable;


public class Filter implements Callable {

    public Object onCall(MuleEventContext eventContext) throws Exception {

    	person p = (person)eventContext.getMessage().getPayload();
    	String param[] = new String[2];
    	param[0] = p.getLogin();
    	param[1] = p.getPassword();
        return param;
    }
}
