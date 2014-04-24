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
  
  boolean gethit;
  
  ship.you();
  ship.youmove();
  
  for(int i = 0; i < rockcount; i++) {
    asts[i].ahitbox();
    asts[i].movespace();
    asts[i].spacedrop();
    
    gethit = collide( ship.x, ship.y, asts[i].x, asts[i].y);
    if (gethit) {
      background(255);
    }
    
  }
  
  
  
}


//===========================COLLISIONS===============
boolean collide( float x1, float y1, float x2, float y2 ) {
  float distance = dist(x1, y1, x2, y2);
  int hitbox = 15;
  if (distance <= hitbox) {
    return true;
  } else {
    return false;
  }
}
