package asm;

////////*  INSTRS */////////

abstract class Instruction {

    private int ligne;

    public Instruction(int l) {
        this.ligne = l;
    }

    int getLigne() {
        return this.ligne;
    }

    public abstract void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) throws SemanticError;
}

////////// * LES INSTRUCTIONS INSTR */////////////////

/* LOAD */
class LOADInstruction extends Instruction {
    int n1;
    int n2;
    String i;

    public LOADInstruction(int ligne, int n1, int n2, String i) {
        super(ligne);
        this.n1 = n1;
        this.n2 = n2;
        this.i = i;
    }

    public void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) throws SemanticError {
        int reg = tdsregistre.ref_reg(i);
        if (reg == -1) {
            throw new SemanticError("Ligne " + getLigne() + " : registre " + i + " inconnu.");
        } else {
            code.ajouter(0, reg, n1, n2);
        }
    }
}

/* LOADA */
class LOADAInstruction extends Instruction {

    CInst c;

    public LOADAInstruction(int ligne, CInst c) {
        super(ligne);
        this.c = c;
    }

    public void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) throws SemanticError {
        this.c.analyser(code, tdsregistre, tdssubr, tdsutilisateur);
        code.ajouter(1, c.rval, 0, c.dval);
    }
}

/* LOADI */
class LOADIInstruction extends Instruction {
    int n1;

    public LOADIInstruction(int ligne, int n1) {
        super(ligne);
        this.n1 = n1;
    }

    public void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) {
        code.ajouter(2, 0, n1, 0);
    }
}
/* LOADL */

class LOADLInstruction extends Instruction {

    Cste ct;

    public LOADLInstruction(int ligne, Cste ct) {
        super(ligne);
        this.ct = ct;
    }

    public void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) throws SemanticError {
        if (ct.getSorte() == CType.Entier) {
            code.ajouter(3, ct.getSorte(), 0, (int) ct.getVal());
        } else if (ct.getSorte() == CType.Chaine) {
            code.ajouter(3, ct.getSorte(), 0, tdsregistre.declarer_chaine(ct.getVal().toString()));
        } else if (ct.getSorte() == CType.Char) {
            code.ajouter(3, ct.getSorte(), 0, tdsregistre.to_char(ct.getVal().toString()));
        } else {
            throw new SemanticError(
                    "Ligne " + getLigne() + " : Type après LOADL différent de : entier, chaîne, caractère.");
        }
    }
}

/* STORE */
class STOREInstruction extends Instruction {
    int n1;
    int n2;
    String i;

    public STOREInstruction(int ligne, int n1, int n2, String i) {
        super(ligne);
        this.n1 = n1;
        this.n2 = n2;
        this.i = i;
    }

    public void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) throws SemanticError {
        int reg = tdsregistre.ref_reg(i);
        if (reg == -1) {
            throw new SemanticError("Ligne " + getLigne() + " : registre " + i + " inconnu.");
        } else {
            code.ajouter(4, reg, n1, n2);
        }
    }
}

/* STOREI */
class STOREIInstruction extends Instruction {
    int n1;

    public STOREIInstruction(int ligne, int n1) {
        super(ligne);
        this.n1 = n1;
    }

    public void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) {
        code.ajouter(5, 0, n1, 0);
    }
}

/* CALL */

class CALLInstruction extends Instruction {
    String i;
    CInst c;

    public CALLInstruction(int ligne, String i, CInst c) {
        super(ligne);
        this.c = c;
        this.i = i;
    }

    public void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) throws SemanticError {
        int reg = tdsregistre.ref_reg(i);
        if (reg == -1) {
            throw new SemanticError("Ligne " + getLigne() + " : registre " + i + " inconnu.");
        } else {
            this.c.analyser(code, tdsregistre, tdssubr, tdsutilisateur);
            code.ajouter(6, c.rval, reg, c.dval);
        }
    }
}

/* CALLI */
class CALLIInstruction extends Instruction {

    public CALLIInstruction(int ligne) {
        super(ligne);
    }

    public void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) {
        code.ajouter(7, 0, 0, 0);
    }
}

/* RETURN */
class RETURNInstruction extends Instruction {
    int n1;
    int n2;

    public RETURNInstruction(int ligne, int n1, int n2) {
        super(ligne);
        this.n1 = n1;
        this.n2 = n2;
    }

    public void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) {
        code.ajouter(8, 0, n1, n2);
    }
}

/* SUBR */
class SUBRInstruction extends Instruction {
    String i;

    public SUBRInstruction(int ligne, String i) {
        super(ligne);
        this.i = i;
    }

