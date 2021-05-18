package controller;

import java.net.URL;
import java.io.*;
import java.util.*;

import javafx.event.ActionEvent;
import javafx.fxml.*;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import javafx.event.EventHandler;
import javafx.collections.*;
import javafx.scene.input.MouseEvent;
import javafx.scene.input.MouseButton;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.TableView;

import tam.Machine;
import modele.Modele;
import vue.TamAsm;
import asm.*;

public class AsmController implements Initializable {

	// Collections qui sont liées à l'affichage
	// Doivent être mises à jour quand la machine change
	private ObservableList<TamAsm> tamAsmList = FXCollections.observableArrayList();

	@FXML
	protected TableView tableCode;

	private Modele modele;

	private StackHeapStringController stackheapController;

	public void setModele(Modele modele) {
		this.modele = modele;
	}

	public TableView getCode(){
		return this.tableCode;
	}

	public void setStackheapController(StackHeapStringController c) {
		this.stackheapController = c;
	}

	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
	}

	private static void showException(String s, Exception e) {
		Alert alert = new Alert(AlertType.ERROR);
		alert.setTitle("Error Dialog");
		alert.setHeaderText(null);
		alert.setContentText(s + " \n" + e);
		alert.showAndWait();
		e.printStackTrace();
	}

	// Bouton importer fichier *.tam
	@FXML
	public void importAction(ActionEvent ev) {

		final FileChooser fileChooser = new FileChooser();
		File file = fileChooser.showOpenDialog(new Stage());

		if (file != null) {
			String fname = file.getPath();

			if (fname.endsWith(".tam")) {
				try {
					ByteArrayOutputStream out = asm.Asm.assembleFile(fname);
					modele.getFMachine().loadObjectProgram(out);
					// mise à jour
					this.update();
				} catch (FileNotFoundException e) {
					showException("Cannot open " + fname, e);
				} catch (SemanticError e) {
					showException("Semantic error", e);
				} catch (SyntaxicError e) {
					showException("Syntax error", e);
				} catch (Exception e) {
					showException("Syntax error", e);
				}
			}

		}
	}

	// CP, nous sert à scroller automatiquement
	private int cp = 0;

	public void update() {
		// On dit à la pile et au tas de se mettre à jour
		this.stackheapController.update();
		// Récupération de nouvelle zone de code
		this.tamAsmList = modele.getZoneCode();
		// nettoyage de la zone de texte
		this.tableCode.getItems().clear();
		// mise à jour de la zone de texte avec le nouveau code
		this.tableCode.setItems(this.tamAsmList);
		// On scroll pour que CP soit visible si on a fait autre chose que +1 sur CP
		int ncp = modele.getCP();
		if (ncp != cp + 1) {
			this.tableCode.scrollTo(modele.getCP());
		}
		cp = ncp;
		// refresh de l'affichage
		this.tableCode.refresh();
	}

	////////////////////////////////////////////////////////////////////////////////////////////////////// :

	////////////////////////////////////////////////////////////////////////////////////////////////////////

	// Exporter dans un fichier les instructions écrites dans le tableview
	@FXML
	public void exportAction(ActionEvent ev) {

		final FileChooser fileChooser = new FileChooser();
		File file = fileChooser.showSaveDialog(new Stage());

		if (file != null) {
			String fname = file.getName();
			try {
				if (!fname.endsWith(".tam"))
					fname += ".tam";
				FileWriter os = new FileWriter(new File(fname));
				os.write(getCodeFromTable());
				os.close();

			} catch (FileNotFoundException e) {
				showException("Erreur export", e);
			} catch (IOException e) {
				showException("Erreur export", e);
			}
		}
	}

	// Obtenir le contenu de la table pour l'écrire dans un fichier
	private String getCodeFromTable() {
		StringBuffer sb = new StringBuffer();
		for (int i = 1; i < tamAsmList.size(); i++) {
			TamAsm data = tamAsmList.get(i);
			if (!"".equals(data.getEtiquette()))
				sb.append(data.getEtiquette() + "\n");
			sb.append("\t" + data.getInstruction() + "\n");
		}
		return sb.toString();
	}

	////////////////////////////////////////////////////////////////////////////////////////////////////// :

	////////////////////////////////////////////////////////////////////////////////////////////////////////

	// Bouton run
	@FXML
	public void runAction(ActionEvent ev) {
		try {
			modele.getFMachine().mrun();
			this.update();
		} catch (Exception e) {
			showException("Erreur runAction", e);
		}
	}

	////////////////////////////////////////////////////////////////////////////////////////////////////// :

	////////////////////////////////////////////////////////////////////////////////////////////////////////

	// Bouton pas à pas stepinto
	@FXML
	public void stepintoAction(ActionEvent ev) {
		try {
			modele.getFMachine().mstep();
			this.update();
		} catch (Exception e) {
			showException("Erreur stepintoAction", e);
		}

	}

	////////////////////////////////////////////////////////////////////////////////////////////////////// :

	////////////////////////////////////////////////////////////////////////////////////////////////////////

	// Bouton pas à pas stepover
	@FXML
	public void stepoverAction(ActionEvent ev) {
		try {
			modele.getFMachine().mnext();
			this.update();
		} catch (Exception e) {
			showException("Erreur stepoverAction", e);
		}
	}

	////////////////////////////////////////////////////////////////////////////////////////////////////// :

	////////////////////////////////////////////////////////////////////////////////////////////////////////

	// Bouton stop
	@FXML
	public void stopAction(ActionEvent ev) {
		try {
			modele.getFMachine().mreset();
			this.update();
		} catch (Exception e) {
			showException("Erreur stopAction", e);
		}

	}

	////////////////////////////////////////////////////////////////////////////////////////////////////// :

	////////////////////////////////////////////////////////////////////////////////////////////////////////

	// Bouton pour mettre un breakpoint
	@FXML
	public void toggleBreakpoint(MouseEvent ev) {

		if (ev.getButton() == javafx.scene.input.MouseButton.SECONDARY) {
			if (this.tableCode.getSelectionModel().getSelectedItem() instanceof TamAsm) {

				String entier = this.tableCode.getSelectionModel().getSelectedItem().toString().split(",")[0];
				int i = Integer.parseInt(entier);
				modele.getFMachine().toggleBreakPoint(i);
				this.update();
			}
		}
	}

	// Bouton pour enlever tous les breakpoints
	@FXML
	public void unbreakAction(ActionEvent ev) {
		Machine m = modele.getFMachine();
		for (int i = m.getCB(); i < m.getCT(); i++) {
			if (m.isBreakPoint(i)) {
				m.toggleBreakPoint(i);
			}
		}
		this.update();
	}
}
