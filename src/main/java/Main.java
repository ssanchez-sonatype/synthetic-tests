package main.java;

import java.io.BufferedReader;
import java.io.FileReader;

public class Main {

    public static void main(String[] args) throws Exception {

        BufferedReader reader = null;

        try {

            reader = new BufferedReader(new FileReader("/foo/bar/DukesDiary.txt"));
            String taint = reader.readLine();
            MyWriter.writeValue(taint);

        } catch (Exception e) {

            if (reader != null) {
                reader.close();
            }
        }
    }
}
