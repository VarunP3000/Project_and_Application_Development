package com.company;

import java.awt.*;
import java.lang.*;


public class Main {

    public static void main(String[] args) {
        //Step 1) Test your DrawingPanel panel and ability to create and display a point as a logical first step

        DrawingPanel testPanel = new DrawingPanel(200, 200);
        Point testPoint = new Point(50, 50);
        System.out.println(testPoint);
        Graphics gTest = testPanel.getGraphics();
        gTest.setColor(Color.RED);
        gTest.fillRect(testPoint.getX(), testPoint.getY(), 20, 20);
        //Comment the code above^ out (lines 12-17) out or delete when done with the initial test..

        //Step 2) Create your own classes to make the following code display and print the coordinates of a bouncing ball
//        Point p = new Point(50,125);// STARTING POSITION FOR BALL
//        Ball b = new Ball(10, p, 10, 130);  	// radius, a Point p, speed, direction (degrees)
//        Point p1 = new Point(0,500);//UPPER LEFT POINT IN OUR BOX
//        Point p2 = new Point (500,0);//LOWER RIGHT POINT IN OUR BOX
//        Container box = new Container(p1,p2); // upper left and lower right corner points
//        System.out.println("container is " + box.getWidth() +"/" +box.getHeight());
//        DrawingPanel dp = new DrawingPanel(box.getWidth(), box.getHeight());
//        dp.setBackground(Color.WHITE);
//        Graphics g = dp.getGraphics();
//        //b.setXY(10,25);  // optional, just makes it easier to set both x and y
//        while (true) {
//            b.move();
//            box.collidesWith(b);
//            g.setColor(Color.blue);
//            g.fillOval(b.p.getX(), b.p.getY(), b.getRadius(),b.getRadius());
//            System.out.println(b); 	// prints "Ball at (x, y) of velocity (Δx, Δy)"
//            try {
//                Thread.sleep(100);
//                g.setColor(Color.white);
//                g.fillRect(b.p.getX(), b.p.getY(), b.getRadius(),b.getRadius());// wait 50ms to move at 20 frames/second
//            } catch (Exception e) {
//                System.out.println(e);
//            }
//        }
    }
}
