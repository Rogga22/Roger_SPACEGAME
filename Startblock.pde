class Startblock {
  int xval;
  int yval;
  int rangex;
  int rangey;
  boolean start;
  
  void Startblock() {
   xval = 150;
   yval = 200;
   rangex = 100;
   rangey = 50;
   start = false;
  }
  
  void drawstart() {
   if(( mouseX > xval && mouseX < rangex) && (mouseY > yval && mouseY < rangey)) {
     fill(250);
   } else {
     fill(200);
   }
   rect( xval, yval, rangex, rangey);
  }
  
  void click() {
    if(( mouseX > xval && mouseX < rangex) && (mouseY > yval && mouseY < rangey)) {
      if (mousePressed) {
        start = true;
      }
    }
  }
  
  
}
