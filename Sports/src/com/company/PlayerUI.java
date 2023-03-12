package com.company;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class PlayerUI {
    private JButton BoxingButton;
    private JButton trackButton;
    private JButton soccerButton;
    private JTextField SoccerName;
    private JTextField SoccerTeam;
    private JTextField SoccerSalary;
    private JTextField SoccerDribbleSpeed;
    private JTextField SoccerSpeed;
    private JTextField SoccerPassStrength;
    private JTextField SoccerShotStrength;
    private JTextField SoccerShotsTaken;
    private JTextField SoccerGoals;
    private JTextField SoccerNumber;
    private JTextField TrackAndCrosscountryName;
    private JTextField TrackAndCrosscountryTeam;
    private JTextField TrackAndCrosscountrySalary;
    private JTextField TrackAndCrosscountryJumpHeight;
    private JTextField TrackAndCrosscountryTempoSpeed;
    private JTextField TrackAndCrosscountryFastestSpeed;
    private JTextField TrackAndCrosscountryDistanceSpeed;
    private JTextField TrackAndCrosscountryNumber;
    private JTextField BoxingName;
    private JTextField BoxingSalary;
    private JTextField BoxingTeam;
    private JTextField BoxingHeight;
    private JTextField BoxingWeight;
    private JTextField BoxingPunchStrength;
    private JTextField BoxingMatchesFought;
    private JTextField BoxingMatchesWon;
    private JPanel TrackandCrossCountry;
    private JPanel HomePage;
    private JPanel SoccerPanel;
    private JPanel BoxingPanel;
    private JButton SoccerResetButton;
    private JButton SoccerSaveButton;
    private JButton BoxingResetButton;
    private JButton BoxingSaveButton;
    private JButton TrackResetButton;
    private JButton TrackandCrosscountrySaveButton;
    private JPanel SoccerResults;
    private JPanel TrackandCrosscountry;
    private JPanel BoxingResults;
    private JPanel Player;
    private JLabel SName;
    private JLabel Steam;
    private JLabel SSalary;
    private JLabel SDribbleSpeed;
    private JLabel SSpeed;
    private JLabel SPassStrength;
    private JLabel SShotStrength;
    private JLabel SShotsTaken;
    private JLabel SGoals;
    private JLabel SNumber;
    private JLabel TName;
    private JLabel TTeam;
    private JLabel TSalary;
    private JLabel TJumpHeight;
    private JLabel TTempoSpeed;
    private JLabel TFastestSpeed;
    private JLabel TDistanceSpeed;
    private JLabel TNumber;
    private JLabel BName;
    private JLabel BSalary;
    private JLabel BTeam;
    private JLabel BHeight;
    private JLabel BWeight;
    private JLabel BPunchStrength;
    private JLabel BMatchesFought;
    private JLabel BMatchesWon;
    private JButton exitSoccer;
    private JLabel accuracySoccer;
    private JButton exitBoxing;
    private JButton exitTrack;
    private JLabel BoxingWinRate;
    private JLabel SoccerError;
    private JLabel TrackError;
    private JLabel BoxingError;
    private JLabel HundredMeter;
    private JLabel TwoHundredMeter;
    private JLabel FourHundredMeter;
    private JLabel EightHundredMeter;
    private JLabel SixteenHundredMeter;
    private JLabel ThirtyTwoHundredMeter;
    private JLabel FiveKilometer;

    public PlayerUI() {
        HomePage.setVisible(true);
        SoccerPanel.setVisible(false);
        TrackandCrossCountry.setVisible(false);
        BoxingPanel.setVisible(false);
        soccerButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                HomePage.setVisible(false);
                SoccerPanel.setVisible(true);
                TrackandCrossCountry.setVisible(false);
                BoxingPanel.setVisible(false);
                accuracySoccer.setVisible(false);
                exitSoccer.setVisible(true);
                SoccerError.setVisible(false);
            }
        });
        trackButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                HomePage.setVisible(false);
                SoccerPanel.setVisible(false);
                TrackandCrossCountry.setVisible(true);
                BoxingPanel.setVisible(false);
                exitTrack.setVisible(true);
                TrackError.setVisible(false);
                HundredMeter.setVisible(true);
                TwoHundredMeter.setVisible(true);
                FourHundredMeter.setVisible(true);
                EightHundredMeter.setVisible(true);
                SixteenHundredMeter.setVisible(true);
                ThirtyTwoHundredMeter.setVisible(true);
                FiveKilometer.setVisible(true);
            }
        });
        BoxingButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                HomePage.setVisible(false);
                SoccerPanel.setVisible(false);
                TrackandCrossCountry.setVisible(false);
                BoxingPanel.setVisible(true);
                exitBoxing.setVisible(true);
                BoxingWinRate.setVisible(false);
                BoxingError.setVisible(false);
            }
        });

        SoccerResetButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                SoccerGoals.setText("");
                SoccerDribbleSpeed.setText("");
                SoccerName.setText("");
                SoccerPassStrength.setText("");
                SoccerNumber.setText("");
                SoccerSalary.setText("");
                SoccerShotsTaken.setText("");
                SoccerShotStrength.setText("");
                SoccerSpeed.setText("");
                SoccerTeam.setText("");
            }
        });
        TrackResetButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                TrackAndCrosscountryDistanceSpeed.setText("");
                TrackAndCrosscountryFastestSpeed.setText("");
                TrackAndCrosscountryJumpHeight.setText("");
                TrackAndCrosscountryName.setText("");
                TrackAndCrosscountryNumber.setText("");
                TrackAndCrosscountrySalary.setText("");
                TrackAndCrosscountryTeam.setText("");
                TrackAndCrosscountryTempoSpeed.setText("");
                HundredMeter.setText("100:");
                TwoHundredMeter.setText("200:");
                FourHundredMeter.setText("400:");
                EightHundredMeter.setText("800:");
                SixteenHundredMeter.setText("1600:");
                ThirtyTwoHundredMeter.setText("3200:");
                FiveKilometer.setText("5000:");
            }
        });
        BoxingResetButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                BoxingName.setText("");
                BoxingHeight.setText("");
                BoxingMatchesFought.setText("");
                BoxingPunchStrength.setText("");
                BoxingMatchesWon.setText("");
                BoxingSalary.setText("");
                BoxingTeam.setText("");
                BoxingWeight.setText("");
            }
        });
        SoccerSaveButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String name = SoccerName.getText();
                String team = SoccerTeam.getText();
                String salary = SoccerSalary.getText();
                String DribbleSpeed = SoccerDribbleSpeed.getText();
                String Speed = SoccerSpeed.getText();
                String PassStrength = SoccerPassStrength.getText();
                String ShotStrength = SoccerShotStrength.getText();
                String ShotsTaken = SoccerShotsTaken.getText();
                String Goals = SoccerGoals.getText();
                String Number = SoccerNumber.getText();
                if(salary.matches("-?\\d+")&&DribbleSpeed.matches("-?\\d+")&&Speed.matches("-?\\d+")&&PassStrength.matches("-?\\d+")&&ShotStrength.matches("-?\\d+")&&ShotsTaken.matches("-?\\d+")&&Goals.matches("-?\\d+")&&Number.matches("-?\\d+")){
                    int realSalary = Integer.parseInt(salary);
                    int realDribbleSpeed = Integer.parseInt(DribbleSpeed);
                    int realSpeed = Integer.parseInt(Speed);
                    int realPassStrength = Integer.parseInt(PassStrength);
                    int realShotStrength = Integer.parseInt(ShotStrength);
                    int realShotsTaken = Integer.parseInt(ShotsTaken);
                    int realGoals = Integer.parseInt(Goals);
                    int realNumber = Integer.parseInt(Number);
                    Soccer player1 = new Soccer(name, realSalary, realNumber, team, realSpeed, realPassStrength, realShotStrength, realDribbleSpeed, realShotsTaken, realGoals);
                    accuracySoccer.setText("Accuracy:" + player1.FindAccuracy() + "%");
                    accuracySoccer.setVisible(true);
                } else {
                    SoccerError.setVisible(true);
                }
            }
        });
        TrackandCrosscountrySaveButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String Name = TrackAndCrosscountryName.getText();
                String Salary = TrackAndCrosscountrySalary.getText();
                String Team = TrackAndCrosscountryTeam.getText();
                String TempoSpeed = TrackAndCrosscountryTempoSpeed.getText();
                String JumpHeight = TrackAndCrosscountryJumpHeight.getText();
                String FastestSpeed = TrackAndCrosscountryFastestSpeed.getText();
                String Number = TrackAndCrosscountryNumber.getText();
                String DistanceSpeed = TrackAndCrosscountryDistanceSpeed.getText();
                if(Salary.matches("-?\\d+")&&TempoSpeed.matches("-?\\d+")&&JumpHeight.matches("-?\\d+")&&FastestSpeed.matches("-?\\d+")&&Number.matches("-?\\d+")&&DistanceSpeed.matches("-?\\d+")){
                    int realSalary = Integer.parseInt(Salary);
                    int realTempoSpeed = Integer.parseInt(TempoSpeed);
                    int realFastestSpeed = Integer.parseInt(FastestSpeed);
                    int realNumber = Integer.parseInt(Number);
                    int realDistanceSpeed = Integer.parseInt(DistanceSpeed);
                    int realJumpHeight = Integer.parseInt(JumpHeight);
                    TrackAndCrosscountry runner1 = new TrackAndCrosscountry(Name, realSalary, realNumber, Team, realTempoSpeed, realJumpHeight, realFastestSpeed, realDistanceSpeed);
                    HundredMeter.setText("100 "+runner1.predictedHundred());
                    TwoHundredMeter.setText("200 "+runner1.predictedTwoHundred());
                    FourHundredMeter.setText("400 "+runner1.predictedFourHundred());
                    EightHundredMeter.setText("800 "+runner1.predictedEightHundred());
                    SixteenHundredMeter.setText("1600 "+runner1.predictedSixteenHundred());
                    ThirtyTwoHundredMeter.setText("3200 "+runner1.predictedThirtyTwoHundred());
                    FiveKilometer.setText("5000: "+runner1.predictedFiveKilometer());
                } else{
                    TrackError.setVisible(true);
                }
            }
        });
        BoxingSaveButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String Name = BoxingName.getText();
                String Salary = BoxingSalary.getText();
                String Team = BoxingTeam.getText();
                String Height = BoxingHeight.getText();
                String Weight = BoxingWeight.getText();
                String PunchStrength = BoxingPunchStrength.getText();
                String MatchesFought = BoxingMatchesFought.getText();
                String MatchesWon = BoxingMatchesWon.getText();
                if(MatchesWon.matches("-?\\d+")&&Salary.matches("-?\\d+")&&Height.matches("-?\\d+")&&Weight.matches("-?\\d+")&&PunchStrength.matches("-?\\d+")&&MatchesFought.matches("-?\\d+")){
                    int realSalary = Integer.parseInt(Salary);
                    int realHeight = Integer.parseInt(Height);
                    int realWeight = Integer.parseInt(Weight);
                    int realPunchStrength = Integer.parseInt(PunchStrength);
                    int realMatchesFought = Integer.parseInt(MatchesFought);
                    int realMatchesWon = Integer.parseInt(MatchesWon);
                    Boxing Boxer1 = new Boxing(Name, realSalary, Team, realHeight, realWeight, realPunchStrength, realMatchesFought, realMatchesWon);
                    BoxingWinRate.setText("Win Rate:" + Boxer1.GetWinRate() + "%");
                    BoxingWinRate.setVisible(true);
                } else {
                    BoxingError.setVisible(true);
                }
            }
        });
        exitSoccer.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                HomePage.setVisible(true);
                SoccerPanel.setVisible(false);
                TrackandCrossCountry.setVisible(false);
                BoxingPanel.setVisible(false);
                SoccerGoals.setText("");
                SoccerDribbleSpeed.setText("");
                SoccerName.setText("");
                SoccerPassStrength.setText("");
                SoccerNumber.setText("");
                SoccerSalary.setText("");
                SoccerShotsTaken.setText("");
                SoccerShotStrength.setText("");
                SoccerSpeed.setText("");
                SoccerTeam.setText("");
                accuracySoccer.setText("");
                accuracySoccer.setVisible(true);
            }
        });
        exitTrack.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                HomePage.setVisible(true);
                SoccerPanel.setVisible(false);
                TrackandCrossCountry.setVisible(false);
                BoxingPanel.setVisible(false);
                TrackAndCrosscountryDistanceSpeed.setText("");
                TrackAndCrosscountryFastestSpeed.setText("");
                TrackAndCrosscountryJumpHeight.setText("");
                TrackAndCrosscountryName.setText("");
                TrackAndCrosscountryNumber.setText("");
                TrackAndCrosscountrySalary.setText("");
                TrackAndCrosscountryTeam.setText("");
                TrackAndCrosscountryTempoSpeed.setText("");
                HundredMeter.setText("100:");
                TwoHundredMeter.setText("200:");
                FourHundredMeter.setText("400:");
                EightHundredMeter.setText("800:");
                SixteenHundredMeter.setText("1600:");
                ThirtyTwoHundredMeter.setText("3200:");
                FiveKilometer.setText("5000:");
            }
        });
        exitBoxing.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                HomePage.setVisible(true);
                SoccerPanel.setVisible(false);
                TrackandCrossCountry.setVisible(false);
                BoxingPanel.setVisible(false);
                BoxingName.setText("");
                BoxingHeight.setText("");
                BoxingMatchesFought.setText("");
                BoxingPunchStrength.setText("");
                BoxingMatchesWon.setText("");
                BoxingSalary.setText("");
                BoxingTeam.setText("");
                BoxingWeight.setText("");
                BoxingWinRate.setVisible(false);
                BoxingWinRate.setText("");
            }
        });
    }
    public JPanel getPlayer(){
        return Player;
    }

}
