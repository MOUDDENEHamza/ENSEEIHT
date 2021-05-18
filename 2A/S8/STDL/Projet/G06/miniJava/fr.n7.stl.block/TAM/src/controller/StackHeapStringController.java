package controller;

import java.net.URL;
import javafx.fxml.*;
import java.util.*;
import javafx.collections.*;
import java.util.ArrayList;
import java.util.List;

import tam.Machine;
import modele.Modele;
import vue.Heap;
import vue.Stack;
import vue.Chaine;
import javafx.scene.control.TableView;

public class StackHeapStringController implements Initializable {

	// Collections qui sont liées à l'affichage
	// Doivent être mises à jour quand la machine change
	private ObservableList<Stack> stackList = FXCollections.observableArrayList();
	private ObservableList<Heap> heapList = FXCollections.observableArrayList();
	private ObservableList<Chaine> stringList = FXCollections.observableArrayList();

	@FXML
	// Le tableau stack
	protected TableView tableStack;
	@FXML
	// Le tableau heap
	protected TableView tableHeap;
	@FXML
	// Le tableau des chaîne de caractère
	protected TableView tableString;

	private Modele modele;

	public void setModele(Modele modele) {
		this.modele = modele;
	}

	public TableView getStack() {
		return tableStack;
	}

	public void update() {
		// La pile
		// récupération des nouvelles données de la pile
		this.stackList = modele.getZoneStack();
		// nettoyage de la zone de la pile
		this.tableStack.getItems().clear();
		// mise à jour de la zone de texte avec le nouveau code
		this.tableStack.setItems(this.stackList);
		// refresh de l'affichage
		this.tableStack.refresh();

		// Le tas
		// récuperation des nouvelles données du tas
		this.heapList = modele.getZoneHeap();
		// nettoyage de la zone de la pile
		this.tableHeap.getItems().clear();
		// mise à jour de la zone de texte avec le nouveau code
		this.tableHeap.setItems(this.heapList);
		// refresh de l'affichage
		this.tableHeap.refresh();

		// Les chaîne de caractères
		// récuperation des nouvelles données du tas
		this.stringList = modele.getZoneString();
		// nettoyage de la zone de la pile
		this.tableString.getItems().clear();
		// mise à jour de la zone de texte avec le nouveau code
		this.tableString.setItems(this.stringList);
		// refresh de l'affichage
		this.tableString.refresh();
	}

	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		// TODO Auto-generated method stub

	}

}