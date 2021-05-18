package asm;

import java.io.*;
import java.util.*;

public class Asm {

    private static TDS tdsutilisateur = new TDS();

    static private Binaire principale(String file) throws FileNotFoundException, SemanticError, Exception {
        tdsutilisateur = new TDS();
        parser p = new parser(new Lex(new FileReader(file)));
        List<Instruction> result = (List<Instruction>) p.parse().value;

        // créer le BINAIRE
        Binaire code = new Binaire(3000);
        // créer les 3 TDS
        TDS tdsregistre = new TDS();
        tdsregistre.declarer_regs();

        TDS tdssubr = new TDS();
        tdssubr.declarer_subrs();

        for (Instruction i : result) {
            i.analyser(code, tdsregistre, tdssubr, tdsutilisateur);
        }
        // Vérifier que tous les labels utilisés ont bien été définis
        tdsutilisateur.verifier_etiquettes();
        return code;
    }

    static public ByteArrayOutputStream assembleFile(String fname)
            throws FileNotFoundException, SemanticError, Exception {
        Binaire code = Asm.principale(fname);
        ByteArrayOutputStream binary = code.sauver(tdsutilisateur);
        return binary;
    }

}
