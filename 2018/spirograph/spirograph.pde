float x1, y1, x2, y2;
float r = random(1, 100);

void setup(){
  size(666,666);
  x1 = random(-width/2, width/2);
  x2 = random(-width/2, width/2);
  y1 = random(-height/2, height/2);
  y2 = random(-height/2, height/2);
}

void draw(){
  noStroke();
  fill(0,0,1,.5);
  rect(0,0,width,height);
  translate(width/2, height/2);
  rotate(frameCount / r);
  stroke(0);
  line(x1, y1, x2, y2);
}
