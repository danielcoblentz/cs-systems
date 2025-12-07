class Game {
    private final int moves;

    Game(int moves) {
        this.moves = moves;
        System.out.println("Game created");
    }

    public int getMoves() {
        return moves;
    }
}

class BoardGame extends Game {
    BoardGame(int moves) {
        super(moves);
        System.out.println("BoardGame created");
    }
}

public class Chess extends BoardGame {
    public Chess() {
        super(2);
        System.out.println("Chess initialized with " + getMoves() + " players");
    }

    public static void main(String[] args) {
        new Chess();
    }
}
