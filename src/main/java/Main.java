package main.java;

import java.io.BufferedReader;
import java.io.FileReader;

public class Main {

    public static void main(String[] args) throws Exception {


        FileReader fileReader = null;
        BufferReader reader = null;

        try {

            fileReader = new FileReader("/foo/bar/DukesDiary.txt");
            reader = new BufferedReader(fileReader)
            String taint = reader.readLine();
            MyWriter.writeValue(taint);

        } catch (Exception e) {

            if (fileReader != null) {
                fileReader.close();
            }

            if (reader != null) {
                reader.close();
            }
        }
    }
}
