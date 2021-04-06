package io;

public class ConsoleIO implements IO {

    @Override
    public void print(String l) {
        System.out.print(l);
    }

    public int readInt() {
        return Console.readInt("Saisissez un entier :");
    }

    public boolean readBool() {
        int i;
        do {
            i = Console.readInt("Saisissez un boolean (0 pour false, 1 pour true) :");
        } while (i != 0 && i != 1);
        return (i == 1);
    }

    public char readChar() {
        return Console.readChar("Saisissez un caractère :");
    }

    public String readString() {
        return Console.readLine("Saisissez une chaîne de caractères :");
    }
}