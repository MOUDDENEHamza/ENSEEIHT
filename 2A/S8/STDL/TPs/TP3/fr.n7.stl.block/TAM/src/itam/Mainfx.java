package itam;

import javafx.application.*;
import javafx.scene.*;
import javafx.stage.*;
import javafx.fxml.*;
import javafx.collections.*;
import javafx.scene.control.TableRow;
import java.awt.Color;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;

import java.net.URL;
import java.io.*;
import java.util.*;

import asm.*;
import controller.*;

import modele.*;

public class Mainfx extends Application {

  // Couleur de surlignage des champs d'enregistrement d'activation
  private String couleurEnregistrementActivation = "skyblue";
  // Couleur de surlignage de la ligne de l'instruction courante
  private String couleurCP = "palevioletred";

  @Override
  public void start(Stage primaryStage) throws Exception {
    /*
     * Code for JavaFX application. (Stage, scene, scene graph)
     */

    try {
      // Localisation du fichier FXML.
      URL url = getClass().getResource("/fxml/Main.fxml");
      // Création du loader.
      FXMLLoader fxmlLoader = new FXMLLoader(url);
      // Chargement du FXML.
      Parent root = fxmlLoader.load();

      // Ajout du modèle au contrôleur
      MainController mainController = fxmlLoader.getController();
      AsmController asmController = mainController.getAsmController();
      StackHeapStringController stackheapController = mainController.getStackHeapController();
      ConsoleController consoleController = mainController.getConsoleController();
      Modele modele = new Modele(consoleController.getConsole());
      asmController.setModele(modele);
      asmController.setStackheapController(stackheapController);
      stackheapController.setModele(modele);

      // Création de la scène.
      Scene scene = new Scene(root);
      primaryStage.setScene(scene);

      // Style pour la couleur des enregistrement d'activation
      stackheapController.getStack().setRowFactory(tv -> new TableRow<vue.Stack>() {
        @Override
        public void updateItem(vue.Stack item, boolean empty) {
          super.updateItem(item, empty);
          if (item == null) {
            setStyle("");
          } else if (!item.getInfo().equals("")) {
            this.setStyle("-fx-background-color: "+couleurEnregistrementActivation+";");
          } else {
            setStyle("");
          }
        }
      });

      // Style pour la couleur de l'instruction courante
      asmController.getCode().setRowFactory(tv -> new TableRow<vue.TamAsm>() {
        @Override
        public void updateItem(vue.TamAsm item, boolean empty) {
          super.updateItem(item, empty);
          if (item == null) {
            setStyle("");
          } else if (item.isCP()) {
            this.setStyle("-fx-background-color: "+couleurCP+";");
          } else {
            setStyle("");
          }
        }
      });

    } catch (IOException ex) {
      Alert alert = new Alert(AlertType.ERROR);
      alert.setTitle("Error Dialog");
      alert.setHeaderText(null);
      alert.setContentText("Erreur au chargement: \n" + ex);
      ex.printStackTrace();
      alert.showAndWait();
      System.exit(0);
    }
    primaryStage.setTitle("TAM");
    primaryStage.show();

  }

  public static void main(String args[]) {
    launch(args);
  }
}