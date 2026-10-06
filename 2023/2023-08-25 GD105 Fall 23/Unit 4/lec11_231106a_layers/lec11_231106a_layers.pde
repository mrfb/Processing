PImage ravioli;
PGraphics mask;

void setup(){
  size(1024, 1024);
  ravioli = loadImage("ravioli-cutout.png");
  
  ravioli.filter(THRESHOLD, 0.50);
  ravioli.resize(width, height);
  
  mask = createGraphics(width, height);
}

void draw(){
  mask.beginDraw();
  mask.background(255);
  mask.fill(0);
  mask.circle(512 + cos(frameCount * .03) * 256, 512 + sin(frameCount * .03) * 256, 50);
  mask.endDraw();
  
  if(frameCount == 1){
    mask.get().save("mask.png");
  }
  
  
  
  background(#ffbf00);
  ravioli.mask(mask.get());
  image(ravioli, 0, 0);
}
