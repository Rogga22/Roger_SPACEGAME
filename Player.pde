class Player {
  float x;
  float y;
  float speed;
  int score;
  int addscore;
  
  void Player() {
    x = 200;
    y = 450;
    speed = 5;
    score = 0;
    addscore = 1;
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
  
  void scoring() {
    score = score + addscore;
    if( y > 200 ) {
      addscore = 1;
    }
    if( y <= 200 ) {
      addscore = 10;
    }
  }
  
  
  void reset() {
    x = 200;
    y = 450;
  }
}
