class Minomino {
  int x;
  int y;
  PShape mino;
  
  Minomino(int newX, int newY) {
    x = newX;
    y = newY;
  }
  
  PShape getM() {
    mino = createShape();
    mino.beginShape();
    mino.vertex(x,y);
    mino.vertex(x+25, y);
    mino.vertex(x+25, y+25);
    mino.vertex(x, y+25);
    mino.endShape();
    return mino;
  }
  
}
