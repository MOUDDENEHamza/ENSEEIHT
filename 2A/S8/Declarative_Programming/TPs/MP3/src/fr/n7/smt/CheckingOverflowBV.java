package fr.n7.smt;

import java.util.*;
import com.microsoft.z3.*;

class CheckingOverflowBV {
    private static void solveAndPrint(Solver solver, BitVecExpr a) {
        if (solver.check() == Status.SATISFIABLE) {
            System.out.println("  Problem is SAT!");

            Model m = solver.getModel();

            System.out.println("  - value of a: " + m.getConstInterp(a));
        } else {
            System.out.println("  UNSAT or UNKNOWN problem!");
        }
    }

    private static void checkOverflow(Solver solver, BitVecExpr a, BitVecExpr sa) {
        if (solver.check() == Status.SATISFIABLE) {
            System.out.println("  Overflow detected!");

            Model m = solver.getModel();

            System.out.println("  - value of a: " + m.getConstInterp(a));
            System.out.println("  - value of sa: " + m.getConstInterp(sa));
        } else {
            System.out.println("  No overflow...");
        }
    }


    public static void main(String[] args) {
        HashMap<String, String> cfg = new HashMap<String, String>();
        cfg.put("model", "true");
        cfg.put("proof", "true");

        Context context = new Context(cfg);
        Solver  solver  = context.mkSolver();

        // create 3 bitvector variables of size 4
        System.out.print("* Creating 3 BV variables of size 4...");

        BitVecExpr a = context.mkBVConst("a", 4);
        BitVecExpr b = context.mkBVConst("b", 4);
        BitVecExpr c = context.mkBVConst("c", 4);

        System.out.println(" OK");

        // create constraints
        System.out.println("* Creating and adding constraints...");

        // create and add constraint a = b + c
        System.out.println("  adding a = b + c");
        solver.add(context.mkEq(a, context.mkBVAdd(b, c)));
        solver.push();

        // overflow is not detected
        System.out.println("* Adding b = 8, c = 8 and solving...");

        solver.add(context.mkEq(b, context.mkBV(8, 4)));
        solver.add(context.mkEq(c, context.mkBV(8, 4)));

        System.out.println("   solving...");
        solveAndPrint(solver, a);

        solver.pop();

        // adding supp. variables to verify overflow
        System.out.println("* Using variables of size n + 1 to check overflow");
        System.out.print("  creating 3 BV variables of size 5 (4 + 1)...");

        BitVecExpr sa = context.mkBVConst("sa", 5);
        BitVecExpr sb = context.mkBVConst("sb", 5);
        BitVecExpr sc = context.mkBVConst("sc", 5);

        System.out.println(" OK");

        System.out.println("  adding sb = sign_extend(1, b) and sc = sign_extend(1, c)");
        solver.add(context.mkEq(sb, context.mkSignExt(1, b)));
        solver.add(context.mkEq(sc, context.mkSignExt(1, c)));

        System.out.println("  adding sa = sb + sc ");
        solver.add(context.mkEq(sa, context.mkBVAdd(sb, sc)));

        System.out.println("  adding sa != sign_extend(1, a)");
        solver.add(context.mkNot(context.mkEq(sa, context.mkSignExt(1, a))));
        solver.push();

        System.out.println("* Trying on a case without overflow");
        solver.add(context.mkEq(b, context.mkBV(2, 4)));
        solver.add(context.mkEq(c, context.mkBV(3, 4)));

        checkOverflow(solver, a, sa);

        solver.pop();

        System.out.println("* Trying on a case with overflow");
        solver.add(context.mkEq(b, context.mkBV(8, 4)));
        solver.add(context.mkEq(c, context.mkBV(8, 4)));

        checkOverflow(solver, a, sa);
    }
}
