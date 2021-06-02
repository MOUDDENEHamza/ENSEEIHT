package fr.n7.sat;

import java.io.*;
import com.microsoft.z3.*;

class Sudoku {

    static Sudoku loadSudoku(String filename, boolean logEnabled) throws IOException {
        BufferedReader br = new BufferedReader(new FileReader(filename));

        // first line contains dimension
        String line   = br.readLine();
        int    n      = Integer.parseInt(line);
        Sudoku sudoku = new Sudoku(); // you should use YOUR
                                      // constructor here!

        // parse each line
        int i = 0;

        while ((line = br.readLine()) != null) {
            String values[] = line.split(",");

            for (int j = 0; j < values.length; j++) {
                if (! values[j].equals("")) {
                    System.out.println("found value " + values[j] +
                                       " at position (" + i + ", " + j + ")");
                    // you should add the value in your Sudoku here!
                }
            }

            i++;
        }

        br.close();

        return sudoku;
    }

}
