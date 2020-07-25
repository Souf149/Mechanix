

public class ScoreBoard extends GUI_component {
  Board board;
  float timer;

  public ScoreBoard(Board _board) {
    x = 30;
    y = 200;
    w = 200;
    h = 400;
    board = _board;
  }

  public void Show() {
    // background
    stroke(0);
    strokeWeight(2);
    fill(200);
    rect(x, y, w, h, 7);

    // current player
    if (board.currentPlayer == 1) {
      fill(255, 0, 0);
    } else {
      fill(0, 0, 255);
    }
    push();
    translate(x + w/2, y+h - w/2);
    rotate(radians(timer));
    DrawHexagon(0, 0, w/2);
    pop();

    // amount of chips
    int[] amount = board.GetAmount();
    fill(0);
    textSize(24);
    text("Player 1: " + Integer.toString(amount[0]) + " chip", x + 10, y + 40);
    text("Player 2: " + Integer.toString(amount[1]) + " chip", x + 10, y + 65);


    timer+=1;
  }
}
