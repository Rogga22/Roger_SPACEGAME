class Asteroid {
  float x;
  float y;
  float xspeed;
  float yspeed;
  
  
  void Asteroid() {
    x = random(40, 400);
    y = random(-600, -50);
    xspeed = random(-4,4);
    yspeed = 5;
  }
  
  void ahitbox() {
    fill(150);
    ellipse(x, y, 20, 20);
  }
  
  
  void movespace() {
    x =  x + xspeed;
    if( x >= 400 || x <= 0) {
      xspeed = -xspeed;
    }
  }
  
  void spacedrop() {
    y = y + yspeed;
    if( y >= 530 ) {
    x = random(40, 400);
    y = random(-50, -100);
    xspeed = random(-4,4);
    }
  }
  
  void reset() {
    x = random(40, 400);
    y = random(-600, -50);
    xspeed = random(-5,5);    
  }
}
