
package controller;

import java.net.URL;
import javafx.fxml.*;
import java.util.ResourceBundle;

public class MainController implements Initializable {

	@FXML
	private AsmController asmController;

	@FXML
	private ConsoleController consoleController;

	@FXML
	private StackHeapStringController stackHeapController;

	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		// TODO Auto-generated method stub

	}

	public AsmController getAsmController() {
		return this.asmController;
	}

	public ConsoleController getConsoleController() {
		return this.consoleController;
	}

	public StackHeapStringController getStackHeapController() {
		return this.stackHeapController;
	}

}
