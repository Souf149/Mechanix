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
          gears[amount_of_gears++] = new Gear(amount_of_gears, x_level, y_level, j, i);
          x_level += distance;
        }
      } else {
        int amount = i + 1;
        int x_level = middleX - distance*amount/2 + distance/2;

        for (int j = 0; j <= i; j++) {
          gears[amount_of_gears++] = new Gear(amount_of_gears, x_level, y_level, j, i);
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
    beginShape();
    // TOP
    vertex(middleX - 20, y + 10);
    vertex(middleX + 20, y + 10);
    // RIGHT
    vertex(x+w - 80, y + h - 50);
    vertex(x+w - 80, y + h - 10);
    // LEFT
    vertex(x + 80, y + h - 10);
    vertex(x + 80, y + h - 50);
    endShape();


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
  
  public int[] GetAmount(){
    int[] result = new int[2];
    for (Gear g : gears){
      if (g.player == 1)
        result[0]++;
      else if (g.player == 2)
        result[1]++;
    }
    
    return result;
  }
}

public class Gear {

  Gear tl, tr, r, br, bl, l;
  int id;
  int x, y;
  int column, row;
  int size = 68;
  int player = 0;
  int angle = 0;
  String rotating = "l";
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
      if(rotating == "r"){
        angle++;
      }else if (rotating == "l"){
        angle--;
      }else{
        angle = 0;
      }
      translate(x,y);
      rotate(radians(angle));
      
      
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
      fill(0);
      DrawHexagon(0, 0, size*0.4);
    pop();
    
    // Text to see info about each gear
    //fill(255, 0, 255);
    //text(Integer.toString(id) + ": \n" + Integer.toString(column) + " ; " + Integer.toString(row), x, y);
    
  }
}
