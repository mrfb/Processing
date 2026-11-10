void setup() {
  // The code in this block will run once at the start.
  size(1000, 1000);
}

void draw() {
  // The code in this block will run once per frame.
  background(#ffff00);
  noStroke();
  
  // draw the base circles
  fill(#aa00aa);
  circle(250, 250, 250); // top-left
  circle(250, 750, 250); // bottom-left
  circle(750, 250, 250); // top-right
  circle(750, 750, 250); // bottom-right
  
  // paint over the circles with the background color
  fill(#ffff00);
  
  // top-left semicircle
  circle(250, 250, 150);
  rect(100, 250, 350, 150);
  
  // bottom-left button
  circle(200, 750, 50);
  circle(250, 700, 50);
  circle(300, 750, 50);
  circle(250, 800, 50);
  
  // top-right crescent
  circle(800, 250, 200);
  
  // bottom-right sharp
  circle(575, 750, 250);
  circle(925, 750, 250);
  circle(750, 575, 250);
  circle(750, 925, 250);
  
}
