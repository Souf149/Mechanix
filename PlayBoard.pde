 //<>//

public class Board extends GUI_component {
  Gear[] gears = new Gear[55];
  int distance = 70;
  int amount_of_gears = 0;
  int currentPlayer = 1;
  Gear selectedGear;

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
    gears[0].isCore = true;
    gears[45].player = 2;
    gears[45].isCore = true;
    gears[54].player = 1;
    gears[54].isCore = true;
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
    for (Gear g : gears) {
      double d = dist(g.x, g.y, mouseX, mouseY);
      if (d < g.size/2) {
        
        if(g.isCore)
          return;
        
        if (selectedGear == null) {
          // Place new gear at location if no other gear is selected
          if (g.player == 0) {
            g.player = currentPlayer;
            currentPlayer = currentPlayer != 1 ? 1 : 2;
          } else if (g.player == currentPlayer) {
            
            g.selected = true;
            selectedGear = g;
          }
        } else {
          if (g.player == 0) {
            selectedGear.player = 0;
            selectedGear.selected = false;
            selectedGear = null;
            g.player = currentPlayer;
            currentPlayer = currentPlayer != 1 ? 1 : 2;
          }else if(g.selected){ // If the to be selected gear gets selected again
              g.selected = false;
              selectedGear = null;
              return;
            }
        }

        return;
      }
    }
  }

  public int[] GetAmount() {
    int[] result = new int[2];
    for (Gear g : gears) {
      if (g.player == 1)
        result[0]++;
      else if (g.player == 2)
        result[1]++;
    }

    return result;
  }
}
