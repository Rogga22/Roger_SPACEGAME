import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer levelup;
AudioPlayer level1;
AudioPlayer level2;
AudioPlayer level3;
AudioPlayer level4;

Player ship;

int rockcount = 45;
Asteroid[] asts = new Asteroid[rockcount];

Points collect;
boolean item;

boolean gethit;
int lives;

boolean startthegame;

PFont textstuff;


//==============================SETUP=======================
void setup() {
  textstuff = loadFont("BrowalliaNew-48.vlw");
  size(600, 700);
  background(0, 0, 0);

  gethit = false;
  lives = 1;

  ship = new Player();
  ship.Player();
  
  collect = new Points();
  collect.Points();
  item = false;

  for (int i = 0; i < rockcount; i++) {
    asts[i] =  new Asteroid();
    asts[i].Asteroid();
  }

  startthegame = false;
  
  
  
  // =====Sound stuff==========
  
  minim = new Minim(this);
  levelup = minim.loadFile("Transition.wav");
  level1 = minim.loadFile("Level1.wav");
  level2 = minim.loadFile("Level2.wav");
  level3 = minim.loadFile("Level3.wav");
  level4 = minim.loadFile("Level4.wav");
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
boolean collide( float x1, float y1, float x2, float y2, float r ) {
  float distance = dist(x1, y1, x2, y2);
  float hitbox = r;
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
    collect.drawpoint();
    collect.pointdrop();

    for (int i = 0; i < rockcount; i++) {
      asts[i].ahitbox();
      asts[i].movespace();
      asts[i].spacedrop();

      gethit = collide( ship.x, ship.y, asts[i].x, asts[i].y, 10);
      if (gethit) {
        background(255);
        lives = lives - 1;
      }
      

    }
    
    item = collide( ship.x, ship.y, collect.x, collect.y, 5);
    if (item) {
      ship.score = ship.score + 1000;
      collect.reset();
      }
    
    //===================Playing sounds==============================
    if ( ship.score == 1) {
      levelup.play();
      level1.loop();
      levelup.rewind();
    } else if( ship.score >= 1000 && item) {
      level1.pause();
      levelup.play();
      level2.loop();
      levelup.rewind();
    } else if (ship.score >= 10000 && item) {
      level2.pause();
      levelup.play();
      level3.loop();
      levelup.rewind();
    } else if (ship.score == 100000 && item) {
      level3.pause();
      levelup.play();
      level4.loop();
      levelup.rewind();
    }
    
    
  } 
  //======================= GAME OVER===========================================================
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
      collect.reset();
      for (int i = 0; i < rockcount; i++) {
        asts[i].reset();
      }
    }
  }
  
  
}

