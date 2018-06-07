color[][] board = new color[columnSize][rowSize];
  void setupBoard() {for (int c=0; c<rowSize; c++) for (int r=0; r<columnSize; r++) board[r][c] = boardColor;}  
  boolean free(int row, int column) {return row >= 0 && column >= 0 && row < columnSize && column < rowSize &&
                                            board[row][column] == boardColor;}

void newTile() {
  TileType type = TileType.values()[new Random().nextInt(TileType.values().length)];
  falling = new Tile(type);
  clearRows();
}

void drawBoard() {
  for (int c=0; c<rowSize; c++) for (int r=0; r<columnSize; r++)
    drawCell(r, c, board[r][c]);
    
  falling.display();
  
  stroke(barColor);
  strokeWeight(barWeight);
  line(0 + sideMarginSize, 2 * cellSize + topMarginSize, rowSize * cellSize + sideMarginSize, 2 * cellSize + topMarginSize);
}

void drawHeader() {
  String text;
  
  if (gameOver) {
    fill(gameOverColor);
    text = "Game Over";
  } else {
    fill(textColor);
    text = playerName + ": Level " + level;
  }
  textSize(topMarginSize - 4 * textMarginSize);
  textAlign(CENTER);
  text(text, textMarginSize, textMarginSize, width - 2 * textMarginSize, topMarginSize - 2 * textMarginSize);
}

void drawCell(int row, int column, color c) {
  if (gameOver && c != boardColor)
    fill(gameOverColor);
  else
    fill(c);
  stroke(gridColor);
  strokeWeight(gridWeight);
  rect(column * cellSize + sideMarginSize, row * cellSize + topMarginSize, cellSize, cellSize);
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
    
  
