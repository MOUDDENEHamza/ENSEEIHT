package io;

import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.collections.*;
import javafx.application.Platform;
import javafx.scene.control.TextInputDialog;
import java.util.Optional;

public class GuiIO implements IO {

    private TextArea console;

    public GuiIO(TextArea c) {
        this.console = c;
    }

    @Override
    public void print(String l) {
        Platform.runLater(() -> console.appendText(l));
    }

    public String readLine(String invite) {
        TextInputDialog dialog = new TextInputDialog("");
        dialog.setTitle("Saisie");
        dialog.setHeaderText(null);
        dialog.setContentText(invite);

        Optional<String> result = dialog.showAndWait();
        return (result.isPresent() ? result.get() : "");
    }

    public int readInt() {
        int resultat = 0;
        boolean saisieOK = false;
        while (!saisieOK) {
            try {
                String s = readLine("Saisissez un entier : ");
                resultat = Integer.parseInt(s);
                saisieOK = true;
            } catch (NumberFormatException e) {
                print("Ce n'est pas un entier. Recommencez !\n");
            }
        }
        return resultat;
    }

    public boolean readBool() {
        int resultat = 0;
        boolean saisieOK = false;
        while (!saisieOK) {
            try {
                String s = readLine("Saisissez un boolean (0 pour false, 1 pour true) :");
                resultat = Integer.parseInt(s);
                saisieOK = (resultat == 1 || resultat == 0);
                if (!saisieOK) {
                    print("Ce n'est pas un boolean. Recommencez !\n");
                }
            } catch (NumberFormatException e) {
                print("Ce n'est pas un boolean. Recommencez !\n");
            }
        }
        return (resultat == 1);
    }

    public char readChar() {
        String line = readLine("Saisissez un caractère :");
        return line.length() > 0 ? line.charAt(0) : '\n';
    }

    public String readString() {
        return readLine("Saisissez une chaîne de caractères :");
    }
}
