

public class Gear {

  Gear tl, tr, r, br, bl, l;
  int id;
  int x, y;
  int column, row;
  int size = 68;
  int player = 0;
  int angle = 0;
  String rotating = "r";
  boolean selected = false;
  boolean isCore = false;

  public Gear(int _id, int _x, int _y, int _column, int _row) {
    id = _id - 1;
    x = _x;
    y = _y;
    column = _column;
    row = _row;
  }

  public void Show() {
    // Drawing the hexagon at an angle
    push();
    if (rotating == "r") {
      angle++;
    } else if (rotating == "l") {
      angle--;
    } else {
      angle = 0;
    }
    translate(x, y);
    rotate(radians(angle));
    strokeWeight(1);


    switch(player) {
    case 1:
      fill(255, 0, 0);
      DrawHexagon(0, 0, size);
      break;

    case 2:
      fill(0, 0, 255);
      DrawHexagon(0, 0, size);
      break;

    case 3:
      fill(200, 200, 50);
      DrawHexagon(0, 0, size);
    }

    if (selected)
      fill(100, 100, 0);
    else
      fill(0);

    if (isCore) {
      stroke(0, 200, 0);
      strokeWeight(2);
    } else
      noStroke();

    DrawHexagon(0, 0, size*0.4);
    pop();

    // Text to see info about each gear
    //textSize(11);
    //fill(255, 0, 255);
    //text(Integer.toString(id) + ": \n" + Integer.toString(column) + " ; " + Integer.toString(row), x, y);
  }
}
