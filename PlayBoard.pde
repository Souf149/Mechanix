 //<>//

public class Board extends GUI_component {
  Gear[] gears = new Gear[55];
  int distance = 70;
  int amount_of_gears = 0;
  int currentPlayer = 1;

  public Board() {
    x = 250;
    y = 25;
    w = 925;
    h = 750;

    int middleX = x + w/2;
    // creating all the gears
    for (int i = 0; i < 10; i++) {
      int y_level = y + 68 + distance*i;
      if (i % 2 == 0) {
        int lefts = (i+1) / 2;
        int x_level = middleX - distance*lefts;

        for (int j = 0; j <= i; j++) {
          gears[amount_of_gears++] = new Gear(amount_of_gears, x_level, y_level);
          x_level += distance;
        }
      } else {
        int amount = i + 1;
        int x_level = middleX - distance*amount/2 + distance/2;

        for (int j = 0; j <= i; j++) {
          gears[amount_of_gears++] = new Gear(amount_of_gears, x_level, y_level);
          x_level += distance;
        }
      }
    }

    // Coloring the corners
    gears[0].player = 3;
    gears[45].player = 2;
    gears[54].player = 1;
    
  }

  public void Show() {
    // background
    strokeWeight(0.5);
    fill(150, 50, 150);
    rect(x, y, w, h, 7);

    // triangle background
    int middleX = x + w/2;
    fill(51);
    triangle(middleX, y + 10, 
      x + 10, y + h - 10, 
      x+w - 10, y + h - 10);


    // gears
    for (Gear g : gears)
      g.Show();
  }

  public void onClick(int mouseX, int mouseY) {
    for (Gear g : gears){
      double d = dist(g.x, g.y, mouseX, mouseY);
      if (d < g.size/2){
        g.player = currentPlayer;
        currentPlayer = currentPlayer != 1 ? 1 : 2;
        return;
      }
    }
      
  }
}

public class Gear {

  Gear tl, tr, r, br, bl, l;
  int id;
  int x, y;
  int column, row;
  int size = 68;
  int player = 0;

  public Gear(int _id, int _x, int _y) {
    id = _id - 1;
    x = _x;
    y = _y;
  }

  public void Show() {

    switch(player) {
    case 1:
      fill(255, 0, 0);
      DrawHexagon(x, y, size);
      break;

    case 2:
      fill(0, 0, 255);
      DrawHexagon(x, y, size);
      break;

    case 3:
      fill(200, 200, 50);
      DrawHexagon(x, y, size);
    }


    fill(0);
    DrawHexagon(x, y, size*0.4);
  }
}
