import java.util.Arrays;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner Ask1 = new Scanner(System.in);
        System.out.println("What is Player 1's name?");
        String Player1 = Ask1.nextLine();
        Scanner Ask2 = new Scanner(System.in);
        System.out.println("What is Player 2's name?");
        String Player2 = Ask2.nextLine();
        boolean examine = false;
        int Dimensions = 0;
        while(!examine){
            Scanner Ask3 = new Scanner(System.in);
            System.out.println("Dimensions?");
            Dimensions = Ask3.nextInt();
            if(Dimensions >= 3){
                examine = true;
            }
        }
        ticTacToe(Player1, Player2, Dimensions);
    }

    public static void ticTacToe(String Player1, String Player2, int Dim){
        boolean Check = false;
        String winner = "_";
        String [][] board = new String[Dim][Dim];
        for(int i = 0; i < Dim; i++){
            for(int j = 0; j < Dim; j++){
                board[i][j] = "_";
            }
        }
        int counter = 1;
        int count = 0;
        int count1 = 0;
        int count2 = 0;
        int count3 = 0;
        int count4 = 0;
        int count5 = 0;
        int count6 = 0;
        int count7 = 0;
        while(!Check){
            if(counter % 2 != 0){
                boolean spot1 = false;
                while(!spot1){
                    Scanner Ask1 = new Scanner(System.in);
                    System.out.print("Player1 X Location?");
                    int X1dimension = Ask1.nextInt();
                    Scanner Ask2 = new Scanner(System.in);
                    System.out.print("Player1 Y Location?");
                    int Y1dimension = Ask2.nextInt();
                    if(Dim<=X1dimension && Dim<=Y1dimension){
                        spot1 = false;
                    }else if(board[X1dimension][Y1dimension] != "X" && board[X1dimension][Y1dimension] != "O"){
                        spot1 = true;
                        board[X1dimension][Y1dimension] = "X";
                    }
                }
                for(int i = 0; i < Dim; i++){
                    System.out.println("");
                    for(int j = 0; j < Dim; j++){
                        System.out.print(board[i][j]);
                    }
                    System.out.println("");
                }
                int i = 0;
                count = 0;
                while(i < Dim && count < Dim){
                    count = 0;
                    for(int j = 0; j < Dim; j++){
                        if(board[i][j] == "X"){
                            count++;
                        }
                    }
                    i++;
                }
                int p = 0;
                count1 = 0;
                while(p < Dim && count1 < Dim){
                    count1 = 0;
                    for(int j = 0; j < Dim; j++){
                        if(board[j][p] == "X"){
                            count1++;
                        }
                    }
                    p++;
                }
                count2 = 0;
                for(int j = 0; j < Dim; j++){
                    if(board[j][j] == "X"){
                        count2++;
                    }
                }
                count3 = 0;
                for(int j = 0; j < Dim; j++){
                    if(board[Dim-1-j][j] == "X"){
                        count3++;
                    }
                }
            }else {
                boolean spot2 = false;
                while (!spot2) {
                    Scanner Ask3 = new Scanner(System.in);
                    System.out.print("Player2 X Location?");
                    int X2dimension = Ask3.nextInt();
                    Scanner Ask4 = new Scanner(System.in);
                    System.out.print("Player2 Y Location?");
                    int Y2dimension = Ask4.nextInt();
                    if (Dim<=X2dimension && Dim<=Y2dimension ) {
                        spot2 = false;
                    }else if(board[X2dimension][Y2dimension] != "X" && board[X2dimension][Y2dimension] != "O"){
                        spot2 = true;
                        board[X2dimension][Y2dimension] = "O";
                    }
                }
                for (int i = 0; i < Dim; i++) {
                    System.out.println("");
                    for (int j = 0; j < Dim; j++) {
                        System.out.print(board[i][j]);
                    }
                    System.out.println("");
                }
                int l = 0;
                count4 = 0;
                while (l < Dim && count4 < Dim) {
                    count4 = 0;
                    for (int j = 0; j < Dim; j++) {
                        if (board[l][j] == "O") {
                            count4++;
                        }
                    }
                    l++;
                }
                int m = 0;
                count5 = 0;
                while (m < Dim && count5 < Dim) {
                    count5 = 0;
                    for (int j = 0; j < Dim; j++) {
                        if (board[j][m] == "O") {
                            count5++;
                        }
                    }
                    m++;
                }
                count6 = 0;
                for (int j = 0; j < Dim; j++) {
                    if (board[j][j] == "O") {
                        count6++;
                    }
                }
                count7 = 0;
                for (int j = 0; j < Dim; j++) {
                    if (board[Dim-1-j][j] == "O") {
                        count7++;
                    }
                }
            }
            if(count == Dim || count1 == Dim || count2 == Dim || count3 == Dim){
                Check = true;
                winner = Player1;
            }
            else if(count4 == Dim || count5 == Dim || count6 == Dim || count7 == Dim){
                Check = true;
                winner = Player2;
            }
            else if(counter == Dim*Dim){
                Check = true;
                winner = "No one";
            }
            counter++;
        }
        System.out.print(winner + " has won!");
    }
}