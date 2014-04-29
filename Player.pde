class Player {
  float x;
  float y;
  float speed;
  
  void Player() {
    x = 200;
    y = 450;
    speed = 5;
  }
  
  void you() {
    fill(255);
    ellipse(x, y, 10, 10);
  }
  
  void youmove() {
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == LEFT && x > 10) {
          x = x - speed;
        } 
        if (keyCode == RIGHT && x < 390 ) {
          x = x + speed;
        }
        if (keyCode == UP && y > 5) {
          y = y - speed;
        }
        if (keyCode == DOWN && y < 495) {
          y = y + speed;
        }
      }
    }
  }
  
}
