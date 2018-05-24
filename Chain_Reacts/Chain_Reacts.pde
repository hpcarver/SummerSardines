//Team SummerSardines - Cheryl Qian, Henry Carver, Selina Zou
//APCS pd2
//HW #53 -- All That Bouncin’ 
//2018-05-24

int numBalls;
int total;
Ball[] b;

void setup() {
  size(600,600);
  background(255);
  numBalls = 0;
  total = (int)random(10) + 25;
  b = new Ball[total];
  
  for(int i = 0; i < total; i++) {
    b[i] = new Ball();
  }
}

void draw() {
     clear();
     for ( Ball c: b ) {
     c.move();
     c.display();
     }
}
