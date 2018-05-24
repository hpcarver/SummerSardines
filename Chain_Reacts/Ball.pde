class Ball {
  float r;
  float g;
  float b; 
  
  float x;
  float y;
  float speed;
  
  
  Ball() {
    r = random(255);
    g = random(255);
    b = random(255);
    
    x = random(600);
    y = random(600);
    speed = 10;
  
  }
  
  void move() {
    x = x + speed;
    y = y + speed;
    if (x > width || y > width || x < 0 || y < 0 ) {
      speed *= -1;
    }
  }
  
  void display() {
    fill(r,g,b);
    ellipse(x,y,30,30);
  }
}