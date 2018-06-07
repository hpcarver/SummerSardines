color[][] board = new color[columnSize][rowSize];
  void setupBoard() {for (int c=0; c<rowSize; c++) for (int r=0; r<columnSize; r++) board[r][c] = boardColor;}  
  boolean free(int row, int column) {return row >= 0 && column >= 0 && row < columnSize && column < rowSize &&
                                            board[row][column] == boardColor;}

void newTile() {
  addToQueue(1);
  current = new Tile(nextTiles.remove(0));
  clearRows();
}

//CLEARING ROWS
void clearRows() {
  int count = 0;
  
  for (int row = 0; row < columnSize; row++) {
    if (rowFull(row)) {
      rowsCleared++;
      count++;
      if (rowsCleared % 10 == 0 && level < 10)
        level++;
        
      shiftBoardDown(row--);
    }
  }
  
  switch (count) {
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
  for (int column = 0; column < rowSize; column++)
    if (board[row][column] == boardColor)
      return false;
  return true;
}

void shiftBoardDown(int row) {
  for (int r = row; r > 0; r--) for (int c = 0; c < rowSize; c++)
    board[r][c] = board[r - 1][c];
}
    
  
