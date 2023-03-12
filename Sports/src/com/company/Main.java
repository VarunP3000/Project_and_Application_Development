package com.company;

import javax.swing.*;

public class Main {

    public static void main(String[] args) {
        JFrame uiplayer1 = new JFrame("uip");
        uiplayer1.setContentPane(new PlayerUI().getPlayer());
        uiplayer1.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        uiplayer1.setVisible(true);
    }
}
