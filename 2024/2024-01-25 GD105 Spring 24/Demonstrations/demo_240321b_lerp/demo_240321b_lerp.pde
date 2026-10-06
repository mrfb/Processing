PVector start, end;
PVector cat;

void setup(){
  size(800, 800);
  fill(random(180, 255), random(180, 255), random(180, 255));
  
  start = new PVector();
  end = new PVector();
  cat = new PVector(width/2, height/2);
}

void draw(){
  background(255);
  start.set(200, 200);
  end.set(600, 450);
  
  cat.lerp(new PVector(mouseX, mouseY), 0.10);
  
  stroke(0);
  line(start.x, start.y, end.x, end.y);
  noStroke();
  
  float position = map(sin(frameCount * 0.03), -1, 1, 0, 1);
  PVector dot = PVector.lerp(start, end, position);
  circle(dot.x, dot.y, 50);
  
  circle(cat.x, cat.y, 25);
  
  fill(0);
  text("start", start.x, start.y - 50);
  text("position: " + position, dot.x, dot.y - 30);
  text("end", end.x, end.y + 50);
}
