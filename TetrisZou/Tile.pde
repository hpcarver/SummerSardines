import java.util.*;

class Tile {
  TileType type;
  int row = startRow;
  int column = startColumn;
  int shapeNum = 0;
  int[][] shape;
  
  void display() {
    for (int dr = 0; dr < 4; dr++) for (int dc = 0; dc < 4; dc++)
      if (type.shape[dr][dc] == 1)
        drawCell(row + dr, column + dc, type.hue);
  }
  
  Tile(TileType type) {
    this.type = type;
    this.shape = type.shapes.get(shapeNum);
  }
  
  boolean collides() {
    for (int dr = 0; dr < 4; dr++) for (int dc = 0; dc < 4; dc++)
      if (type.shape[dr][dc] == 1 && !free(row + dr, column + dc))
        return true;
    return false;
  }
  
  void rotate() {
    shapeNum = (shapeNum + 1) % 4
    shape = type.shapes.get(shapeNum);
  }
  
  void land() {
    for (int dr = 0; dr < 4; dr++) for (int dc = 0; dc < 4; dc++)
      if (type.shape[dr][dc] == 1)
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
      return false;
    }
    return true;
  }
} 

enum TileType {
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
     {0, 0, 0, 0}});
     
  color hue;
  List<int[][]> shapes = new LinkedList<int[][]>();
  
  
  private TileType(color hue, int[][] shape0, int[][] shape1, int[][] shape2, int[][] shape3) {
    this.hue = hue;
    shapes.add(shape3);
    shapes.add(shape2);
    shapes.add(shape1);
    shapes.add(shape0);
  }
}
