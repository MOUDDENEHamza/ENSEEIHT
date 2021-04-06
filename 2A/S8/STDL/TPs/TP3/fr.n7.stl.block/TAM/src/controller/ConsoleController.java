
package controller;

import java.net.URL;
import javafx.fxml.*;
import java.util.ResourceBundle;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.event.ActionEvent;
import javafx.application.Platform;

public class ConsoleController implements Initializable {

	@FXML
	protected TextArea console;

	@FXML
	protected TextField saisie;

	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		// TODO Auto-generated method stub

	}

	public TextArea getConsole() {
		return console;
	}

	public TextField getSaisie() {
		return saisie;
	}


	@FXML
	public void cleanAction(ActionEvent ev) {
        Platform.runLater(() -> console.clear());
	}
}
