package model;

import java.util.Collection;

import javax.ejb.Local;

import model.Address;
import model.Person;

@Local
public interface IAgendaLocal {
	
	public void AddPerson(String firstName, String lastName);
	
	public void AddAddress(String street, String city);
	
	public Collection<Person> personList();
	
	public Collection<Address> addressList();
	
	public void associate(int personID, int addressID);
}
