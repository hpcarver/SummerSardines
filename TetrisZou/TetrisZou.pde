static final color fore = #FFFFFF;
static final color back = #000000;
static final color red = #CC0000;
static final color orange = #FF7700;
static final color yellow = #FFFF00;
static final color green = #009900;
static final color blue = #0000FF;
static final color cyan = #33FFFF;
static final color purple = #66FFCC;

static final int rowSize = 10;
static final int columnSize = 22;
static final int cellSize = 25;

static final int startRow = 0;
static final int startColumn = 4;

static final int framesPerSec = 60;
static final int framesPerDrop = 40;
static final int framesPerFastDrop = 10;

color[][] board = new color[columnSize][rowSize];
  void setupBoard() {for (int c=0; c<rowSize; c++) for (int r=0; r<columnSize; r++) board[r][c] = back;}  
  boolean free(int row, int column) {return row >= 0 && column >= 0 && row < columnSize && column < rowSize &&
                                            board[row][column] == back;}

Tile falling;

void drawBoard() {
  stroke(fore);
  for (int c=0; c<rowSize; c++) for (int r=0; r<columnSize; r++)
    drawCell(r, c, board[r][c]);
  falling.display();
}
    
void settings() {
  size(rowSize * cellSize, columnSize * cellSize);
}

void setup() {
  setupBoard();
  frameRate(framesPerSec);
  
  falling = new Tile(TileType.O);
  drawBoard();
}

void drawCell(int row, int column, color c) {
  fill(c);
  rect(column * cellSize, row * cellSize, cellSize, cellSize);
}

int frameNumber = 0;
boolean fastMode = false;

void draw() {
  if ((frameNumber++ % framesPerDrop == 0 || fastMode && frameNumber % framesPerFastDrop == 0) && !falling.verticalDrop())
    falling = new Tile(TileType.O);
  drawBoard();
}

void keyPressed() {
  if (keyCode == LEFT)
    falling.horizontalShift(-1);
  else if (keyCode == RIGHT)
    falling.horizontalShift(1);
  else if (keyCode == DOWN)
    fastMode = true;
}

void keyReleased() {
  if (keyCode == DOWN)
    fastMode = false;
}
