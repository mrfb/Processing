int numColors = 8;

Palette circlePalette, squarePalette;

void setup(){
  //randomSeed(1);
  //frameRate(60);
  size(666,666);
  colorMode(HSB, 1);
  noStroke();
  
  circlePalette = new Palette(16);
  squarePalette = new Palette(4);
  
  background(circlePalette.c[0]);
}

void draw(){
  // draw shapes
  PVector pos = new PVector(random(width), random(height));
  fill(circlePalette.getColor());
  ellipse(pos.x, pos.y, 50, 50);
}