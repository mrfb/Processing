void setup() {
  size(1000, 1000);
  rectMode(CENTER);
}

void draw() {
  background(255);
  translate(width/2, width/2);
  noStroke();
  fill(#0f3610, 12);
  for(int i = 0; i < 44; i++){
    square(-138, 0, 1405);
    translate(49, 0);
    rotate(-0.05);
  }
  
  resetMatrix();
  translate(width/2, width/2);
  stroke(#ffffff);
  for(int i = 0; i < 100; i++){
    line(-495, -236, -720, 885);
    translate(49, 0);
    rotate(-0.05);
  }
  
  resetMatrix();
  translate(width/2, width/2);
  stroke(#ffffff);
  for(int i = 0; i < 100; i++){
    line(-495, -236, -720, 885);
    translate(49, 0);
    rotate(-0.05);
  }
}
