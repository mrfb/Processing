Turtle yertle, squirtle, gertrude;

void setup(){
  size(1000, 1000);
  frameRate(999);
  yertle = new Turtle(500, 500, #aa0000);
  yertle.weight = 1;
  
  // this number is tuned to get the final
  // pattern approximately in the center
  squirtle = new Turtle(500, 700, #0000aa);
  squirtle.weight = 2;
  
  // just to the top left of the canvas,
  // aiming directly at the center
  gertrude = new Turtle(-10, -10, #00aa00, TAU * .125);
  gertrude.weight = 1;
  
  background(255);
}

void draw(){
  // yertle makes a smaller pattern in the center
  yertle.forward(1);
  yertle.turn(sin(frameCount * .01) * .01 + TAU/200);
  
  // squirtle makes a larger pattern
  squirtle.forward(7);
  squirtle.turn(sin(frameCount * .05) * .1 + TAU/200);
  
  // gertrude does whatever the fuck she wants
  float turniness = .05;
  gertrude.forward(3);
  gertrude.turn(random(-TAU * turniness * .5, TAU * turniness * .5));
}
