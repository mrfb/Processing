void setup(){
  size(1024, 1024);
}

void draw(){
  background(255);
  PVector A = new PVector(256, 256);
  PVector B = new PVector(700, 700);
  
  stroke(#0000aa);
  strokeWeight(16);
  point(A.x, A.y);
  point(B.x, B.y);
  strokeWeight(12);
  line(A.x, A.y, B.x, B.y);
  
  stroke(#ff0000);
  float interpolation = 0.00;
  
  strokeWeight(8);
  point(lerp(A.x, B.x, interpolation),
        lerp(A.y, B.y, interpolation));
  
}
