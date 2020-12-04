package TP5;

@Utility
public class WrongUtilityClass {

    WrongUtilityClass(int c) { }
    private WrongUtilityClass(String s) { }
    protected WrongUtilityClass() { }

    public static void m1() { System.out.println("m1"); }
    public static void m2() { System.out.println("m2"); }
    private void m3() { System.out.println("m3"); }

    class InternalClass {
        int i;
    }

    static class StaticInternalClass {
        int i;
    }

    int attr;
    static String name;
}
