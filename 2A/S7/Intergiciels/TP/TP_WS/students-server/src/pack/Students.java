package pack;

import java.util.Hashtable;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

@Path("/rest")
public class Students {
			
		// bad
		static Hashtable<String, Student> students = new Hashtable<String, Student>();
		static Hashtable<String, Record> records = new Hashtable<String, Record>();

		static void addStudent(Student s) {
			students.put(s.getFirstname()+"-"+s.getLastname(), s);
		}
		static void addRecord(Record r) {
			records.put(r.getINE(), r);
		}
		static {
			addStudent(new Student("1111111111","Alain","Tchana","18/12/1984","male","3 rue Jeff Rouchon","Toulouse","31000","France","0102030405","alain.tchana@enseeiht.fr"));
			addStudent(new Student("2222222222","Boris","Teabe","12/03/1990","male","6 rue Paul Biya","Yaoundé","xxxxx","Cameroun","0607080910","boris.teabe@enseeiht.fr"));
			addStudent(new Student("3333333333","Axel","Carlier","05/07/1987","male","9 rue Denis Dartus","Toulouse","31000","France","0102030405","axel.carlier@enseeiht.fr"));
			addStudent(new Student("4444444444","Zouheir","Hamrouni","07/10/1970","male","2 rue Geraldine Morin","Toulouse","31000","France","0102030405","zouheir.hamrouni@enseeiht.fr"));
			addStudent(new Student("5555555555","Daniel","Hagimont","08/07/1965","male","1 Francois Asselineau","Toulouse","31000","France","0102030405","daniel.hagimont@enseeiht.fr"));
			
			addRecord(new Record("1111111111","12","14","11","5","16","18"));
			addRecord(new Record("2222222222","11","7","15","16","16","2"));
			addRecord(new Record("3333333333","9","18","11","15","16","20"));
			addRecord(new Record("4444444444","7","19","13","5","16","18"));
			addRecord(new Record("5555555555","9","12","11","18","3","18"));
		}
		
		@GET
		@Path("/getstudent")
		@Produces({ "application/json" })
		public Student getStudent(@QueryParam("firstname") String firstname, @QueryParam("lastname") String lastname) {
			String key = firstname+"-"+lastname;
			System.out.println("access student: "+key);
			return students.get(key);
		}
		
		@GET
		@Path("/getrecord")
	    @Produces({ "application/json" })
		public Record getRecord(@QueryParam("ine") String ine) {
			System.out.println("access record: "+ine);
			return records.get(ine);
		}

}
