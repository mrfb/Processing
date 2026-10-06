PImage cats;

void setup(){
  size(500, 500);
  cats = loadImage("cats.jpg");
  imageMode(CENTER);
}


void draw(){
  background(255);
  plopImage(cats, 476, 366 + sin(frameCount * 0.01)*50, TAU * -0.1, 3.3);
  
  noStroke();
  fill(255);
  circle(50, 50, 50);
  fill(254);
  circle(50, 75, 50);
  
}
