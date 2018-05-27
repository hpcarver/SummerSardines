class Ball {
  float r;
  float g;
  float b; 

  float x;
  float y;
  float speedX;
  float speedY;
  int rad;
  int type =-1;


  Ball() {
    r = random(255);
    g = random(255);
    b = random(255);

    x = random(600);
    y = random(600);
    speedX = random(10);
    speedY = random(10);
    rad = 30;
  }

  void move() {
    x = x + speedX;
    y = y + speedY;
    if (x > width || x < 0 ) {
      speedX *= -1;
    }
    if (y > width || y < 0 ) {
      speedY *= -1;
    }
  }

  void display() {
    fill(r, g, b);
    ellipse(x, y, rad, rad);
  }
  void die() {
    speedX = 0;
    speedY = 0;
  }
}