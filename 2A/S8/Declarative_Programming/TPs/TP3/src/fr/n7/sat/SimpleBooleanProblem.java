package fr.n7.sat;

import java.util.*;
import com.microsoft.z3.*;

class SimpleBooleanProblem {

    static Model check(Solver solver) {
        if (solver.check() == Status.SATISFIABLE) {
            return solver.getModel();
        } else {
            return null;
        }
    }

    static void checkAndPrint(Solver solver) {
        Status q = solver.check();

        switch (q) {
        case UNKNOWN:
            System.out.println("  Unknown because:\n" +
                               solver.getReasonUnknown());
            break;
        case SATISFIABLE:
            System.out.println("  SAT, model:\n" +
                               solver.getModel());
            break;
        case UNSATISFIABLE:
            System.out.println("  UNSAT, proof:\n" +
                               solver.getProof());
            break;
        }
    }

    public static void main(String[] args) {
        // printing infos
        System.out.println("* Printing Z3 infos...");

        com.microsoft.z3.Global.ToggleWarningMessages(true);
        Log.open("test.log");

        System.out.print("Z3 Major Version: ");
        System.out.println(Version.getMajor());
        System.out.print("Z3 Full Version: ");
        System.out.println(Version.getString());
        System.out.print("Z3 Full Version String: ");
        System.out.println(Version.getFullVersion());

        // create simple boolean problem
        // create context for Z3
        // cfg contains configuration items
        // here we turn on model generation
        HashMap<String, String> cfg = new HashMap<String, String>();
        cfg.put("model", "true");
        cfg.put("proof", "true");

        Context context = new Context(cfg);

        // create solver
        Solver solver = context.mkSolver();

        // create 3 boolean variables
        System.out.print("* Creating 3 boolean variables...");

        BoolExpr a = context.mkBoolConst("a_name");
        BoolExpr b = context.mkBoolConst("b");
        BoolExpr c = context.mkBoolConst("c");

        System.out.println(" OK");

        // print variable and infos
        System.out.println("  Printing a : " + a +
                           " (notice the name is different than the variable name)");
        System.out.println("  Has a boolean sort? " + a.isBool());
        System.out.println("  Is a an algebraic number? " + a.isAlgebraicNumber());
        System.out.println("  Has a value true? " + a.isTrue());
        System.out.println("  Has a value false? " + a.isFalse());
        System.out.println("  Value of a? " + a.getBoolValue());

        // create formulas
        System.out.print("* Creating formulas...");
        BoolExpr formula1 = context.mkImplies(a, b);
        BoolExpr formula2 = context.mkOr(context.mkNot(b),
                                         context.mkNot(c));

        System.out.println(" OK");

        // printing formulas
        System.out.println("  formula1: " + formula1);
        System.out.println("  formula2: " + formula2);

        // checking first set of formulas
        System.out.println("* Checking first set of formulas...");
        BoolExpr set1[] = { formula1, formula2, a };

        for (BoolExpr e : set1)
            solver.add(e);

        checkAndPrint(solver);

        // push solver state
        System.out.println("* Pushing solver state...");
        solver.push();

        // checking second set of formulas
        System.out.println("* Checking second set of formulas by adding c...");
        solver.add(c);
        checkAndPrint(solver);

        // pop solver state and check
        System.out.println("* Popping solver state...");
        solver.pop();

        System.out.println("  checking again the solver -> it should now be SAT");
        checkAndPrint(solver);

        // use Model
        System.out.println("* Checking first set of formulas and getting model...");
        Model m = check(solver);

        if (m != null) {
            System.out.println("  value of a: " + m.getConstInterp(a));
            System.out.println("  value of b: " + m.getConstInterp(b));
            System.out.println("  value of c: " + m.getConstInterp(c));

            System.out.println("  BEWARE: a.getBoolValue() = " +
                               a.getBoolValue());

            if (m.getConstInterp(a).isTrue()) {
                System.out.println("  m.getConstInterp(a).isTrue() returns" +
                                   " the Java boolean constant true");
            }


        } else {
            System.out.println("  no model!");
        }

        // closing context
        System.out.print("* Closing...");
        context.close();
        System.out.println(" OK");
    }
}
