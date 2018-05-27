//Team SummerSardines - Cheryl Qian, Henry Carver, Selina Zou
//APCS pd2
//HW #53 -- All That Bouncin’ 
//2018-05-24


int numBalls;
int total;
int rad = 10;
int x;
int y;
int clickCount=0;
Ball[] b;

int max = 100;

void setup() {
  size(600, 600);
  background(255);
  numBalls = 0;
  total = (int)random(10) + 25;
  b = new Ball[total];

  for (int i = 0; i < total; i++) {
    b[i] = new Ball();
  }
}

void draw() {
  clear();
  if (clickCount>0 && rad <= max ) {
    rad++;
    ellipse(x, y, rad, rad);
  }

  if (clickCount>0 && rad > max) {
    rad *= -1;
    ellipse(x, y, rad, rad);
  }

  for ( Ball c : b ) {
    if ( ((c.x) - x) * ((c.x) -x) + ((c.y) -y) * ((c.y) - y) <= rad * rad ) {
      c.die();
      new growthBall(c.x, c.y);
    }
    c.move();
    c.display();
  }
}

void mouseClicked() {
  clickCount++;
  x = mouseX;
  y = mouseY;
}