Class Asteroid {
  float x;
  float y;
  float xspeed;
  float yspeed;
  
  
  void Asteroid() {
    x = random(0, 400);
    y = random(-50, -100);
    xspeed = random(-5,5);
    yspeed = 5;
  }
  
  void Ahitbox() {
    fill(150);
    ellipse(x, y, 20, 20);
  }
  
  
  void movespace() {
    x =  x + xspeed;
    if( x >= 400 || x <= 0) {
      xspeed = -xspeed;
    }
    y = y + yspeed;
  }
  
}
