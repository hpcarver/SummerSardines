import java.util.*;

class Tile {
  TileType type;
  int row = startRow;
  int column = startColumn;
  int shapeNum = 0;
  int[][] shape;
  
  void display() {
    for (int dr = 0; dr < 4; dr++) for (int dc = 0; dc < 4; dc++)
      if (shape[dr][dc] == 1)//if 1, there's a cell
        drawCell(row + dr, column + dc, type.hue);//draws every cell in tile 
  }
  
  Tile(TileType type) {
    this.type = type;//set type
    this.shape = type.shapes.get(shapeNum);//set init rotation
  }
  
  boolean collides() {//checks if two tiles are overlapping
    for (int dr = 0; dr < 4; dr++) 
      for (int dc = 0; dc < 4; dc++)
        if (shape[dr][dc] == 1 && !free(row + dr, column + dc))
          return true;
    return false;
  }
  
  void rotate() {//sets tile to next rotation
    shapeNum = (shapeNum + 1) % 4;
    shape = type.shapes.get(shapeNum);
  }
  
  void land() { //color board w/ cell color once a tile lands
    for (int dr = 0; dr < 4; dr++) 
      for (int dc = 0; dc < 4; dc++)
        if (shape[dr][dc] == 1)
          board[row + dr][column + dc] = type.hue;
  }
  
  void horizontalShift(int shift) {
    column += shift;
    if (collides())
      column -= shift;
  }
  
  boolean verticalDrop() {
    row++;
    if (collides()) {
      row--;
      land();
      if (row < 2)
        gameOver = true;
      return false;
    }
    return true;
  }
  
  
} 

enum TileType { //all tile types
  O(yellow, new int[][]
    {{0, 1, 1, 0},
     {0, 1, 1, 0},
     {0, 0, 0, 0},
     {0, 0, 0, 0}}, new int[][]
    {{0, 1, 1, 0},
     {0, 1, 1, 0},
     {0, 0, 0, 0},
     {0, 0, 0, 0}}, new int[][]
    {{0, 1, 1, 0},
     {0, 1, 1, 0},
     {0, 0, 0, 0},
     {0, 0, 0, 0}}, new int[][]
    {{0, 1, 1, 0},
     {0, 1, 1, 0},
     {0, 0, 0, 0},
     {0, 0, 0, 0}}),
   J(blue, new int[][]
    {{1, 0, 0, 0},
     {1, 1, 1, 0},
     {0, 0, 0, 0},
     {0, 0, 0, 0}}, new int[][]
    {{0, 1, 1, 0},
     {0, 1, 0, 0},
     {0, 1, 0, 0},
     {0, 0, 0, 0}}, new int[][]
    {{0, 0, 0, 0},
     {1, 1, 1, 0},
     {0, 0, 1, 0},
     {0, 0, 0, 0}}, new int[][]
    {{0, 1, 0, 0},
     {0, 1, 0, 0},
     {1, 1, 0, 0},
     {0, 0, 0, 0}}),
   I(cyan, new int[][]
    {{1, 1, 1, 1},
     {0, 0, 0, 0},
     {0, 0, 0, 0},
     {0, 0, 0, 0}}, new int[][]
    {{0, 0, 1, 0},
     {0, 0, 1, 0},
     {0, 0, 1, 0},
     {0, 0, 1, 0}}, new int[][]
    {{0, 0, 0, 0},
     {0, 0, 0, 0},
     {1, 1, 1, 1},
     {0, 0, 0, 0}}, new int[][]
    {{0, 1, 0, 0},
     {0, 1, 0, 0},
     {0, 1, 0, 0},
     {0, 1, 0, 0}}),
   L(orange, new int[][]
    {{0, 0, 1, 0},
     {1, 1, 1, 0},
     {0, 0, 0, 0},
     {0, 0, 0, 0}}, new int[][]
    {{0, 1, 0, 0},
     {0, 1, 0, 0},
     {0, 1, 1, 0},
     {0, 0, 0, 0}}, new int[][]
    {{0, 0, 0, 0},
     {1, 1, 1, 0},
     {1, 0, 0, 0},
     {0, 0, 0, 0}}, new int[][]
    {{1, 1, 0, 0},
     {0, 1, 0, 0},
     {0, 1, 0, 0},
     {0, 0, 0, 0}}),
   S(green, new int[][]
    {{0, 1, 1, 0},
     {1, 1, 0, 0},
     {0, 0, 0, 0},
     {0, 0, 0, 0}}, new int[][]
    {{0, 1, 0, 0},
     {0, 1, 1, 0},
     {0, 0, 1, 0},
     {0, 0, 0, 0}}, new int[][]
    {{0, 0, 0, 0},
     {0, 1, 1, 0},
     {1, 1, 0, 0},
     {0, 0, 0, 0}}, new int[][]
    {{1, 0, 0, 0},
     {1, 1, 0, 0},
     {0, 1, 0, 0},
     {0, 0, 0, 0}}),
   T(purple, new int[][]
    {{0, 1, 0, 0},
     {1, 1, 1, 0},
     {0, 0, 0, 0},
     {0, 0, 0, 0}}, new int[][]
    {{0, 1, 0, 0},
     {0, 1, 1, 0},
     {0, 1, 0, 0},
     {0, 0, 0, 0}}, new int[][]
    {{0, 0, 0, 0},
     {1, 1, 1, 0},
     {0, 1, 0, 0},
     {0, 0, 0, 0}}, new int[][]
    {{0, 1, 0, 0},
     {1, 1, 0, 0},
     {0, 1, 0, 0},
     {0, 0, 0, 0}}),
   Z(red, new int[][]
    {{1, 1, 0, 0},
     {0, 1, 1, 0},
     {0, 0, 0, 0},
     {0, 0, 0, 0}}, new int[][]
    {{0, 0, 1, 0},
     {0, 1, 1, 0},
     {0, 1, 0, 0},
     {0, 0, 0, 0}}, new int[][]
    {{0, 0, 0, 0},
     {1, 1, 0, 0},
     {0, 1, 1, 0},
     {0, 0, 0, 0}}, new int[][]
    {{0, 1, 0, 0},
     {1, 1, 0, 0},
     {1, 0, 0, 0},
     {0, 0, 0, 0}});
     
  color hue;
  List<int[][]> shapes = new LinkedList<int[][]>();
  
  
  private TileType(color hue, int[][] shape0, int[][] shape1, int[][] shape2, int[][] shape3) {
    this.hue = hue;
    shapes.add(shape0);
    shapes.add(shape1);
    shapes.add(shape2);
    shapes.add(shape3);
  }
}
