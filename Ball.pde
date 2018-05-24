//
//
//
//

float xcor;
float ycor;
float speedx;
float speedy;


void createBall() {
    xcor = random(0, 600);
    ycor = random(0, 600);
    ellipse(xcor, ycor, 10, 10);
    color c = color(random(255), random(255), random(255));
    fill(c);
    speedx = random(1, 20);
    speedy = random(1, 20);
}

void moveBall() {
  xcor += speedx;
  ycor += speedy;
  if (xcor >= 590 || xcor <= 10) {
    speedx *= -1;
  }
  if (ycor >= 590 || ycor <= 10) {
    speedy *= -1;
  }
}
