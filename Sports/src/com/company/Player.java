package com.company;
import java.awt.*;
public class Player {

    private String Name;
    private int Salary;
    private String Team;

    public Player(String Name, int Salary, String Team){
        this.Name = Name;
        this.Salary = Salary;
        this.Team = Team;
    }

    public int getSalary() {
        return Salary;
    }

    public String getName() {
        return Name;
    }

    public String getTeam(){
        return Team;
    }



}
