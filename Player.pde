class Player {
  float x;
  float y;
  float speed;
  int score;
  int addscore;
  
  void Player() {
    x = mouseX;
    y = mouseY;
    speed = 5;
    score = 0;
    addscore = 1;
  }
  
  void you() {
    fill(255);
    ellipse(x, y, 10, 10);
  }
  
  void youmove() {
    x = mouseX;
    y = mouseY;
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
    x = mouseX;
    y = mouseY;
  }
}
