class Player {
  int playx;
  int playy;
  int xspeed;
  int yspeed;
  
  void Player() {
    playx = 200;
    playy = 450;
    xspeed = 5;
    yspeed = 5;
  }
  
  void you() {
    fill(255);
    ellipse(playx, playy, 10, 10);
  }
  
  void youmove() {
    
  }
  
}
