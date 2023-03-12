package com.company;

public class Point {
    private int x;
    private int y;

    public Point(int x, int y) {
        setLocation(x, y);
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public void setLocation(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public void translate(int dx, int dy) {
        setLocation(x + dx, y + dy);
    }

    public String toString() {
        return "{" + x + "," + y + "}";
    }
}
