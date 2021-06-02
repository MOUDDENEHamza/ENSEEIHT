package fr.n7.smt;

public class Main {

    static int[][] nums = {
        {10, 20, 30, 40},
        {3, 4, 6, 10, 12, 78, 89, 560},
        {2, 3, 4, 5, 11, 12, 47, 121, 157, 236, 447, 508},
        {8, 10, 2, 1, 5, 50}
    };

    static int[][] target = {
        {120, 119},
        {6176},
        {549, 849},
        {899}
    };

    static boolean[] noOverflows = {false, true};
    static int[] bvBits          = {8, 14};
    static int timeout           = 10_000; // en millisecondes

    public static void runTest(int[] nums, int target, int bvBits, boolean noOverflows, int timeout) {
        System.out.println("\n\n====================== TEST ==========================");
        Chiffres chiffresSolver = new Chiffres(nums, target, bvBits, noOverflows);
        try {
            chiffresSolver.solve(timeout);
        } catch (Throwable t) {
            System.out.println("failed with error:");
            System.out.println(t);
        }
    }

    public static void testAll() {
        for (int _bvBits : bvBits) {
            for (boolean _noOverflows : noOverflows) {
                for (int i = 0; i < nums.length; i++) {
                    int[] _nums = nums[i];
                    for (int _target : target[i]) {
                        runTest(_nums, _target, _bvBits, _noOverflows, timeout);
                    }
                }
            }
        }
    }

    public static void testSimple() {
        runTest(nums[0], target[0][0], 8, false, timeout);
        runTest(nums[0], target[0][1], 8, false, timeout);
        runTest(nums[0], target[0][0], 14, false, timeout);
        runTest(nums[0], target[0][1], 14, false, timeout);
    }

    public static void main(String[] args) {
        testSimple();
        testAll();
    }
}
