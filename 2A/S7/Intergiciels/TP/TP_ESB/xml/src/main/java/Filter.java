import org.mule.api.MuleEventContext;
import org.mule.api.lifecycle.Callable;


public class Filter implements Callable {

    public Object onCall(MuleEventContext eventContext) throws Exception {

    	person p = (person)eventContext.getMessage().getPayload();
    	p.setNom("hagimont");
    	eventContext.getMessage().setPayload(p);
        return eventContext.getMessage();
    }
}
