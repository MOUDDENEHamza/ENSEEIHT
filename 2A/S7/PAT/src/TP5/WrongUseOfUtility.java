package TP5;

public class WrongUseOfUtility {

    @Utility
    private WrongUseOfUtility() {}

    @Utility
    static void m(@Utility int n) {}

    @Utility
    static int a;

}
