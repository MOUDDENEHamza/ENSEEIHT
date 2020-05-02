import java.io.FileWriter;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
/**History maintains a chronological history of the reals recorded.
  * The history is unbounded (use of an ArrayList), except by
 * compared to the amount of available memory (OutOfMemoryException)!
 * @author LOTFI
 * @version 0.1
 */

public class History {
	
	 Date1 date = new Date1();

	/** Build an empty history. */
	//@ ensures getNbValues() == 0;	// Empty History
	
	public History() {
		
	    }
	
	 /** Save new information in the history
	 * @param info the information to be recorded in the history
	 * @param Date the date associate at this information 
	 */
	public void record(double info, double Balance ) {
		String str = Double.toString(Balance);
		String str1 = Integer.toString(getNbValues());
		String str2 = Double.toString(info);
		try {
		    FileWriter csvWriter = new FileWriter("data/operation.csv",true);
		    csvWriter.append(str1);
		    csvWriter.append(",");
		    csvWriter.append(date.getDate());
		    csvWriter.append(",");
		    csvWriter.append(str2);
		    csvWriter.append(",");
		    csvWriter.append(str);
		    csvWriter.append("\n");
		    csvWriter.flush();
		    csvWriter.close();
		    } catch (IOException e) {
		      e.printStackTrace();}
	     }
	
	
	/** return the value associated to the i th operation
	* @param i transaction index included in 1 and getNbValeurs ().
	* @return this value
	*/
	public void getValue(int i) {
		BufferedReader br =null;
		try {
			br = new BufferedReader(new FileReader("data/operation.csv"));
            String line;
            if((line = br.readLine()) != null){
			   while ((line = br.readLine()) != null) {
                // use comma as separator
                String[] op = line.split(",");
                int j = Integer.parseInt(op[0]);
                if(j == i ) {
                    if(i==1){
                	System.out.println("The amount of the 1st operation is : " + op[2]);}
                    else if(i==2){System.out.println("The amount of the 2nd operation is : " + op[2]);
                    }else{System.out.println("The amount of the " + i + "th operation is : " + op[2]);}
                }
               }
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();}
		finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
	}
	
	
	/** return the date associated to the i th operation
	* @param i transaction index included in 1 and getNbValeurs ().
	* @return this date
	*/
	public  void getDate(int i) {
		BufferedReader br =null;
		try {
			br = new BufferedReader(new FileReader("data/operation.csv"));
            String line;
            if((line = br.readLine()) != null){
			while ((line = br.readLine()) != null) {
				
                // use comma as separator
                String[] op = line.split(",");
                int j = Integer.parseInt(op[0]);
                if(j == i ) {
                	 if(i==1){
                	System.out.println("The amount of the 1st operation is : " + op[2]);}
                    else if(i==2){System.out.println("The amount of the 2nd operation is : " + op[2]);
                    }else{System.out.println("The amount of the " + i + "th operation is : " + op[2]);}
                }
            }
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();}
		finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
	}
	
	/** The number of integers recorded in the history
     * @return the number of integers in the history
     */

	public /*@ pure @*/ int getNbValues() {
        int i = 0;
        BufferedReader br =null;
        try {

            br = new BufferedReader(new FileReader("data/operation.csv"));
            while ((br.readLine()) != null) {
            	i = i+1;
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();}
        finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
		return i;
	}
	
	public void read() {
		BufferedReader br = null;
	        String line = "";

	        try {

	            br = new BufferedReader(new FileReader("data/operation.csv"));
	            while ((line = br.readLine()) != null) {

	                // use comma as separator
	                String[] op = line.split(",");

	                System.out.println("[ " + op[0] + " | " + op[1] + " | " + op[2] + " | " + op[3] + " ] "  );

	            }

	        } catch (FileNotFoundException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            if (br != null) {
	                try {
	                    br.close();
	                } catch (IOException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
		}
}
