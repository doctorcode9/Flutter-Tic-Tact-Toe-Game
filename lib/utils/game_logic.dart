class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
}

class Game {
  static final boardlenth = 9; // we will creare a board of 3*3 blocks;
  static final blocSize = 100.0;

  //Creating the empty board
  List<String>? board;

  static List<String>? initGameBoard() =>
      List.generate(boardlenth, (index) => Player.empty);

  //now we need to build the winner check algorithm
  //for this we need first to declare a scoreboard in our main file
  bool winnerCheck(
      String player, int index, List<int> scoreboard, int gridSize) {
    //first let's declare the row   and col
    int row = index ~/ 3;
    int col = index % 3;
    int score = player == "X" ? 1 : -1;

    scoreboard[row] += score;
    scoreboard[gridSize + col] += score;
    if (row == col) scoreboard[2 * gridSize] += score;
    if (gridSize - 1 - col == row) scoreboard[2 * gridSize + 1] += score;

    //checking if we have 3 or -3 in the score board
    if (scoreboard.contains(3) || scoreboard.contains(-3)) {
      return true;
    }
    ;

    //by default it will return false
    return false;
  }
}
