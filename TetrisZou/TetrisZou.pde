void settings() {
  size(rowSize * cellSize + 2 * sideMarginSize,
       columnSize * cellSize + sideMarginSize + topMarginSize);
}

void setup() {
  setupBoard();
  frameRate(framesPerSec);
  
  newTile();
  drawBoard();
}

void draw() {
  if (!holdMode && !gameOver &&
      (frameNumber++ % framesPerDrop[level] == 0 ||
       fastMode && frameNumber % framesPerFastDrop == 0) &&
      !falling.verticalDrop())
    newTile();
  background(backgroundColor);
  drawBoard();
  drawHeader();
}

void keyPressed() {
  if (keyCode == 'a' || keyCode == LEFT)
    falling.horizontalShift(-1);
  else if (keyCode == 'd' || keyCode == RIGHT)
    falling.horizontalShift(1);
  else if (keyCode == 's' || keyCode == DOWN)
    fastMode = true;
  else if (keyCode == 'w' || keyCode == UP)
    falling.rotate();
  else if (keyCode == ' ')
    while(falling.verticalDrop()) {}
  else if (keyCode == 'h')
    holdMode = true;
}

void keyReleased() {
  if (keyCode == 's' || keyCode == DOWN)
    fastMode = false;
  if (keyCode == 'h')
    holdMode = false;
}
