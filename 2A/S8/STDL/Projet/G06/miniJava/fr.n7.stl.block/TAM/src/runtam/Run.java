package runtam;

import java.io.*;
import asm.*;
import io.*;

import tam.Machine;

public class Run {

    public static void main(String[] args) throws Exception {
        if (args.length != 1) {
            System.err.println("java runtam.Run fichier.tam");
        }
        String fname = args[0];
        if (!fname.endsWith(".tam"))
            fname += ".tam";

        try {
            ByteArrayOutputStream binary = Asm.assembleFile(fname);
            Machine fMachine = new Machine(new ConsoleIO());
            fMachine.loadObjectProgram(binary);
            fMachine.mrun();
            System.out.println();
        } catch (FileNotFoundException e) {
            System.err.println("Cannot open " + fname + ": " + e);
            System.exit(1);
        } catch (SemanticError e) {
            System.out.println("Semantic error: " + e);
            System.exit(1);
        } catch (SyntaxicError e) {
            System.out.println("Syntaxic error: " + e);
            System.exit(1);
        } catch (Exception e) {
            System.out.println("Syntax Error: " + e);
        }
    }
}
