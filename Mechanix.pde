
PImage backgroundImage;
Board board;

GUI_component[] GUI = new GUI_component[]{
  
};

void setup(){
  size(1200, 800);
  backgroundImage = loadImage("gear.png");
  
  board = new Board();
}

void draw(){
  
  // background
  background(backgroundImage);
  
  // score screen
  stroke(0);
  strokeWeight(2);
  fill(200);
  rect(30, 200, 200, height - 400, 7);
  
  // playboard
  strokeWeight(0.5);
  fill(150, 50, 150);
  rect(250, 25, 925, height - 50, 7);
  
}

void mousePressed(){
  
}
