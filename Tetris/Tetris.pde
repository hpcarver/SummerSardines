int rectX, rectY;
color rectColor;
color rectHighlight; 
boolean onRect = false; //If mouse on rectangle, true. Otherwise, false
PFont font;

void setup() {
  font = createFont("Arial Bold", 18);
  size(1500, 900);
  background(50);
  fill(255);
  textSize(200);
  text("TETRIS", 400, 250);
  textSize(25);
  text("Cheryl Qian, Henry Carver, Selina Zou", 500, 300);
}

void draw() {

  if (onRect()) 
    fill(color(205));
  else 
  fill(color(255));

  stroke(255);
  rect(200, 450, 400, 300);
  rect(900, 450, 400, 300);
  fill(50);
  textFont(font);
  textAlign(CENTER, CENTER);
  textSize(65);
  text("One Player Mode", 200, 450, 400, 300);
  text("Two Player Mode", 900, 450, 400, 300);
}

//void mousePressed() {
//  if (onRect())

//}

boolean onRect() {
  if (mouseX >= 200 && mouseX <= 600 && mouseY >= 450 && mouseY <= 750
    ||mouseX >= 900 && mouseX <= 1300 && mouseY >= 450 && mouseY <=750) 
    return true;
  else 
  return false;
}

//TetrisPiece a = new TetrisPiece(1,100,100);
//TetrisPiece b = new TetrisPiece(2,100,100);
//TetrisPiece c = new TetrisPiece(3,100,100);
//TetrisPiece d = new TetrisPiece(4,100,100);
//TetrisPiece e = new TetrisPiece(5,100,100);
//TetrisPiece f = new TetrisPiece(6,100,100);
//TetrisPiece g = new TetrisPiece(7,100,100);

//void setup() {
// size(1500,900);
// frameRate(30);
// background(252);
//}

//void draw() {
//  clear();
//  a.display();
//}
