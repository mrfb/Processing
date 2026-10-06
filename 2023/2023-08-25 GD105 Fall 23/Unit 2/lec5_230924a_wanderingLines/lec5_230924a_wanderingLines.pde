// A demonstration of motion for a kind of "screensaver" for my students
// This program has four points randomly moving, and
// draws two lines between them. Their colors slowly change over time.
// — mrfb 20230924

PVector A, B, C, D;
float ABhue, CDhue;

void setup(){
  fullScreen();
  background(255);
  
  A = new PVector(0, 0);
  B = new PVector(0, 0);
  C = new PVector(0, 0);
  D = new PVector(0, 0);
  
  colorMode(HSB, 360, 1, 1);
  
  // this is a hue on the color wheel for the AB line and the CD line
  ABhue = 0;
  CDhue = 180;
  
  // I've turned off smoothing because I think it looks more interesting.
  noSmooth();
}

void draw(){
  // our origin point is the center of the screen
  translate(width/2, height/2);
  
  // draw a white line just to the left first
  stroke(#FFFFFF);
  line(A.x - 1, A.y, B.x - 1, B.y);
  line(C.x - 1, C.y, D.x - 1, D.y);
  
  // then draw a line at our actual point
  // the color of the lines will randomly walk the color wheel
  float hueWanderlust = 0.05;
  ABhue += random(hueWanderlust);
  ABhue %= 360;
  CDhue += random(hueWanderlust);
  CDhue %= 360;
  
  // set the pen color, draw the line
  // these are saturated, but dark colors
  // that look vaguely ballpoint pen-y
  stroke(ABhue, 1.00, 0.35);
  line(A.x, A.y, B.x, B.y);
  stroke(CDhue, 1.00, 0.35);
  line(C.x, C.y, D.x, D.y);
  
  // random walk each point
  // we can control a lot about the general character of the
  // drawing by changing these scalar values--these cause points
  // to favor or disfavor moving in a particular direction
  float wanderlust = height / 256;
  println("wanderlust: " + wanderlust);
  A.x += random(wanderlust * -1.0, wanderlust * 1.0);
  A.y += random(wanderlust * -1.0, wanderlust * 1.0);
  B.x += random(wanderlust * -1.0, wanderlust * 1.0);
  B.y += random(wanderlust * -1.0, wanderlust * 1.0);
  C.x += random(wanderlust * -1.0, wanderlust * 1.0);
  C.y += random(wanderlust * -1.0, wanderlust * 1.0);
  D.x += random(wanderlust * -1.0, wanderlust * 1.0);
  D.y += random(wanderlust * -1.0, wanderlust * 1.0);
  
  // snap back to the center line if the points go off-canvas
  A.x %= width/2;
  A.y %= height/2;
  B.x %= width/2;
  B.y %= height/2;
  C.x %= width/2;
  C.y %= height/2;
  D.x %= width/2;
  D.y %= height/2;
  
}
