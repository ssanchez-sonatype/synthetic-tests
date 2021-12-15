package com.java17.lift.app;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );
    }
    public abstract sealed class Shape {
    	abstract String f();
        final class Circle extends Shape { String f() { int a[] = new int[1]; return a.toString(); } }
        final class Square extends Shape { String f() { return null; } }
    }
}
