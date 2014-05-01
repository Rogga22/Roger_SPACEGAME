class Points {
  float x;
  float y;
  float speed;
  
  void Points() {
    x = random(20, 580);
    y = random(-500, -200);
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
    
    if(y > 900) {
      y = -5;
      x = random(20, 380);
    }
  }
  
  void reset() {
    x = random(20, 380);
    y = random(-500, -200);
  }
  
}
