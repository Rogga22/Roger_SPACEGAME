Player ship;
int rockcount = 30;
Asteroid[] asts = new Asteroid[rockcount];


boolean gethit;
int lives;

boolean startthegame;

PFont textstuff;


//==============================SETUP=======================
void setup() {
  textstuff = loadFont("BrowalliaNew-48.vlw");
  size(400, 500);
  background(0, 0, 0);

  gethit = false;
  lives = 1;

  ship = new Player();
  ship.Player();


  for (int i = 0; i < rockcount; i++) {
    asts[i] =  new Asteroid();
    asts[i].Asteroid();
  }

  startthegame = false;
}



//==============================               DRAW        ======================================================
void draw() {
  background(0, 0, 0);

  if (startthegame) {
    gameOn();
  } 
  else {
    amenu();
  }



  //======================Score===========================
  textFont(textstuff, 19);
  fill(255, 215, 10);
  text("Score: " + ship.score, 10, 10);
}


//===========================COLLISIONS======================================================================================================
boolean collide( float x1, float y1, float x2, float y2 ) {
  float distance = dist(x1, y1, x2, y2);
  int hitbox = 10;
  if (distance <= hitbox) {
    return true;
  } 
  else {
    return false;
  }
}



//============================START MENU=====================================================================

void amenu() {
  textFont(textstuff, 30);
  fill(255, 215, 10);
  text("SPACE GAME BETA", 100, 100);
  text("CLICK ANYWHERE TO BEGIN", 60, 150);

  if (mousePressed == true) {
    startthegame = true;
  }
}


//===========================GAME STUFF======================================================================

void gameOn() {

  if ( lives >= 1) {
    ship.you();
    ship.youmove();
    ship.scoring();

    for (int i = 0; i < rockcount; i++) {
      asts[i].ahitbox();
      asts[i].movespace();
      asts[i].spacedrop();

      gethit = collide( ship.x, ship.y, asts[i].x, asts[i].y);
      if (gethit) {
        background(255);
        lives = lives - 1;
      }
    }
  } 
  else if ( lives < 1) {
    textFont(textstuff, 60);
    fill(255, 215, 10);
    text("YOU ARE DEAD", 70, 150);
    textFont(textstuff, 25);
    text("Your score: " + ship.score, 80, 300);
    
    if (mousePressed) {
      ship.score = 0;
      lives = 1;
      ship.reset();
      for (int i = 0; i < rockcount; i++) {
        asts[i].reset();
      }
    }
  }
}

