package com.company;

public class Boxing extends Player {

    private int Height;
    private int Weight;
    private int PunchStrength;
    private int MatchesFought;
    private int MatchesWon;

    public Boxing(String Name, int Salary, String Team, int Height, int Weight, int PunchStrength, int MatchesFought, int MatchesWon){
        super(Name, Salary, Team);
        this.Height = Height;
        this.Weight = Weight;
        this.PunchStrength = PunchStrength;
        this.MatchesFought = MatchesFought;
        this.MatchesWon = MatchesWon;
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

    public int getHeight() {
        return Height;
    }

    public int getMatchesFought() {
        return MatchesFought;
    }

    public int getMatchesWon() {
        return MatchesWon;
    }

    public int getWeight() {
        return Weight;
    }

    public int getPunchStrength() {
        return PunchStrength;
    }

    public double GetWinRate(){
        double matcheswon = MatchesWon;
        double matchesfought = MatchesFought;
        double winrate = (matcheswon/matchesfought);
        double Winrate = (winrate*100) - ((winrate*100)%(0.1));
        return Winrate;
    }
}