    public void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) throws SemanticError {
        int s = tdssubr.ref_subr(i);
        if (s == -1) {
            throw new SemanticError("Ligne " + getLigne() + " : SUBR " + i + " inconnue.");
        } else {
            code.ajouter(9, 0, 0, s);
        }
    }
}

/* IDENT */
class IDENTInstruction extends Instruction {
    String i;

    public IDENTInstruction(int ligne, String i) {
        super(ligne);
        this.i = i;
    }

    public void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) throws SemanticError {
        int adr = code.get_adresse();
        Info info = tdsutilisateur.chercherLocalement(i.toLowerCase());
        if (info == null) {
            Etiquette e = tdsutilisateur.declarerEtiquette(i);
            e.updateDep(adr);
            code.maj_refs(e);
        } else if (info.estEtiquette() == false) {
            throw new SemanticError("Ligne " + getLigne() + " : " + i + " n'est pas une etiquette.");
        } else if (info.getLabel().getDep() != -1) {
            throw new SemanticError("Ligne " + getLigne() + " : double déclaration de l'étiquette '" + i + "'.");
        } else {
            Etiquette f = info.getLabel();
            f.updateDep(adr);
            code.maj_refs(f);
        }
    }
}

/* PUSH */
class PUSHInstruction extends Instruction {
    int n1;

    public PUSHInstruction(int ligne, int n1) {
        super(ligne);
        this.n1 = n1;
    }

    public void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) {
        code.ajouter(10, 0, 0, n1);
    }
}

/* POP */
class POPInstruction extends Instruction {
    int n1;
    int n2;

    public POPInstruction(int ligne, int n1, int n2) {
        super(ligne);
        this.n1 = n1;
        this.n2 = n2;
    }

    public void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) {
        code.ajouter(11, 0, n1, n2);
    }
}

/* JUMP */

class JUMPInstruction extends Instruction {

    CInst c;

    public JUMPInstruction(int ligne, CInst c) {
        super(ligne);
        this.c = c;
    }

    public void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) throws SemanticError {
        this.c.analyser(code, tdsregistre, tdssubr, tdsutilisateur);
        code.ajouter(12, c.rval, 0, c.dval);
    }
}

/* JUMPI */
class JUMPIInstruction extends Instruction {

    public JUMPIInstruction(int ligne) {
        super(ligne);
    }

    public void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) {
        code.ajouter(13, 0, 0, 0);
    }
}

/* JUMPIF */

class JUMPIFInstruction extends Instruction {
    int n1;
    CInst c;

    public JUMPIFInstruction(int ligne, int n1, CInst c) {
        super(ligne);
        this.n1 = n1;
        this.c = c;
    }

    public void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) throws SemanticError {
        this.c.analyser(code, tdsregistre, tdssubr, tdsutilisateur);
        code.ajouter(14, c.rval, n1, c.dval);
    }
}

/* HALT */
class HALTInstruction extends Instruction {

    public HALTInstruction(int ligne) {
        super(ligne);
    }

    public void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) {
        code.ajouter(15, 0, 0, 0);
    }
}

///////////////// * CSTE *////////////

class Cste<T> {

    private T val;
    private int sorte;

    public Cste(T val, int sorte) {
        this.val = val;
        this.sorte = sorte;
    }

    T getVal() {
        return this.val;
    }

    int getSorte() {
        return this.sorte;
    }
}

///////////// * CINST *///////////////:

abstract class CInst {
    int dval;
    int rval;

    abstract void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) throws SemanticError;
}

/* CINST1 */
class CINST1 extends CInst {
    int n1;
    String i;

    public CINST1(int n1, String i) {
        this.n1 = n1;
        this.i = i;
    }

    public void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) throws SemanticError {
        if (tdsregistre.containsregistre(i.toLowerCase())) {
            this.dval = n1;
            this.rval = tdsregistre.ref_reg(i);
        } else {
            throw (new SemanticError("registre pas dans tdsregistre"));
        }
    }
}

/* CINST2 */
class CINST2 extends CInst {
    String i;

    public CINST2(String i) {
        this.i = i;
    }

    public void analyser(Binaire code, TDS tdsregistre, TDS tdssubr, TDS tdsutilisateur) throws SemanticError {
        Etiquette e = null;
        Info info = tdsutilisateur.chercherLocalement(i.toLowerCase());
        if (info == null) {
            e = tdsutilisateur.declarerEtiquette(i);
        } else if (!info.estEtiquette()) {
            throw (new SemanticError("Mauvaise utilisation d'une étiquette"));
        } else {
            e = info.getLabel();
        }
        int adr = code.get_adresse();
        e.ajouterRef(adr);
        this.rval = e.getReg();
        this.dval = e.getDep();
    }
}
