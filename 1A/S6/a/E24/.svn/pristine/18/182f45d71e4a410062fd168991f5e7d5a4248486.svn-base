/**
 * Abstract class User is a class that can be either a customer or an employee, depending on their
 * Employee Rank 
 * @author Younes Saoudi
 *
 */
public abstract class User {
	private String FirstName;
	private String LastName;
	private String Id;
	private String Email, Username, Password, BirthDate, CreationDate;
	private EmployeeRank Function;
	enum Genders{Male,Female};
	static Genders Gender;

	public User(String firstname, String lastname, String ID, EmployeeRank Function) {
		this.FirstName = firstname;
		this.LastName = lastname;
		this.Id = ID;
		this.Function = Function;
	}
	

	public String getFirstName() {
		return this.FirstName;
	}
	
	public String getLastName() {
		return this.LastName;
	}
	
	public String getId() {
		return this.Id;
	}
	
	public EmployeeRank getFunction() {
		return this.Function;
	}	
	
	public String getEmail(){
		return this.Email;
	}
	public String getUsername(){
		return this.Username;
	}
	public String getPassword(){
		return this.Password;
	}
	public String getBirthDate(){
		return this.BirthDate;
	}
	public String getCreationDate(){
		return this.CreationDate;
	}
	
	public Genders getGender() {
		return this.Gender;
	}
	
	public void setFirstName(String fn) {
		this.FirstName = fn;
	}
	
	public void setLastName(String ln) {
		this.LastName = ln;
	}
	
	public void setGender(Genders gender) {
		this.Gender = gender;
	}
	
	public void setID(String UID) {
		this.Id = UID;
	}
	
	public void setFunction(EmployeeRank Rank) {
		this.Function = Rank;
	}
	
	public void setEmail(String email){
		this.Email = email;
	}
	public void setUsername(String username){
		this.Username = username;
	}
	public void setPassword(String password){
		this.Password =  password;
	}
	public void setBirthDate(String birthDate){
		this.BirthDate = birthDate;
	}
	public void setCreationDate(String creationDate){
		this.CreationDate = creationDate;
	}
	
	public void afficher() {
		System.out.println("FisrtName : " + this.FirstName);
		System.out.println("LastName : " + this.LastName);
		System.out.println("Code identification : " + this.Id);
		System.out.println("Fonction : " + this.Function);
	}
}
