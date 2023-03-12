/*
* To change this license header, choose License Headers in Project
Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package com.company;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;
import java.lang.*;
public class Main {
    public static boolean isRunning = true;
    public static void main(String[] args) throws FileNotFoundException {
        System.out.println("Welcome to our calculator project.");
        Scanner sc = new Scanner(System.in);
        startCalc(sc);
        //testCalc(); // testCalc will call calculate(String s) method that you create
        System.out.println("Goodbye!");
    }
    public static void startCalc(Scanner sc) {
        while(isRunning = true) { //starts driver loop
            System.out.println("Type in your equation, or type quit to  exit."); //asks for equation
                    String s = sc.nextLine(); //receive user input
            if (calculate(s).equalsIgnoreCase("quit")) { //if the method calculate returns quit, end the program, else print result
                break;
            } else {
                System.out.println(s + " = " + calculate(s) ); //call calculate to determine operation and
            }
        }
    }
    public static String calculate(String s) {
        Scanner sc2 = new Scanner(s); //initializes scanner for tokenizing
        double num1 = 0; //initializes the first number
        double num2 = 0; //initializes the first number
        String operator = ""; //initializes operator
        int counter = 0; //counter for type of operation (one number or two numbers)
        if (s.equalsIgnoreCase("quit")) { //checks if user input is quit
            isRunning = false; //stops so it does not repeat
            return "quit"; //return quit to break program
        }
        if (sc2.hasNextDouble()) { //if the equation has the first double store it and add 1 to counter
            num1 = sc2.nextDouble(); //store double
            counter++; //counter allows program to determine type of equation
        }
        if (sc2.hasNext()) { //get operator
            operator = sc2.next();
        }
        if (sc2.hasNextDouble()) { //if it has the second number store, else return error.
                    num2 = sc2.nextDouble(); //store num2
            counter++; //add to counter to determine 1 or 2 number operation
        } else {
            return "ERROR"; //error if there is no second number because it's required for 1 and 2 number operations
        }
        if (counter == 2) { //if both number are present check for these operators, else return error
            if (operator.equals("+")) { //checks if the equation is addition and if it is call method to add
                return add(num1, num2);
            } else if (operator.equals("*")) { //checks if the equation is multiplication and if it is call method to multiply
                return multiply(num1, num2);
            } else if (operator.equals("-")) { //checks if the equation subtraction and if it is call method to subtract
                return subtract(num1, num2);
            } else if (operator.equals("/")) { //checks if the equation is division and if it is call method to divide
                return divide(num1, num2);
            } else if (operator.equals("%")) { //checks if the equation is modulus and if it is call method to modulo
                return modulus(num1, num2);
            } else if (operator.equals("^")) { //checks if the equation is an exponent and exponent it out
                return exponent(num1, num2);
            }
        }
        if (counter == 1) { //if only num2 is present check for the 1 number operations, else return an error
            if (operator.equals("c")) { //checks if the equation is cosine and if it is call method to cosine
                return cosine(num2);
            } else if (operator.equals("|")) { //checks if the equation is an aboslute value and calls method perform absolute value
                return absoluteValue(num2);
            } else if (operator.equals("v")) { //checks if equation is square root and calls method to square root the number
                return squareRoot(num2);
            } else if (operator.equals("~")) { //checks if number needs to be rounded and calls round method
                return round(num2);
            } else if (operator.equals("s")) { //check if operation is sine and calls method to sine
                return sine(num2);
            } else if (operator.equals("t")) { //checks if operation is tangent and calls method to tangent
                return tan(num2);
            } else {
                return "ERROR";
            }
        } else {
            return "ERROR";
        }
    }
    //different methods for different operations
    public static String add(double num1, double num2) {
        double finalNumber = num1+num2;
        String number =String.valueOf(finalNumber); //gets value of final number and converts it to a string
        return number;
    }
    public static String multiply(double num1, double num2) {
        double finalNumber = num1*num2;
        String number =String.valueOf(finalNumber); //gets value of final number and converts it to a string
        return number;
    }
    public static String subtract(double num1, double num2) {
        double finalNumber = num1-num2;
        String number =String.valueOf(finalNumber); //gets value of final number and converts it to a string
        return number;
    }
    public static String divide(double num1, double num2) {
        double finalNumber = num1/num2;
        String number =String.valueOf(finalNumber); //gets value of final number and converts it to a string
        return number;
    }
    public static String modulus(double num1, double num2) {
        double finalNumber = num1%num2;
        String number = String.valueOf(finalNumber); //gets value of final number and converts it to a string
        return number;
    }
    public static String exponent(double num1, double num2) {
        double finalNumber = Math.pow(num1, num2);
        String number =String.valueOf(finalNumber); //gets value of final number and converts it to a string
        return number;
    }
    public static String absoluteValue(double num2) {
        double finalNumber = Math.abs(num2);
        String number =String.valueOf(finalNumber); //gets value of final number and converts it to a string
        return number;
    }
    public static String squareRoot(double num2) {
        double finalNumber = Math.sqrt(num2);
        String number =String.valueOf(finalNumber); //gets value of final number and converts it to a string
        return number;
    }
    public static String round(double num2) {
        double finalNumber = Math.round(num2);
        String number =String.valueOf(finalNumber); //gets value of final number and converts it to a string
        return number;
    }
    public static String sine(double num2) {
        double finalNumber = Math.sin(num2);
        String number =String.valueOf(finalNumber); //gets value of final number and converts it to a string
        return number;
    }
    public static String cosine(double num2) {
        double finalNumber = Math.cos(num2);
        String number = String.valueOf(finalNumber); //gets value of final number and converts it to a string
        return number;
    }
    public static String tan(double num2) {
        double finalNumber = Math.tan(num2);
        String number = String.valueOf(finalNumber); //gets value of final number and converts it to a string
        return number;
    }
    public static void testCalc() throws FileNotFoundException{
        ArrayList<String> problems = new ArrayList<>();
        ArrayList<String> results = new ArrayList<>();
// load problems from a file
        File fProblems = new File("problems.txt");
        Scanner sc = new Scanner(fProblems);
        int count = 0;
        String line = "";
        int problemCount = 0;
        int resultCount = 0;
        while (sc.hasNextLine()){
            line = sc.nextLine();
            if (!line.startsWith("//") && !line.trim().equals("")){
// ignore comments at the beginning
                problems.add(line.substring(3).trim());
                problemCount++;
                if (sc.hasNextLine()){
                    line = sc.nextLine();
                    if (!line.startsWith("//") &&
                            !line.trim().equals("")){
                        results.add(line.substring(3).trim());
                        resultCount++;
                    }
                }
                count++;
            }
        }
        if (problemCount == resultCount){
// now run the tests
            for (int i=0; i<problemCount; i++){
                String prob = problems.get(i);
                String result = calculate(prob);
                if (result == null){
                    System.out.println("FAILED test " + i);
                    System.out.println("Expression: " + problems.get(i));
                    System.out.println("Expected result: " +
                            results.get(i));
                    System.out.println("Actual: null String returned from  calculate()");
                } else {
                    if (result.equals(results.get(i))){
                        System.out.println("PASSED test " + i);
                    } else {
                        System.out.println("FAILED test " + i);
                        System.out.println("Expression: " +
                                problems.get(i));
                        System.out.println("Expected result: " +
                                results.get(i));
                        System.out.println("Actual: " + result);
                    }
                }
            }
        } else {
            System.out.println("problem file error");
        }
    }
}