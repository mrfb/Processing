void setup(){
  size(1024, 1024);
  ellipseMode(RADIUS);
  textAlign(CENTER, CENTER);
}

void draw(){
  int radius = 256;
  float animationSpeed = 0.01;
  float theta = frameCount * animationSpeed;
  
  // draw our unit circle
  background(#ffffff);
  translate(512, 512);
  strokeWeight(5);
  stroke(0);
  line(-9999, 0, 9999, 0); // horizontal axis
  line(0, -9999, 0, 9999); // vertical axis
  fill(255, 200);
  stroke(128);
  circle(0, 0, radius);
  
  PVector p = new PVector(cos(theta), sin(theta));
  
  // draw the x component of our triangle
  stroke(#00aa00);
  line(0, 0, p.x * radius, 0);
  fill(#00aa00);
  text("cos(theta)", p.x * radius, radius + 96);
  circle(p.x * radius, radius + 64, 10);
  
  // draw the y component of our triangle
  stroke(#0000aa);
  fill(#0000aa);
  line(p.x * radius, 0, p.x * radius, p.y * radius);
  text("sin(theta)", radius + 64, p.y * radius + 32);
  circle(radius + 64, p.y * radius, 10);
  
  // draw the hypotenuse
  stroke(#aa0000);
  line(0, 0, p.x * radius, p.y * radius);
  fill(#aa0000);
  textSize(32);
  text("(" + p.x + ", " + p.y + ")", p.x * (radius + 32), p.y * (radius + 32));
}
