import java.util.Random;

public class Card implements Comparable<Card> {
    private final String color;
    private final int number;

    public Card(){

        Random random = new Random();
        this.number = random.nextInt(10);

        int setColor = random.nextInt(4);
        switch (setColor){
            case 0:
                this.color = "red";
                break;
            case 1:
                this.color = "blue";
                break;
            case 2:
                this.color = "yellow";
                break;
            default:
                this.color = "green";
                break;
        }
    }

    public Card(int number, String color){
        this.number = number;
        this.color = color;
    }

    public int getNumber() {
        return number;
    }

    public String getColor() {
        return color;
    }

    public String toString(){
        return this.color + "-" + number;
    }

    @Override
    public int compareTo(Card o) {
        if(this.number>o.getNumber()){
            return 1;
        } else if (o.getNumber()>this.number){
            return -1;
        }
        return 0;
    }
}
