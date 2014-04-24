Player ship;


//==============================SETUP=======================
void setup() {
  size(400, 500);
  background(0,0,0);
  
  
  ship = new Player();
  ship.Player();
}



//==============================DRAW========================
void draw() {
  background(0,0,0);
  
  
  ship.you();
  ship.youmove();
}
