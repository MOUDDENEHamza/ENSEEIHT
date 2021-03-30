package model;

import java.util.ArrayList;

import javax.ejb.Local;

import model.Address;
import model.Person;

@Local
public interface IAgendaLocal {
	
	public void AddPerson(String firstName, String lastName);
	
	public void AddAddress(String street, String city);
	
	public ArrayList<Person> personList();
	
	public ArrayList<Address> addressList();
	
	public void associate(int personID, int addressID);
}
