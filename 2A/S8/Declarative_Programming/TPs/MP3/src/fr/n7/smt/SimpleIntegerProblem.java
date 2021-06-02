package fr.n7.smt;

import java.util.*;
import com.microsoft.z3.*;

class SimpleIntegerProblem {
    static void solveAndPrint(Solver solver,
                              IntExpr a,
                              IntExpr b,
                              IntExpr c,
                              IntExpr d,
                              IntExpr e) {

        long startTime = System.currentTimeMillis();

        if (solver.check() == Status.SATISFIABLE) {
            System.out.println("  Problem is SAT!");

            Model m = solver.getModel();

            System.out.println("  - value of a: " + m.getConstInterp(a));
            System.out.println("  - value of b: " + m.getConstInterp(b));
            System.out.println("  - value of c: " + m.getConstInterp(c));
            System.out.println("  - value of d: " + m.getConstInterp(d));
            System.out.println("  - value of e: " + m.getConstInterp(e));
        } else {
            System.out.println("  UNSAT or UNKNOWN problem!");
        }

        long stopTime    = System.currentTimeMillis();
        long elapsedTime = stopTime - startTime;

        System.out.println("  time to solve: " + elapsedTime + "ms");
    }

    public static void main(String[] args) {
        HashMap<String, String> cfg = new HashMap<String, String>();
        cfg.put("model", "true");
        cfg.put("proof", "true");

        Context context = new Context(cfg);
        Solver  solver  = context.mkSolver();

        // create 5 integer variables
        System.out.print("* Creating 5 integer variables...");

        IntExpr a = context.mkIntConst("a");
        IntExpr b = context.mkIntConst("b");
        IntExpr c = context.mkIntConst("c");
        IntExpr d = context.mkIntConst("d");
        IntExpr e = context.mkIntConst("e");

        System.out.println(" OK");

        // create constraints
        System.out.println("* Creating and adding constraints...");

        // create and add constraint a > b + 2
        System.out.print("  creating a > b + 2: ");
        BoolExpr c1 = context.mkGt(a, context.mkAdd(b, context.mkInt(2)));
        solver.add(c1);
        System.out.println(c1);

        // create and add constraint a = 2 * c + 10
        System.out.print("  creating a = 2 * c + 10: ");
        BoolExpr c2 = context.mkEq(a,
                                   context.mkAdd(context.mkMul(c, context.mkInt(2)),
                                                 context.mkInt(10)));
        solver.add(c2);
        System.out.println(c2);

        // create and add constraint b + c <= 1000
        System.out.print("  creating b + c <= 1000: ");
        BoolExpr c3 = context.mkLe(context.mkAdd(b, c), context.mkInt(1000));
        solver.add(c3);
        System.out.println(c3);

        // create and add constraint d >= e
        System.out.print("  creating d >= e: ");
        BoolExpr c4 = context.mkGe(d, e);
        solver.add(c4);
        System.out.println(c4);

        // create constraints
        System.out.println("* Solving problem and printing model...");
        SimpleIntegerProblem.solveAndPrint(solver, a, b, c, d, e);

        // adding a constraint on value of a
        System.out.println("* Adding new constraint on a...");
        solver.add(context.mkNot(context.mkEq(a, context.mkInt(0))));
        SimpleIntegerProblem.solveAndPrint(solver, a, b, c, d, e);
    }
}
