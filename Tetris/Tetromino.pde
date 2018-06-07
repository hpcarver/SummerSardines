import java.util.LinkedList;
class Tetromino {
  int[][][] grid;
  int x;
  int y;
  int type;
  int rot;
  int rotIncrement;
  int speedX;
  int speedY;
  boolean stopped;
  PShape tetro;
  LinkedList<int[]> allRots;
  
  Tetromino(int newType, int newRot, int newX, int newY) {
    type = newType;
    rot = newRot;
    rotIncrement = 1;
    x = newX;
    y = newY;
    speedX = 25;
    speedY = 25;
    stopped = false;
    allRots = new LinkedList<int[]>();
    grid = new int[][][] {  { {1,2,3,6},{2,5,6,10},{2,5,6,7},{1,5,6,9} },
                            { {1,2,3,5},{1,2,6,10},{3,5,6,7},{1,5,9,10} },
                            { {1,2,3,7},{2,6,9,10},{1,5,6,7},{1,2,5,9} },
                            { {2,3,5,6},{1,5,6,10},{2,3,5,6},{1,5,6,10} },
                            { {1,2,6,7},{2,5,6,9},{1,2,6,7},{2,5,6,9} },
                            { {1,2,3,4},{2,6,10,14},{1,2,3,4},{2,6,10,14} },
                            { {1,2,5,6},{1,2,5,6},{1,2,5,6},{1,2,5,6} },
                         };
        
    for(int i = 0; i < grid.length; i++ ) {
         if ( i == type ) {
            for ( int[] arr : grid[i] ) {
               allRots.add(arr);
             }
         }
    }
  }
  
  PShape box(int x, int y) {
    PShape p;
    p = createShape();
    fill(0,252,0);
    p.beginShape();
    p.vertex(x,y);
    p.vertex(x+25, y);
    p.vertex(x+25, y+25);
    p.vertex(x, y+25);
    p.endShape();
    return p;
  }
  
  void display() {
    tetro = createShape(GROUP);
      for ( int i : allRots.get(rot)) {
        tetro.addChild(box(x + ((i-1)%4) * 25, y + ((i/4) * 25)));
      };
    shape(tetro);
  }
  
  void rotate() {
     if ( rot == 3 && rotIncrement != 0) {
        rot = 0; 
     }
     else {
        rot+= rotIncrement;
     }
  }
  
  void drop() {
    
    if ( type < 5 ) {
      if ( rot%2 == 1 ) {
       if ( 700 - y <= 75) {
         speedY = 0;
         speedX = 0;
         rotIncrement = 0;
         stopped = true;
       }
      }
      else {
       if ( 700 - y <= 50) {
         speedY = 0;
         speedX = 0;
         rotIncrement = 0;
         stopped = true;
       }
      }
    }
    y += speedY/25;
    
  }
  
  void moveLeft() {
    if ( x >=25 ) {
    x-=speedX;
    }
  }
  
  void moveRight() {
    if ( x <= 375) {
    x+=speedX;
    }
  }
  
  boolean stopped() {
    return stopped; 
  }
  
  int getX() {
     return x; 
  }
  
  int getY() {
     return y; 
  }
  
}
