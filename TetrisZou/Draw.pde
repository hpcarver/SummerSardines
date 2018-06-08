void drawAll() {
  background(backgroundColor);
  drawBoard();
  drawHeader();
  drawNextTiles();
}

void drawBoard() {
  //grid and tiles
  for (int c=0; c<rowSize; c++) 
    for (int r=0; r<columnSize; r++)
      drawCell(r, c, board[r][c]);
    
  //falling piece
  current.display();
  
  //threshold/failure bar, game over if passed
  stroke(barColor);
  strokeWeight(barWeight);
  line(sideMarginSize, 2 * cellSize + topMarginSize, rowSize * cellSize + sideMarginSize, 2 * cellSize + topMarginSize);
  
  //border
  stroke(borderColor);
  strokeWeight(borderWeight);
  noFill();
  rect(sideMarginSize, topMarginSize, rowSize * cellSize, columnSize * cellSize);
}

void drawHeader() {//draws text on header
  String text;
  
  if (gameOver) {
    fill(gameOverColor);
    text = "Game Over";
  } else {
    fill(textColor);
    text = "Level " + level;
  }
  textSize(textSize);
  textAlign(CENTER);
  text(text, textMarginSize, textMarginSize, width - 2 * textMarginSize, topMarginSize - 2 * textMarginSize);
}

void drawNextTiles() {//draws display of tile queue
  stroke(borderColor);
  strokeWeight(borderWeight);
  noFill();
  rect(2 * sideMarginSize + rowSize * cellSize + nextTilesMarginSize, topMarginSize,
       2 * nextTilesMarginSize + 4 * nextTilesCellSize, nextTilesQueueSize * (nextTilesMarginSize + 4 * nextTilesCellSize));
       
  for (int position = 0; position < nextTilesQueueSize; position++) {
    for (int r = 0; r < 4; r++) for (int c = 0; c < 4; c++)
      if (nextTiles.get(position).shapes.get(0)[r][c] == 1)
        drawNextCell(position, r, c, nextTiles.get(position).hue);
  }
}

void drawNextCell(int position, int row, int column, color c) {//fills cells in queue tiles
  if (gameOver && c != boardColor)
    fill(gameOverColor);
  else
    fill(c);
    
  stroke(gridColor);
  strokeWeight(gridWeight);
  rect(2 * sideMarginSize + rowSize * cellSize + 2 * nextTilesMarginSize + column * nextTilesCellSize,
       topMarginSize + (1 + position) * nextTilesMarginSize + position * 4 * nextTilesCellSize + row * nextTilesCellSize,
       nextTilesCellSize, nextTilesCellSize);
}
    

void drawCell(int row, int column, color c) {//fills cells on board
  if (gameOver && c != boardColor)
    fill(gameOverColor);
  else
    fill(c);
    
  stroke(gridColor);
  strokeWeight(gridWeight);
  rect(column * cellSize + sideMarginSize, row * cellSize + topMarginSize, cellSize, cellSize);
}
