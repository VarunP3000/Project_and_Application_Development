// to import a map
import java.util.*;

public class Player {
    private Map<String, BinaryTree<Card>> cards = new HashMap<>();
    private int size;
    private String name;
    public Player(String name) {
        this.name = name;
        this.size = 0;

        this.cards.put("red", new BinaryTree<Card>());
        this.cards.put("blue", new BinaryTree<Card>());
        this.cards.put("yellow", new BinaryTree<Card>());
        this.cards.put("green", new BinaryTree<Card>());
        for(int i = 0; i < 7; i++){
            addCard();
        }
    }

    public String getName(){
        return name;
    }
    public int getSize(){
        return size;
    }
    public void addCard(){
        Card c = new Card();
        this.cards.get(c.getColor()).add(c);
        size++;
    }
    public boolean hasAnything(Card c){
        if(colorCheck(c) || numberCheck(c)){
            return true;
        }else{
            return false;
        }
    }

    private boolean colorCheck(Card c){
        if(this.cards.get(c.getColor()).isEmpty()){
            return false;
        }else{
            return true;
        }
    }

    private boolean numberCheck(Card c){
        if(this.cards.get("red").find(c) || this.cards.get("blue").find(c) || this.cards.get("yellow").find(c) || this.cards.get("green").find(c)){
            return true;
        }else{
            return false;
        }
    }

    public boolean remove(Card c){
        if(hasCard(c)){
            this.cards.get(c.getColor()).remove(c);
            size--;
            return true;
        } else {
            return false;
        }
    }

    public boolean hasCard(Card c){
        return this.cards.get(c.getColor()).find(c);
    }

    public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append(this.name);
        sb.append(": ");
        sb.append(this.cards.get("red").toString());
        sb.append(this.cards.get("blue").toString());
        sb.append(this.cards.get("yellow").toString());
        sb.append(this.cards.get("green").toString());
        return sb.toString();
    }
}
