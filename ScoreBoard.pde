

public class ScoreBoard extends GUI_component {
  
  public ScoreBoard() {
     x = 30;
     y = 200;
     w = 200;
     h = 400;
  }
  
  public void Show(){
    // background
    stroke(0);
    strokeWeight(2);
    fill(200);
    rect(x, y, w, h, 7);
  }
  
  public void onClick(){
    
  }
  
}
