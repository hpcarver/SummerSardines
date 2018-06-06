//int rectX, rectY;
//color rectColor;
//color rectHighlight; 
//boolean onRect = false; //If mouse on rectangle, true. Otherwise, false
//PFont font;

//void setup() {
//  font = createFont("Arial Bold", 18);
//  size(1500, 900);
//  background(50);
//  fill(255);
//  textSize(200);
//  text("TETRIS", 400, 250);
//  textSize(25);
//  text("Cheryl Qian, Henry Carver, Selina Zou", 500, 300);
//}

//void draw() {

//  if (onRect()) 
//    fill(color(205));
//  else 
//  fill(color(255));

//  stroke(255);
//  rect(200, 450, 400, 300);
//  rect(900, 450, 400, 300);
//  fill(50);
//  textFont(font);
//  textAlign(CENTER, CENTER);
//  textSize(65);
//  text("One Player Mode", 200, 450, 400, 300);
//  text("Two Player Mode", 900, 450, 400, 300);
//}

////void mousePressed() {
////  if (onRect())

////}

//boolean onRect() {
//  if (mouseX >= 200 && mouseX <= 600 && mouseY >= 450 && mouseY <= 750
//    ||mouseX >= 900 && mouseX <= 1300 && mouseY >= 450 && mouseY <=750) 
//    return true;
//  else 
//  return false;
//}
Tetromino t = new Tetromino(6,0,100,100);
void setup() {
  size(1500, 900);
  background(0);
}

void draw() {
  t.display();
}
