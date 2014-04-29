import controlP5.*;


Player ship;
int rockcount = 30;
Asteroid[] asts = new Asteroid[rockcount];

boolean START;
boolean startmenu;
boolean gameover;


boolean gethit;
int lives;

PFont textstuff;

ControlP5 cp5;

//==============================SETUP=======================
void setup() {
  textstuff = loadFont("BrowalliaNew-48.vlw");
  size(400, 500);
  background(0,0,0);
  
  gethit = false;
  lives = 1;
  
  ship = new Player();
  ship.Player();
  
  
  for(int i = 0; i < rockcount; i++) {
    asts[i] =  new Asteroid();
    asts[i].Asteroid();
  }
  
  startmenu = true;
  gameover = false;
  
  cp5 = new ControlP5(this);

}



//==============================DRAW========================
void draw() {
  background(0);
  
  //========================START MENU=================================
  if (startmenu) {
    amenu();
  } else {
    gameOn();
  }
  
}


//===========================COLLISIONS======================================================================================================
boolean collide( float x1, float y1, float x2, float y2 ) {
  float distance = dist(x1, y1, x2, y2);
  int hitbox = 10;
  if (distance <= hitbox) {
    return true;
  } else {
    return false;
  }
}


//============================GAME STUFF=======================================
void gameOn() {
  if( lives > 0) {
    ship.you();
    ship.youmove();
    ship.scoring();
  }
  
  for(int i = 0; i < rockcount; i++) {
    asts[i].ahitbox();
    asts[i].movespace();
    asts[i].spacedrop();
    
    gethit = collide( ship.x, ship.y, asts[i].x, asts[i].y);
    if (gethit) {
      background(255);
      lives = lives - 1;
    }
  }
  
  //======================Score===========================
  textFont(textstuff, 19);
  fill(255, 215, 10);
  text("Score: " + ship.score, 10, 10);  
}

void amenu() {
  textFont(textstuff, 30);
  text( "SPACE GAME", 130, 150);
  cp5.addToggle("START", false, 180, 200, 40, 40);
  
  if (START) {
    startmenu = false;
  }
}
