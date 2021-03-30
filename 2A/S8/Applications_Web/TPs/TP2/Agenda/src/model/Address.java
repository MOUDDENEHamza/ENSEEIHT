package model;

public class Address {
	int id;
    String street;
    String city;
    
    public Address(int id, String street, String city) {
        this.id = id;
        this.street = street;
        this.city = city;
    }
    
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getStreet() {
        return this.street;
    }
    
    public void setStreet(String street) {
        this.street = street;
    }    

    public String getCity() {
        return this.city;
    }
    
    public void setCity(String city) {
        this.city = city;
    }
   
}
