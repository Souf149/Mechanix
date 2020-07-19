

public void DrawHexagon(float x, float y, float size) {

  beginShape();
  for (int i = 0; i < 6; i++) {
    float xval = (int) (x + size/2
      * Math.cos(i * 2 * Math.PI / 6));
    float yval = (int) (y + size/2
      * Math.sin(i * 2 * Math.PI / 6));
    vertex(xval, yval);
  }
  float xval = (int) (x + size/2
    * Math.cos(0));
  float yval = (int) (y + size/2
    * Math.sin(0));
  vertex(xval, yval);
  endShape();
};
