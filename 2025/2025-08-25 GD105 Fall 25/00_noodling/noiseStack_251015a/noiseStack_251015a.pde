import processing.svg.*;

void setup(){
  size(900, 900);
  background(255);
  beginRecord(SVG, "plot.svg");
}

void draw(){
  int cell = width / 9;
  int lineRadius = 13;
  for(int y = cell; y < height; y += cell){
    for(int x = cell; x < width; x += cell){
      resetMatrix();
      translate(x, y);
      float theta = noise(x * .002, y * .001, frameCount * 0.04);
      theta = map(theta, 0, 1, -TAU, TAU);
      rotate(theta);
      line(-lineRadius, 0, lineRadius, 0);
    }
  }
  if(frameCount == 5){
    noLoop();
    endRecord();
  }
}
