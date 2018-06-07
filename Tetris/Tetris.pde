//void setup() {
//  size(470, 720);
//  background(0);
//  next = 0;
//  for ( int i = 0; i < 10; i ++ ) {
//     //t.add(new Tetromino((int)random(7), (int)random(4), 225,0)); 
//  }
//  //Grid g = new Grid();
//}

//void draw() {
//  clear();
//  //t.get(next).display();
//  //for ( Tetromino tet : u ) {
//    // tet.display(); 
//  //}
//  //if ( t.get(next).stopped() ) {
//    //u.add(t.get(next));
//    //g.add(t.get(next));
//    //next++;
//  //}
//  //else {
//    //t.get(next).drop(); 
//  //}
//  Game();
//}


//void keyPressed() {
//  if ( key == 'a' ) {
//    //t.get(next).moveLeft();
//  }
//  if (key == 'd' ) {
//    //t.get(next).moveRight(); 
//  }
//  if (key == 'w' ) {
//    //t.get(next).rotate(); 
//  }

//}

// void Game() {
//   clear();
//   stroke(#FFFFFF);
//   strokeWeight(5);
//   rect(10,10,450,700);
//   fill(#C9D620);
//   rect(10,10,450,50);
//   fill(#020531);
//   textSize(10);
//   text("SCORE: 0",300,40); //0 will be replaced by a getScore method
//   text("LEVEL: 1",100,40); //1 will be replaced by a getLevel method
// }
 
// //int rectX, rectY;
////color rectColor;
////color rectHighlight; 
////boolean onRect = false; //If mouse on rectangle, true. Otherwise, false
////PFont font;

////void setup() {
////  font = createFont("Arial Bold", 18);
////  size(1500, 900);
////  background(50);
////  fill(255);
////  textSize(200);
////  text("TETRIS", 400, 250);
////  textSize(25);
////  text("Cheryl Qian, Henry Carver, Selina Zou", 500, 300);
////}

////void draw() {

////  if (onRect()) 
////    fill(color(205));
////  else 
////  fill(color(255));

////  stroke(255);
////  rect(200, 450, 400, 300);
////  rect(900, 450, 400, 300);
////  fill(50);
////  textFont(font);
////  textAlign(CENTER, CENTER);
////  textSize(65);
////  text("One Player Mode", 200, 450, 400, 300);
////  text("Two Player Mode", 900, 450, 400, 300);
////}

////boolean onRect() {
////  if (mouseX >= 200 && mouseX <= 600 && mouseY >= 450 && mouseY <= 750
////    ||mouseX >= 900 && mouseX <= 1300 && mouseY >= 450 && mouseY <=750) 
////    return true;
////  else 
////  return false;
////}

String title;
PShape buttonA,buttonB,buttonC;
boolean start = false;

void setup() {
  size(450,700);
  background(0);
  noFill();
  stroke(0,252,200);
  strokeWeight(20);
  rect(0,0,450,700);
  

 
  fill(252);
  textSize(65);
  text("T E T R I S",75, 175);
  
 
  strokeWeight(10);
  stroke(200);
  fill(252);
  
  buttonA = createShape(RECT,100,250, 260, 80);
  buttonB = createShape(RECT,100,375, 260, 80);
  buttonC = createShape(RECT,100,500, 260, 80);
  

}

void draw() {
  if ( start ) {
    Game(); 
  }
  else {
   menu(); 
  }
  
  
}

void mouseClicked() {
   if ( mouseX > 100 && mouseX < 360 && mouseY > 250 && mouseY < 330 ||
   mouseX > 100 && mouseX < 360 && mouseY > 375 && mouseY < 455  
|| mouseX > 100 && mouseX < 360 && mouseY > 500 && mouseY < 580 ) {
    start = true;
  }   
}

 void Game() {
   clear();
   stroke(#FFFFFF);
   strokeWeight(5);
   rect(10,10,430,680);
   fill(#C9D620);
   rect(10,10,430,50);
   fill(#020531);
   textSize(10);
   text("SCORE: 0",300,40); //0 will be replaced by a getScore method
   text("LEVEL: 1",100,40); //1 will be replaced by a getLevel method
 }
 
 void menu() {
  buttonA.setFill(252);
  buttonB.setFill(252);
  buttonC.setFill(252);

  if ( mouseX > 100 && mouseX < 360 && mouseY > 250 && mouseY < 330 ) {
    buttonA.setFill(230);
  }
  else if ( mouseX > 100 && mouseX < 360 && mouseY > 375 && mouseY < 455 ) {
    buttonB.setFill(230);
  }
  else if ( mouseX > 100 && mouseX < 360 && mouseY > 500 && mouseY < 580 ) {
    buttonC.setFill(230);
  }  

 
  shape(buttonA);
  shape(buttonB);
  shape(buttonC);
  
  textSize(25);
  fill(0);
  PFont f = createFont("GOST Common",25);
  textFont(f);
  text("  One Player Mode", 125,300);
  text("  Two Player Mode", 125,425);
  text("       Scoreboard", 125,550); 
 }
