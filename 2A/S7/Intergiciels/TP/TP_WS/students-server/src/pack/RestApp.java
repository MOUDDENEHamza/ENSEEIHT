package pack;

import java.util.HashSet;
import java.util.Set;

import javax.ws.rs.core.Application;

public class RestApp extends Application {
	private Set<Object> singletons = new HashSet<Object>();
	
	public RestApp() {
		singletons.add(new Students());
	}

	@Override
	public Set<Object> getSingletons() {
		return singletons;
	}
}
