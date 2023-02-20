import java.util.*;

public class Main {
    public static void main(String[] args) {
        String[][] maze = {{"X", "X", "X", "O", "X", "X"}, {"X", "X", "O", "O", "O", "X"}, {"X", "X", "O", "X", "O", "X"}, {"X", "X", "O", "X", "X", "X"}};
        Maze(maze, 0, 3);
    }

    public static void Maze(String maze[][], int x, int y){
        ArrayList<String>checked = new ArrayList<>();
        Queue<String>Known = new LinkedList<>();
        boolean see = false;
        if(x == 0 && y != 0 && y != maze[0].length-1){
            //Checks whether the value is at the top/roof of the grid, and then checks the left, right, and below value.
            //It doesn't check the top because there is nothing above it.
            if(Objects.equals(maze[x + 1][y], "O")){
                Known.add((x + 1) + "" + y);
            }
            if(Objects.equals(maze[x][y - 1], "O")){
                Known.add(x + "" + (y - 1));
            }
            if(Objects.equals(maze[x][y + 1], "O")){
                Known.add(x + "" + (y + 1));
            }
        }
        else if(x == maze.length-1 && y != 0 && y != maze[0].length-1){
            //Checks whether the value is at the bottom of the grid, and then checks the left, right, and above value.
            //It doesn't check below because there is nothing below it.
            if(Objects.equals(maze[x][y - 1], "O")){
                Known.add(x + "" + (y-1));
            }
            if(Objects.equals(maze[x][y + 1], "O")){
                Known.add(x + "" + y + 1);
            }
            if(Objects.equals(maze[x - 1][y], "O")){
                Known.add((x - 1) + "" + y);
            }
        }
        else if(y == 0 && x != 0 && x != maze.length){
            //Checks whether the value is at the edge of the grid, and then checks the top, below, and right value.
            //It doesn't check the left value because there is nothing is to the left of it.
            if(Objects.equals(maze[x][y + 1], "O")){
                Known.add(x + "" + (y + 1));
                //System.out.println(Character.getNumericValue(Known.peek().charAt(1)));
            }
            if(Objects.equals(maze[x + 1][y], "O")){
                Known.add((x + 1) + "" + y);
            }
            if(Objects.equals(maze[x - 1][y], "O")){
                Known.add((x-1) + "" + y);
            }
        }
        else if(y == maze[0].length && x != 0 && x != maze.length) {
            //Checks whether the value is at the right of the grid, and then checks the left, top, and below value.
            //It doesn't check the right because there is nothing to the right of it.
            if (Objects.equals(maze[x - 1][y], "O")) {
                Known.add((x + 1) + "" + y);
            }
            if (Objects.equals(maze[x + 1][y], "O")) {
                Known.add((x + 1) + "" + y);
            }
            if (Objects.equals(maze[x][y - 1], "O")) {
                Known.add(x + "" + (y - 1));
            }
        }
        checked.add(x + "" + y);
        int counter = 0;
        while(!see){
            if(Known.isEmpty()){
                see = true;
                System.out.println("There is no solution");
            }else{
                String value = Known.remove();
                int x1 = Character.getNumericValue(value.charAt(0));
                int y1 = Character.getNumericValue(value.charAt(1));

                if(x1 == 0 || y1 == 0 || x1 == maze.length-1 || y1 == maze[0].length-1){
                    see = true;
                    System.out.println(x1 + "," + y1 + " is the end!");
                    System.out.print("counter:" + counter);
                }
                else{
                    String left = ((x1) + "" + (y1-1));
                    boolean left1 = true;
                    int i = 0;
                    while(left1 == true && i < checked.size()){
                        if(left.equals(checked.get(i))){
                            left1 = false;
                        }
                        i++;
                    }
                    if(left1 == true && maze[x1][y1-1] != "X"){
                        Known.add(left);
                    }

                    String right = ((x1) + "" + (y1+1));
                    boolean right1 = true;
                    int i1 = 0;
                    while(right1 == true && i1 < checked.size()){
                        if(right.equals(checked.get(i1))){
                            right1 = false;
                        }
                        i1++;
                    }
                    if(right1 == true && maze[x1][y1+1] != "X"){
                        Known.add(right);
                    }

                    String top = ((x1-1) + "" + (y1));
                    boolean top1 = true;
                    int i2 = 0;
                    while(top1 == true && i2 < checked.size()){
                        if(top.equals(checked.get(i2))){
                            top1 = false;
                        }
                        i2++;
                    }
                    if(top1 == true && maze[x1-1][y1] != "X"){
                        Known.add(top);
                    }

                    String bottom = ((x1+1) + "" + (y1));
                    boolean bottom1 = true;
                    int i3 = 0;
                    while(bottom1 == true && i3 < checked.size()){
                        if(bottom.equals(checked.get(i3))){
                            bottom1 = false;
                        }
                        i3++;
                    }
                    if(bottom1 == true && maze[x1+1][y1] != "X"){
                        Known.add(bottom);
                    }
                }
                checked.add(value);
                counter++;
            }
        }
    }
}