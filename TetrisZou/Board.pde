color[][] board = new color[columnSize][rowSize];//new board of colored cells
  void setupBoard() {
    for (int c=0; c<rowSize; c++) 
      for (int r=0; r<columnSize; r++) 
        board[r][c] = boardColor; //sets each cell to boardColor
   }  
      
  boolean free(int row, int column) {
    return row >= 0 && column >= 0 
    && row < columnSize && column < rowSize 
    && board[row][column] == boardColor;
  }//returns true if cell doesn't have piece on it

void newTile() {
  addToQueue(1);//adds a tile to queue of tiles
  current = new Tile(nextTiles.remove(0));//drops a new tile from queue
  clearRows();
}

//CLEARING ROWS
void clearRows() {
  int count = 0;
  
  for (int row = 0; row < columnSize; row++) {//checks each row for full rows
    if (rowFull(row)) {//clears row if full
      rowsCleared++;
      count++;
      if (rowsCleared % 5 == 0 && level < 10)//levels up for every 10 rows cleared
        level++;
        
      shiftBoardDown(row--);//shifts board down after row is cleared
    }
  }
  
  switch (count) { //increments score based on level & num rows cleared
    case 0: break;
    case 1: score += 40 * (level + 1);
      break;
    case 2: score += 100 * (level + 1);
      break;
    case 3: score += 300 * (level + 1);
      break;
    default: score += 1200 * (level + 1);
  }  
}

boolean rowFull(int row) {
  for (int column = 0; column < rowSize; column++)//checks every col in row 
    if (board[row][column] == boardColor)
      return false;//if any cell is board colored ret false
  return true;
}

void shiftBoardDown(int row) {
  for (int r = row; r > 0; r--) for (int c = 0; c < rowSize; c++)
    board[r][c] = board[r - 1][c];//sets each cell = cell above it
}
    
  
