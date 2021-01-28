package main.java;

import java.io.PrintWriter;

class MyWriter {

    static void writeValue(String value) {

        PrintWriter writer = new PrintWriter(System.out);
        writer.write(value);
    }
}
