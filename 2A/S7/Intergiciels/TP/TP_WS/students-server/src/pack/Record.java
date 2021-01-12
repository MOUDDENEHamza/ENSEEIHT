package pack;

public class Record {
	
	String INE;
	String mathematics;
	String middleware;
	String networks;
	String systems;
	String architecture;
	String programming;
	
	public Record() {}

	public Record(String INE, String mathematics, String middleware, String networks, String systems,
			String architecture, String programming) {
		super();
		this.INE = INE;
		this.mathematics = mathematics;
		this.middleware = middleware;
		this.networks = networks;
		this.systems = systems;
		this.architecture = architecture;
		this.programming = programming;
	}

	public String getINE() {
		return INE;
	}

	public void setINE(String INE) {
		this.INE = INE;
	}

	public String getMathematics() {
		return mathematics;
	}

	public void setMathematics(String mathematics) {
		this.mathematics = mathematics;
	}

	public String getMiddleware() {
		return middleware;
	}

	public void setMiddleware(String middleware) {
		this.middleware = middleware;
	}

	public String getNetworks() {
		return networks;
	}

	public void setNetworks(String networks) {
		this.networks = networks;
	}

	public String getSystems() {
		return systems;
	}

	public void setSystems(String systems) {
		this.systems = systems;
	}

	public String getArchitecture() {
		return architecture;
	}

	public void setArchitecture(String architecture) {
		this.architecture = architecture;
	}

	public String getProgramming() {
		return programming;
	}

	public void setProgramming(String programming) {
		this.programming = programming;
	}
	
	

}
