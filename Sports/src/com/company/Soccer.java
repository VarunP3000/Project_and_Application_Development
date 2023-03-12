package com.company;
public class Soccer extends Player {

    private int Speed;
    private int PassStrength;
    private int ShotStrength;
    private int DribbleSpeed;
    private int ShotsTaken;
    private int Goals;
    private int Number;

    public Soccer(String Name, int Salary, int Number, String Team, int Speed, int PassStrength, int ShotStrength, int DribbleSpeed, int ShotsTaken, int Goals){
        super(Name, Salary, Team);
        this.Speed = Speed;
        this.PassStrength = PassStrength;
        this.ShotStrength = ShotStrength;
        this.DribbleSpeed = DribbleSpeed;
        this.ShotsTaken = ShotsTaken;
        this.Goals = Goals;
        this.Number = Number;
    }

    public int getNumber() {
        return Number;
    }

    @Override
    public int getSalary() {
        return super.getSalary();
    }

    @Override
    public String getName() {
        return super.getName();
    }

    @Override
    public String getTeam() {
        return super.getTeam();
    }

    public int getDribbleSpeed() {
        return DribbleSpeed;
    }

    public int getPassStrength() {
        return PassStrength;
    }

    public int getShotStrength() {
        return ShotStrength;
    }

    public int getSpeed() {
        return Speed;
    }

    public int getShotsTaken() {
        return ShotsTaken;
    }

    public int getGoals() {
        return Goals;
    }

    public double FindAccuracy(){
        double accuracy = (double)Goals/ShotsTaken;
        double Accuracy = (accuracy*100) - ((accuracy*100)%(0.1));
        return Accuracy;
    }
}
