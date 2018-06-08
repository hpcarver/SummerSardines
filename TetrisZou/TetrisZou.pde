void settings() {
  size(rowSize * cellSize + 2 * sideMarginSize + //horizontal cells on board + 2 for margin
       4 * nextTilesCellSize + 4 * nextTilesMarginSize, //display area for next pieces
       columnSize * cellSize + sideMarginSize + topMarginSize);//vertical cells + 2 for margin
}

void setup() {
  setupBoard();//color board
  frameRate(framesPerSec);
  
  addToQueue(nextTilesQueueSize + 1);//populate queue with random peces
  current = new Tile(nextTiles.remove(0));//get first piece
  drawBoard();
}

void draw() {
  if (!holdMode && !gameOver &&//if no piece is held and game is still going
      (frameNumber++ % framesPerDrop[level] == 0 ||//checks if tile is in place
                                                   //by dividing frames elapsed by
                                                   //frames it takes to move one cell
       fastMode && frameNumber % framesPerFastDrop == 0) &&
      !current.verticalDrop())//checks if tile is dropping
    newTile();
  
  drawAll();//displays everything on board 
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
