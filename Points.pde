class Points {
  float x;
  float y;
  float speed;
  
  void Points() {
    x = random(20, 380);
    y = random(-1000, -500);
    speed = 1;
  }
  
  void drawpoint() {
    fill(255, 0, 0);
    ellipse(x, y, 6, 6);
  }
  
  void pointdrop() {
    y = y + speed;
    if( y > 200 ) {
      speed = 10;
    } else {
      speed = 1;
    }
    
    if(y > 600) {
      y = -1000;
      x = random(20, 380);
    }
  }
  
  void reset() {
    x = random(20, 380);
    y = random(-1000, -500);
  }
  
}
