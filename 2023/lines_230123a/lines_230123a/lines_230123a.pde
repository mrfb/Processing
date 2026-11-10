void setup() {
  // The code in this block will run once at the start.
  size(1000, 1000);
  
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  colorMode(HSB, 360, 100, 100);
  
}

void draw() {
  // The code in this block will run once per frame.
  background(0, 0, 100);
  
  noStroke();
  fill(50, 85, 85, 75);
  square(333, 500, 500);
  fill(170, 85, 85, 75);
  circle(500, 333, 600);
  fill(290, 85, 85, 75);
  circle(666, 666, 400);
  
  stroke(#397ee5);
  strokeWeight(100);
  point(666, 666);
  line(333, 500, 500, 333);
}
