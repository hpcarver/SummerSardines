void settings() {
  size(rowSize * cellSize + 2 * sideMarginSize + 4 * nextTilesCellSize + 4 * nextTilesMarginSize,
       columnSize * cellSize + sideMarginSize + topMarginSize);
}

void setup() {
  setupBoard();
  frameRate(framesPerSec);
  
  addToQueue(nextTilesQueueSize + 1);
  current = new Tile(nextTiles.remove(0));
  drawBoard();
}

void draw() {
  if (!holdMode && !gameOver &&
      (frameNumber++ % framesPerDrop[level] == 0 ||
       fastMode && frameNumber % framesPerFastDrop == 0) &&
      !current.verticalDrop())
    newTile();
  
  drawAll();
}

void keyPressed() {
  if (keyCode == 'a' || keyCode == LEFT)
    current.horizontalShift(-1);
  else if (keyCode == 'd' || keyCode == RIGHT)
    current.horizontalShift(1);
  else if (keyCode == 's' || keyCode == DOWN)
    fastMode = true;
  else if (keyCode == 'w' || keyCode == UP)
    current.rotate();
  else if (keyCode == ' ')
    while(current.verticalDrop()) {}
  else if (keyCode == 'h')
    holdMode = true;
}

void keyReleased() {
  if (keyCode == 's' || keyCode == DOWN)
    fastMode = false;
  if (keyCode == 'h')
    holdMode = false;
}
