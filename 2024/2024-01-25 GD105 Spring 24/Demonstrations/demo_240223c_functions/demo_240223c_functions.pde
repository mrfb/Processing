void setup(){
  size(1024, 1024);
  background(255);
  frameRate(5);
}

void draw(){
  PVector start = randomPoint();
  PVector end = randomPoint();
  color c = randomColor();
  
  drawLine(start, end, c);
}

void drawLine(PVector A, PVector B, color ink){
  strokeWeight(5);
  strokeCap(SQUARE);
  stroke(#ffffff);
  line(A.x + 2, A.y + 2, B.x + 2, B.y + 2);
  stroke(ink);
  line(A.x, A.y, B.x, B.y);
}

color randomColor(){
  return color(random(128, 255), random(128, 255), random(128, 255));
}

PVector randomPoint(){
  return new PVector(random(width), random(height));
}
