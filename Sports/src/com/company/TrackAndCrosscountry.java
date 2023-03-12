package com.company;
public class TrackAndCrosscountry extends Player {

    private int TempoSpeed;
    private int JumpHeight;
    private int FastestSpeed;
    private int DistanceSpeed;
    private int Number;

    public TrackAndCrosscountry(String Name, int Salary, int Number, String Team, int TempoSpeed, int JumpHeight, int FastestSpeed, int DistanceSpeed) {
        super(Name, Salary, Team);
        this.TempoSpeed = TempoSpeed;
        this.JumpHeight = JumpHeight;
        this.FastestSpeed = FastestSpeed;
        this.Number = Number;
        this.DistanceSpeed = DistanceSpeed;
    }

    @Override
    public String getTeam() {
        return super.getTeam();
    }

    @Override
    public String getName() {
        return super.getName();
    }

    @Override
    public int getSalary() {
        return super.getSalary();
    }

    public int getNumber() {
        return Number;
    }

    public int getTempoSpeed() {
        return TempoSpeed;
    }

    public int getFastestSpeed() {
        return FastestSpeed;
    }

    public int getJumpHeight() {
        return JumpHeight;
    }

    public int getDistanceSpeed() {
        return DistanceSpeed;
    }

    public String predictedHundred(){
        int OneHundred = 100/FastestSpeed;
        String oneHundred = (((OneHundred-OneHundred%60)/60)+":"+OneHundred%60 + "s");
        return oneHundred;
    }

    public String predictedTwoHundred(){
        int TwoHundred = 200/FastestSpeed;
        String twoHundred = (((TwoHundred-TwoHundred%60)/60)+":"+TwoHundred%60 + "s");
        return twoHundred;
    }

    public String predictedFourHundred(){
        int FourHundred = 400/FastestSpeed;
        String fourHundred = (((FourHundred-FourHundred%60)/60)+":"+FourHundred%60 + "s");
        return fourHundred;
    }

    public String predictedEightHundred(){
        int EightHundred = 800/TempoSpeed;
        String eightHundred = (((EightHundred-EightHundred%60)/60)+":"+EightHundred%60 + "s");
        return eightHundred;
    }

    public String predictedSixteenHundred(){
        int SixteenHundred = 1600/TempoSpeed;
        String sixteenHundred = (((SixteenHundred-SixteenHundred%60)/60)+":"+SixteenHundred%60 + "s");
        return sixteenHundred;
    }

    public String predictedThirtyTwoHundred(){
        int ThirtyTwoHundred = 3200/DistanceSpeed;
        String thirtyTwoHundred = (((ThirtyTwoHundred-ThirtyTwoHundred%60)/60)+":"+ThirtyTwoHundred%60 + "s");
        return thirtyTwoHundred;
    }

    public String predictedFiveKilometer(){
        int FiveKilometer = 5000/DistanceSpeed;
        String fiveKilometer = (((FiveKilometer-FiveKilometer%60)/60)+":"+FiveKilometer%60 + "s");
        return fiveKilometer;
    }
}
