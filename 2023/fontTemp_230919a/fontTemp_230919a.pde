// declare global variables
PImage background, cat, ultraman;

void setup(){
  size(960, 854);
  background = loadImage("highlands.png");
  cat = loadImage("cat.png");
  ultraman = loadImage("ultraman.png");
}

void draw(){ 
  image(background, 0, 0);
  
  scale(0.35);
  translate(-47, 372);
  rotate(0.00);
  image(cat, 0, 0);
  resetMatrix();
  
  scale(0.3);
  translate(2455, 1383);
  rotate(0.03);
  image(ultraman, 0, 0);
  
  save("output.png");
  noLoop();
}
