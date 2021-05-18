package modele;

import vue.*;

import tam.*;

import javafx.collections.*;
import javafx.beans.property.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;

import io.GuiIO;

import java.util.HashMap;

public class Modele {

    private Machine fMachine;

    public Modele(TextArea console) {
        this.fMachine = new Machine(new GuiIO(console));
    }

    public ObservableList<TamAsm> getZoneCode() {
        // Mise à jour des instructions
        ObservableList<TamAsm> tamAsmList = FXCollections.observableArrayList();
        int ct = fMachine.getCT();
        int cp = fMachine.getCP();
        for (int i = 0; i < ct; i++) {
            tamAsmList.add(new TamAsm(i, fMachine.getLabel(i), fMachine.writeInst(i),
                    fMachine.getCode()[i].isBreakpoint(), i == cp));
        }
        return tamAsmList;
    }

    public ObservableList<Stack> getZoneStack() {
        ObservableList<Stack> stackList = FXCollections.observableArrayList();
        java.util.HashMap<Integer, String> ea = getEnregistrementActivation();
        int st = fMachine.getST();
        int sb = fMachine.getSB();
        int lb = fMachine.getLB();
        for (int i = sb; i <= st; i++) {
            stackList.add(new Stack(i, fMachine.getData()[i], i == st, i == lb, (ea.get(i) != null ? ea.get(i) : "")));
        }
        return stackList;
    }

    private java.util.HashMap<Integer, String> getEnregistrementActivation() {
        java.util.Stack<Frame> callStack = this.fMachine.getCallStack();
        java.util.HashMap<Integer, String> ea = new java.util.HashMap<Integer, String>();
        for (Frame f : callStack) {
            String functionName = fMachine.writeA(f.getAddr());
            ea.put(f.getLd(), functionName);
            ea.put(f.getLd() + 1, functionName);
            ea.put(f.getLd() + 2, functionName);
        }
        return ea;
    }

    public ObservableList<Heap> getZoneHeap() {
        ObservableList<Heap> heapList = FXCollections.observableArrayList();
        int ht = fMachine.getHT();
        int hb = fMachine.getHB();
        for (int i = hb - 1; i >= ht; i--) {
            heapList.add(new Heap(i, fMachine.getData()[i], i == ht));
        }
        return heapList;
    }


    public ObservableList<Chaine> getZoneString() {
        ObservableList<Chaine> stringList = FXCollections.observableArrayList();
        Vector<String>  strings = fMachine.getStrings();
        for (int i = 0; i < strings.size(); i++) {
            stringList.add(new Chaine(i, strings.elementAt(i)));
        }
        return stringList;
    }

    public Machine getFMachine() {
        return this.fMachine;
    }

    public int getCP(){
        return fMachine.getCP();
    }
}