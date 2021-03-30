package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;

import model.Address;
import model.Person;

public class AgendaImpl implements IAgendaLocal {
	
	Connection con;
	int personID, addressID;
	
	public AgendaImpl() {
		this.personID = 0;
		this.addressID = 0;
		try {
			String db_url = "jdbc:hsqldb:hsql://localhost/xdb";
			String db_user = "sa";
			Class.forName("org.hsqldb.jdbcDriver");
			this.con = DriverManager.getConnection(db_url, db_user, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void AddPerson(String firstName, String lastName) {
		try {
			PreparedStatement ps;
			System.out.println("INSERT INTO PERSONNE VALUES(?,?,?) " + firstName + " " + lastName);
			ps = con.prepareStatement("INSERT INTO \"PUBLIC\".\"PERSONNE\"\n" + 
					"( \"ID\", \"NOM\", \"PRENOM\" ) VALUES(?,?,?)");
			ps.setNull(1, this.personID++);
			ps.setString(2, firstName);
			ps.setString(3, lastName);
			ps.executeUpdate();
			System.out.println("INSERT done");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void AddAddress(String street, String city) {
		try {
			PreparedStatement ps;
			ps = con.prepareStatement("INSERT INTO \"PUBLIC\".\"ADRESSE\"\n" + 
					"( \"ID\", \"RUE\", \"VILLE\", \"PERSONNEID\" )\n" + 
					"VALUES (?,?,?,?)");
			ps.setNull(1, this.addressID++);
			ps.setString(2, street);
			ps.setString(3, city);
			ps.setNull(4, Types.INTEGER);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<Person> personList() {
		try {
			System.out.println("1");
			ArrayList<Person> personList = new ArrayList<>();
			System.out.println("2");
			Statement s = con.createStatement();
			System.out.println("3");
			ResultSet res = s.executeQuery("SELECT * FROM \"PUBLIC\".\"PERSONNE\"");
			System.out.println("4");
			while (res.next()) {
				System.out.println("4.1" + res.getInt(1) +  res.getString(2) + res.getString(3));
				Person p = new Person(res.getInt(1), res.getString(2), res.getString(3));
				System.out.println("4.2");
				personList.add(p);
				System.out.println("4.3");
			}
			System.out.println("5");
			return personList;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Exception list person");
			return null;
		}
	}

	@Override
	public ArrayList<Address> addressList() {
		try {
			System.out.println("1");
			ArrayList<Address> addressList = new ArrayList<>();
			System.out.println("2");
			Statement s = con.createStatement();
			System.out.println("3");
			ResultSet res = s.executeQuery("SELECT * FROM \"PUBLIC\".\"ADRESSE\"");
			System.out.println("4");
			while (res.next()) {
				System.out.println("4.1" + res.getInt(1) +  res.getString(2) + res.getString(3));
				System.out.println(res.toString());
				Address a = new Address(res.getInt(1), res.getString(2), res.getString(3));
				System.out.println("4.2");
				addressList.add(a);
				System.out.println("4.3");
			}
			System.out.println("5");
			return addressList;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Exception list address");
			return null;
		}
	}

	@Override
	public void associate(int personID, int addressID) {
		try {
			PreparedStatement ps;
			ps = con.prepareStatement("UPDATE \"PUBLIC\".\"ADRESSE\" SET PERSONNE.ID=? WHERE ID=?");
			ps.setNull(1, personID);
			ps.setNull(2, addressID);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
