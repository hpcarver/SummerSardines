class Grid {
  int[][] grid = new int[18][28];
  boolean[][] boo = new boolean[18][28];
  int num = 0;
  
  Grid() {
     for ( int i = 0; i < grid.length; i++) {
        for ( int j = 0; j < grid[0].length; j++ ) {
           grid[i][j] = num;
           num++;
        }
     }
  }
  
  void add(Tetromino t ) {
    for ( int[] rows : grid ) {
        for ( int i : rows ) {
            if ( t.getX()/25 == i && (i/18) * 25 == t.getY()) {
              boo[t.getX][]
            }
        }
    }
    
    
  }  
}
