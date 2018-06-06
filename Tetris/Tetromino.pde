class Tetromino {
  int[][][] grid;
  int x;
  int y;
  int type;
  int rot;
  int rotIncrement;
  int speedX;
  int speedY;
  PShape tetro;
  
  Tetromino(int newType, int newRot, int newX, int newY) {
    type = newType;
    rot = newRot;
    rotIncrement = 1;
    x = newX;
    y = newY;
    speedX = 25;
    speedY = 25;
    grid = new int[][][] {  { {1,2,3,6},{2,5,6,10},{2,5,6,7},{1,5,6,9} },
                            { {1,2,3,5},{1,2,6,10},{3,5,6,7},{1,5,9,10} },
                            { {1,2,3,7},{2,6,9,10},{1,5,6,7},{1,2,5,9} },
                            { {2,3,5,6},{1,5,6,10},{2,3,5,6},{1,5,6,10} },
                            { {1,2,6,7},{2,5,6,9},{1,2,6,7},{2,5,6,9} },
                            { {1,2,3,4},{2,6,10,14},{1,2,3,4},{2,6,10,14} },
                            { {1,2,5,6},{1,2,5,6},{1,2,5,6},{1,2,5,6} },
                         };
    
  }
  
  void display() {
    tetro = createShape(GROUP);
    for(int i = 0; i < grid.length; i++ ) {
         for ( int j = 0; j < grid[0].length; j++ ) {
             if ( i == type && j == rot ) {
                for ( int k : grid[i][j] ) {
                  Minomino m = new Minomino(x + ((k-1)%4) * 25, y + ((k/4) * 25));//1256
                  tetro.addChild(m.getM());
                }
                break;
             }
         }
    }
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
       }
      }
      else {
       if ( 700 - y <= 50) {
         speedY = 0;
         speedX = 0;
         rotIncrement = 0;
       }
      }
    }
    y += speedY/25;
    
  }
  
  void moveLeft() {
    x-=speedX;
  }
  
  void moveRight() {
    x+=speedX;
  }
  
  
}