public class TetrisPiece {
  int type;
  int x;
  int y;
  PShape p,a,b;
  
  public TetrisPiece(int newType, int newX, int newY) { //coors of top left corner
      type = newType;
      x = newX;
      y = newY;
  }
  
  void display() {
      p = createShape(GROUP);
      if ( type == 1 ) {
        fill(100,20,0);
         p = createShape(RECT, x, y, 100, 25);
      }
      if ( type == 2 ) {
         fill(252,0,0);
         p = createShape(RECT, x, y, 50, 50);
      }
      if ( type == 3 ) {
         fill(252,252,0);
         a = createShape(RECT, x, y, 75, 25);
         b = createShape(RECT, x+25, y+25, 25, 25);
         p.addChild(a);
         p.addChild(b);
      }
      if ( type == 4 ) {
         fill(252,0,252);
         a = createShape(RECT, x, y, 75, 25);
         b = createShape(RECT, x, y+25, 25, 25);
         p.addChild(a);
         p.addChild(b);
      }
      if ( type == 5 ) {
         fill(252,252,0);
         a = createShape(RECT, x, y, 75, 25);
         b = createShape(RECT, x+50, y+25, 25, 25);
         p.addChild(a);
         p.addChild(b);
      }
      if ( type == 6 ) {
         fill(252,10,0);
         a = createShape(RECT, x, y, 50, 25);
         b = createShape(RECT, x+25, y+25, 50, 25);
         p.addChild(a);
         p.addChild(b);
      }
      if ( type == 7 ) {
         fill(252,252,0);
         a = createShape(RECT, x, y, 50, 25);
         b = createShape(RECT, x-25, y+25, 50, 25);
         p.addChild(a);
         p.addChild(b);
      }
      
      shape(p);
  }
  
  void rotateP() {
     p.rotate(0.01); 
  }
  
}
