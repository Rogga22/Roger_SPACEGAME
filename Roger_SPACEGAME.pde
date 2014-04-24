Player ship;
int rockcount = 30;
Asteroid[] asts = new Asteroid[rockcount];


//==============================SETUP=======================
void setup() {
  size(400, 500);
  background(0,0,0);
  
  
  ship = new Player();
  ship.Player();
  
  
  for(int i = 0; i < rockcount; i++) {
    asts[i] =  new Asteroid();
    asts[i].Asteroid();
  }
  
}



//==============================DRAW========================
void draw() {
  background(0,0,0);
  
  
  ship.you();
  ship.youmove();
  
  for(int i = 0; i < rockcount; i++) {
    asts[i].ahitbox();
    asts[i].movespace();
    asts[i].spacedrop();
  }
}
