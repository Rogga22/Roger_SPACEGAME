class Asteroid {
  float x;
  float y;
  float xspeed;
  float yspeed;


  void Asteroid() {
    x = random(10, 590);
    y = random(-750, -50);
    xspeed = random(-3, 3);
    yspeed = 5;
  }

  void ahitbox() {
    fill(150);
    ellipse(x, y, 20, 20);
  }


  void movespace() {
    x =  x + xspeed;
    if ( x >= 600 || x <= 0) {
      xspeed = -xspeed;
    }
  }

  void spacedrop() {
    y = y + yspeed;
    if ( y >= 730 ) {
      x = random(10, 590);
      y = random(-10, -100);
      xspeed = random(-3, 3);
    }
  }

  void reset() {
    x = random(10, 590);
    y = random(-750, -50);
    xspeed = random(-3, 3);
  }
}

