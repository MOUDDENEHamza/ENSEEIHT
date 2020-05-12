
//author chaimaa



public class ExpensesComparaison {
	
		
		//the initial balance
		private String date1;
		private String date2;
	    private  History history;
		//History history =new History();

		public ExpensesComparaison(String d1, String d2,History h) {
			this.date1=d1;
			this.date2=d2;
	        this.history=h;
		}

	    public double comparaison1(){
	           
	            int nbOperations1 = history.getPositionF(this.date1);
	            int i;
	            double sum1=0;
	            for(i=1;i<=nbOperations1 ;i++){
	                    sum1=sum1+history.getValue(i);
	            } 
	            return sum1;
	     } 


	     public double comparaison2() {
	           
	            
	            int nbOperations2 = history.getPositionF(this.date2);
	    
	            int j;
	            double sum2=0;
	            for(j=1;j<=nbOperations2;j++){
	                    sum2=sum2+history.getValue(j);
	            } 
	            return sum2;
	     }            
	}
