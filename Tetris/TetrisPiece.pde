public class TetrisPiece {
  int type;
  int x;
  int y;
  public TetrisPiece(int newType, int newX, int newY) { //coors of top left corner
      type = newType;
      x = newX;
      y = newY;
      
  }
  
  void display() {
    if ( type == 1 ) {
     fill(255,0,0);
     rect(x, y, 100, 25);
    }
    if ( type == 2 ) {
     fill(0,255,0);
     rect(x, y, 50, 50);
    }
    if ( type == 3 ) {
     fill(0,0,255);
     rect(x,y,75,25);
     rect(x+25, y-25,25,25);
    }
    if ( type == 4 ) {
      fill(0,255,255);
     rect(x,y,75,25);
     rect(x,y+25,25,25);
    }
    if ( type == 5 ){
      fill(255,0,255);
     rect(x,y,75,25);
     rect(x,y+50,25,25);
    }
    if ( type == 6 ){
      fill(155,0,155);
     rect(x,y,50,25);
     rect(x+25,y-25,50,25);
    }
    if ( type == 7 ){
      fill(181,0,100);
     rect(x,y,50,25);
     rect(x+25,Y+25,50,25);
    }
    
  }
  void rotate() {
    
  }
}