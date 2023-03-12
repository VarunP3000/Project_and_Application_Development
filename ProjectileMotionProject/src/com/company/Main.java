package com.company;
import java.awt.*;
import java.util.Scanner;
public class Main {
    public static void main(String args[]) {
        double angle = getAngle();
        double velocity = getVelocity();
        fireProjectile(angle, velocity);
    }

    public static double getAngle() {
        Scanner Angle = new Scanner(System.in);
        System.out.println("Input an angle:");
        double a = Angle.nextInt();
        double c = Math.toRadians(a);
        return c;
    }

    public static double getVelocity() {
        Scanner Velocity = new Scanner(System.in);
        System.out.println("Input a velocity:");
        double b = Velocity.nextDouble();
        return b;
    }

    public static void fireProjectile(double angle, double velocity) {
        double Vx = (velocity * Math.cos(angle));
        double Vy = (velocity * Math.sin(angle));
        System.out.println(Vx + "," + Vy);
        Scanner Steps = new Scanner(System.in);
        System.out.print("How many steps do you want?");
        double Ts = Steps.nextDouble();
        double Tf = ((2 * Vy) / 9.81);
        double n = Tf / Ts;
        DrawingPanel panel = new DrawingPanel(1000, 1000);
        panel.setBackground(Color.WHITE);
        for (int i = 0; i <= Ts; i++) {
            int x = (int) (Vx * i * n);
            int y = (int) (1000 - ((Vy * i * n) + (0.5 * -9.81 * i * n * i *
                    n)));
            System.out.println(x + "," + y);
            Graphics g = panel.getGraphics();
            g.setColor(Color.BLUE);
            g.fillOval(x, y, 10, 10);
            panel.sleep(600);
        }
    }
}

