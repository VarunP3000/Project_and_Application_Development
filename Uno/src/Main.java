import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;
import java.util.Stack;

public class Main {
    public static void main(String[] args) {
        Queue<Player>players = new LinkedList<>();
        Scanner ask = new Scanner(System.in);
        System.out.print("How many players?");
        int amount = ask.nextInt();
        for(int i=1; i<=amount; i++){
            Scanner askName = new Scanner(System.in);
            System.out.print("Player " + i + ", what is your name?");
            players.add(new Player(askName.next()));
        }
        uno(players);
    }

    public static void uno(Queue<Player>players){
        Queue<Player>winners = new LinkedList<>();
        Card c = new Card();
        while(players.size()>1){
            Player now = players.remove();
            System.out.println("It is your turn " + now.getName());
            System.out.println(c + " is the top card");
            if(!now.hasAnything(c)){
                System.out.println("You have nothing :(");
                System.out.println("");
                now.addCard();
                players.add(now);
            }else {
                System.out.println(now);
                boolean b = false;
                while (!b) {
                    System.out.println("Which card do you want to place? Say the color and number:");
                    System.out.println("(make sure that color is not capitalized!)");
                    Scanner prompt = new Scanner(System.in);
                    System.out.println("Color:");
                    String color = prompt.nextLine();
                    Scanner numberPrompt = new Scanner(System.in);
                    System.out.println("Number:");
                    int number = numberPrompt.nextInt();
                    Card check = new Card(number, color);
                    if (c.getColor().equals(check.getColor()) || c.getNumber() == check.getNumber()) {
                        if (now.remove(check)) {
                            b = true;
                            c = check;
                            if(now.getSize() > 0){
                                players.add(now);
                            }
                            else{
                                winners.add(now);
                            }
                        }
                    }
                }
            }
            System.out.println("");
        }
        for(int i = 1; i <= winners.size(); i++){
            System.out.println(i + ":" + winners.remove().getName());
        }
    }
}