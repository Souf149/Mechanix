
PImage backgroundImage;
Board board = new Board();

GUI_component[] GUI = new GUI_component[]{
  new ScoreBoard(),
  board
};

void setup(){
  size(1200, 800);
  backgroundImage = loadImage("gear.png");
  
}

void draw(){
  
  // background
  background(backgroundImage);
  
  for(GUI_component gui : GUI)
    gui.Show();
  
  
  
}

void mousePressed(){
  
}
