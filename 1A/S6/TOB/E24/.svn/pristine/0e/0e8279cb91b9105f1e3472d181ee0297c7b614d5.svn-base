import org.junit.*;

import employee.History;

import static org.junit.Assert.*;

public class TestHistory {
	 public  static final double EPSILON = 0.001;
     private History history;
     
 
     @Before 
     public void setUp() {
     	history = new History();
     }

     /** Test for getValue function.*/
     @Test
     public void Test1(){  
    	  assertEquals(250, history.getValue(1),EPSILON);
          assertEquals(-154, history.getValue(2),EPSILON);
          assertEquals(1154, history.getValue(3),EPSILON); 
     } 
     
     /** Test for getNbValues ,getPosition 
      * and getPositionF functions.*/
     @Test
     public void Test2(){  
    	  assertEquals(11, History.getNbValues(),EPSILON);
          assertEquals(32, history.getPosition("26/04/2020"),EPSILON); 
          assertEquals(16, history.getPositionF("16/05/2020"),EPSILON); 
          assertEquals(42, history.getPosition("16/05/2020"),EPSILON); 
     } 

}
