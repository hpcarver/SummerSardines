int frameNumber = 0;
boolean fastMode = false;
boolean holdMode = false;
boolean gameOver = false;
int rowsCleared = 0;
int level = 0; //max level 10
int score = 0;
String playerName = "Selina";
Tile current;
List<TileType> nextTiles = new LinkedList<TileType>();
  void addToQueue(int num) {while (num --> 0) nextTiles.add(TileType.values()[new Random().nextInt(TileType.values().length)]);}