package fr.n7.smt;

import java.util.*;
import com.microsoft.z3.*;

class SimpleArrayProblem {
    public static void main(String[] args) {
        HashMap<String, String> cfg = new HashMap<String, String>();
        cfg.put("model", "true");
        cfg.put("proof", "true");

        Context context = new Context(cfg);
        Solver  solver  = context.mkSolver();

        // create a variable representing an array of integers
        System.out.print("* Creating a variable for an array of bitvectors of size 8 indexed by Int...");
        BitVecSort bvSort = context.mkBitVecSort(8);

        ArrayExpr my_array_v = context.mkArrayConst("my_array_v",
                                                    context.getIntSort(),
                                                    bvSort);

        System.out.println(" OK");

        // add constraints representing updates on the array
        System.out.println("* Adding constraints representing operations on the array...");
        System.out.println("  my_array_v[0] = 1");
        solver.add(context.mkEq(context.mkSelect(my_array_v,
                                                 context.mkInt(0)),
                                context.mkBV(1, 8)));

        System.out.println("  my_array_v[1] = 2");
        solver.add(context.mkEq(context.mkSelect(my_array_v,
                                                 context.mkInt(1)),
                                context.mkBV(2, 8)));

        System.out.println("  update my_array_v[1] to 5");
        ArrayExpr my_array_v_up1 = context.mkArrayConst("my_array_v_up1",
                                                        context.getIntSort(),
                                                        bvSort);
        solver.add(context.mkEq(my_array_v_up1,
                                context.mkStore(my_array_v,
                                                context.mkInt(1),
                                                context.mkBV(5, 8))));

        System.out.println("  update my_array_v[2] to 42");
        ArrayExpr my_array_v_up2 = context.mkArrayConst("my_array_v_up2",
                                                        context.getIntSort(),
                                                        bvSort);
        solver.add(context.mkEq(my_array_v_up2,
                                context.mkStore(my_array_v_up1,
                                                context.mkInt(2),
                                                context.mkBV(42, 8))));

        System.out.println("  now my_array_v[3] = 2 * my_array_v[2]");
        solver.add(context.mkEq(context.mkSelect(my_array_v_up2,
                                                 context.mkInt(3)),
                                context.mkBVMul(context.mkBV(2, 8),
                                                (BitVecExpr) context.mkSelect(my_array_v_up2,
                                                                              context.mkInt(2)))));

        System.out.println("  now my_array_v[j] = my_array_v[1]");
        ArithExpr j = context.mkIntConst("j");
        solver.add(context.mkEq(context.mkSelect(my_array_v_up2,
                                                 context.mkInt(1)),
                                context.mkSelect(my_array_v_up2, j)));
        solver.add(context.mkNot(context.mkEq(j, context.mkInt(1))));

        // adding constants to get values in arrays
        BitVecExpr my_array_v_bv[] = new BitVecExpr[4];

        for (int i = 0; i < 4; i++) {
            my_array_v_bv[i] = context.mkBVConst("my_array_v[" + i + "]", 8);
            solver.add(context.mkEq(my_array_v_bv[i], context.mkSelect(my_array_v,
                                                                       context.mkInt(i))));
        }

        BitVecExpr my_array_v_up2_bv[] = new BitVecExpr[5];

        for (int i = 0; i < 4; i++) {
            my_array_v_up2_bv[i] = context.mkBVConst("my_array_v_up2[" + i + "]", 8);
            solver.add(context.mkEq(my_array_v_up2_bv[i], context.mkSelect(my_array_v_up2,
                                                                           context.mkInt(i))));
        }

        BitVecExpr my_array_v_up2_bv_j = context.mkBVConst("my_array_v_up2[j]", 8);
        solver.add(context.mkEq(my_array_v_up2_bv_j, context.mkSelect(my_array_v_up2, j)));

        // check problem
        System.out.println("* Solving problem and printing model...");
        if (solver.check() == Status.SATISFIABLE) {
            System.out.println("  Problem is SAT!");

            Model m = solver.getModel();

            for (int i = 0; i < 4; i++) {
                System.out.println("  - value of " + my_array_v_bv[i].toString() + ": " +
                                   m.getConstInterp(my_array_v_bv[i]));
            }

            for (int i = 0; i < 4; i++) {
                System.out.println("  - value of " + my_array_v_up2_bv[i].toString() + ": " +
                                   m.getConstInterp(my_array_v_up2_bv[i]));
            }

            System.out.println("  - value of j: " + m.getConstInterp(j));
            System.out.println("  - value of my_array_v_up2[j]: " + m.getConstInterp(my_array_v_up2_bv_j));
        } else {
            System.out.println("  UNSAT or UNKNOWN problem!");
        }        solver.check();


    }
}
