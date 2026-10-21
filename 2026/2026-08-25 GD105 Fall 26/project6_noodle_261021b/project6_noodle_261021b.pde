color sqFill = #000000;

void setup(){
  size(1000, 1000);
  rectMode(CENTER);
  
  noStroke();
  background(#000000);
}

void draw(){
  fill(#FFFFFF, 25);
  square(width/2, height/2, width * 1.1);
  
  translate(width/2, height/2);
  
  float rotationAmount = sin(frameCount * 0.01) * TAU * 2;
  float size = map(noise(frameCount * 0.01), 0, 1, width * .2, width * .8);
  rotate(rotationAmount);
  
  color randomColor = color(random(255), random(255), random(255));
  sqFill = lerpColor(sqFill, randomColor, 0.01);

  fill(sqFill);
  
  square(0, 0, size);
}
