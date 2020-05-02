/** The financial statement of the restaurant
 * @author LOTFI
 *
 */


public class FinancialState {
	
	//the initial balance
	private double rstBalance;

	//The history of gain and loss transactions carried out. 
	private History operations;
	
	public FinancialState(double balance) {
		this.rstBalance = balance;
		this.operations.record(balance, this.rstBalance);
	}
	
	/** Give the balance of the restaurant
	* @return this balance.
	*/
	public double getRestauBalance() {
		return this.rstBalance;
	}
	
	/** change the balance of the restaurant
	* @param this balance.
	*/
	
	public void setRestauBalance(double newBalance) {
		 this.rstBalance = newBalance;
	}
	
	/** add a earning to the restau' balance
	 * @param gain
	 */
	
	public void addGain( double gain) {
		this.rstBalance = this.rstBalance + gain;
		this.operations.record(gain, this.rstBalance);
	}
	
	/** Substract a earning to the restau' balance
	 * @param loss
	 */
	
	public void SubstractLoss(double loss) {
		this.rstBalance = this.rstBalance - loss;
		this.operations.record(loss,this.rstBalance);
	}

}
