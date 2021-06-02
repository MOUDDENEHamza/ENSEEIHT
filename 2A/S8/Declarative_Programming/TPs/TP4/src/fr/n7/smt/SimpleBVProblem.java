package fr.n7.smt;

import java.util.*;
import com.microsoft.z3.*;

class SimpleBVProblem {
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

        // create and add constraint a > b + 2
        System.out.print("  creating a > b + 2: ");
        BoolExpr c1 = context.mkBVSGT(a, context.mkBVAdd(b, context.mkBV(2, 4)));
        solver.add(c1);
        System.out.println(c1);

        // create and add constraint a = 2 * c + 10
        System.out.print("  creating a = 2 * c + 10: ");
        BoolExpr c2 = context.mkEq(a,
                                   context.mkBVAdd(context.mkBVMul(c, context.mkBV(2, 4)),
                                                   context.mkBV(10, 4)));
        solver.add(c2);
        System.out.println(c2);

        // create and add constraint b + c <= 10
        System.out.print("  creating b + c <= 10: ");
        BoolExpr c3 = context.mkBVSLE(context.mkBVAdd(b, c),
                                      context.mkBV(10, 4));
        solver.add(c3);
        System.out.println(c3);

        // check problem
        System.out.println("* Solving problem and printing model...");
        if (solver.check() == Status.SATISFIABLE) {
            System.out.println("  Problem is SAT!");

            Model m = solver.getModel();

            System.out.println("  - value of a: " + m.getConstInterp(a));
            System.out.println("  - value of b: " + m.getConstInterp(b));
            System.out.println("  - value of c: " + m.getConstInterp(c));
        } else {
            System.out.println("  UNSAT or UNKNOWN problem!");
        }
    }
}
