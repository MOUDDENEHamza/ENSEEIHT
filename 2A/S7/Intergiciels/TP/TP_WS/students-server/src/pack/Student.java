package pack;

public class Student {
	
	String INE;
	String firstname;
	String lastname;
	String birthdate;
	String sex;
	String address;
	String city;
	String zip;
	String country;
	String phone;
	String email;
	
	public Student() {}

	public Student(String INE, String firstname, String lastname, String birthdate, String sex, String address,
			String city, String zip, String country, String phone, String email) {
		super();
		this.INE = INE;
		this.firstname = firstname;
		this.lastname = lastname;
		this.birthdate = birthdate;
		this.sex = sex;
		this.address = address;
		this.city = city;
		this.zip = zip;
		this.country = country;
		this.phone = phone;
		this.email = email;
	}

	public String getINE() {
		return INE;
	}

	public void setINE(String INE) {
		this.INE = INE;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	

}
