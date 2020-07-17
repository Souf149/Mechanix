

public class Board extends GUI_component {
  Gear[] gears = new Gear[55];
  int size = 10;

  public Board() {
    x = 250;
    y = 25;
    w = 925;
    h = 750;

    // creating all the gears
    int index = 0;
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j <= i; j++) {
      
        
      }
    }
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
  }

  public void onClick() {
  }
}

public class Gear {
  Gear tl, tr, r, br, bl, l;
  int x, y;
  int column, row;
  int size = 10;
  int player = 0;

  public Gear(int _x, int _y) {
    x = _x;
    y = _y;
  }

  public void Show() {
    ellipse(x, y, size/2, size/2);
  }
}
