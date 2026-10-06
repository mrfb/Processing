// draw stuff on a 3 x 3 grid
// and have it animate
// mrfb 20230930

PVector topLeft, topCenter, topRight,
        midLeft, midCenter, midRight,
        botLeft, botCenter, botRight;
        
int frames = 100;

void setup(){
  size(1024, 1024);
  noSmooth();
  
  topLeft   = new PVector(width * 0.25, height * 0.25);
  topCenter = new PVector(width * 0.50, height * 0.25);
  topRight  = new PVector(width * 0.75, height * 0.25);
  
  midLeft   = new PVector(width * 0.25, height * 0.50);
  midCenter = new PVector(width * 0.50, height * 0.50);
  midRight  = new PVector(width * 0.75, height * 0.50);
  
  botLeft   = new PVector(width * 0.25, height * 0.75);
  botCenter = new PVector(width * 0.50, height * 0.75);
  botRight  = new PVector(width * 0.75, height * 0.75);
  
  rectMode(CENTER);
}

void draw(){
  background(255);
  
  // casting int->float at the last second for accuracy
  float progress = float(frameCount) / float(frames);
  
  // will generally use these, but want them
  // to reset each draw loop, so they don't
  // need to be global variables
  PVector p0, p1, p2, p3;
  p0 = new PVector();
  p1 = new PVector();
  p2 = new PVector();
  p3 = new PVector();
  float radius;
  
  // shows frame number in top left corner for testing
  //fill(0);
  //textSize(30);
  //text(frameCount, 20, 32);
  
  fill(255);
  strokeWeight(3);
  
  // TOP ROW
  // water wheel
  translate(topLeft.x, topLeft.y);
  // radially symmetrical, so we can loop after a 25% rotation
  rotate(progress * 0.25 * TAU);
  line(-50, -50, 50, 50); // main x
  line(-50, 50, 50, -50);
  float start = 50;
  float end = 75;
  line(-start, 0, -end, 0);   // smaller spokes
  line(start, 0, end, 0);
  line(0, -start, 0, -end);
  line(0, start, 0, end);
  circle(0, 0, 25);
  resetMatrix();
  
  // strafey lines
  translate(topCenter.x, topCenter.y);
  line(sin(progress*TAU)  *50, -50, sin(progress*TAU)  *50, -20); //30
  line(sin(progress*TAU*2)*50, -15, sin(progress*TAU*2)*50,  10); //25
  line(sin(progress*TAU*4)*50,  15, sin(progress*TAU*4)*50,  35); //20
  line(sin(progress*TAU*8)*50,  40, sin(progress*TAU*8)*50,  55); //15
  resetMatrix();
  
  // bauhaus bounce
  translate(topRight.x, topRight.y);
  pushMatrix();
  translate(-50, sin(progress * TAU + TAU * 1.0 / 3.0) * 50);
  triangle(cos(TAU * 1.0 / 3.0 - TAU/4.0) * 15, sin(TAU * 1.0 / 3.0 - TAU/4.0) * 15,
           cos(TAU * 2.0 / 3.0 - TAU/4.0) * 15, sin(TAU * 2.0 / 3.0 - TAU/4.0) * 15,
           cos(TAU * 3.0 / 3.0 - TAU/4.0) * 15, sin(TAU * 3.0 / 3.0 - TAU/4.0) * 15);
  popMatrix();
  pushMatrix();
  translate(0, sin(progress * TAU + TAU * 2.0 / 3.0) * 50);
  square(0, 0, 25);
  popMatrix();
  pushMatrix();
  translate(50, sin(progress * TAU + TAU * 3.0 / 3.0) * 50);
  circle(0, 0, 25);
  popMatrix();
  resetMatrix();
  
  // MIDDLE ROW
  // gravity orb
  translate(midLeft.x, midLeft.y);
  p1.set(cos(progress*TAU)*25, sin(progress*TAU)*75);
  p2.set(cos(progress*TAU)*75, sin(progress*TAU)*25);
  line(p1.y, p1.x, p2.y, p2.y);
  circle(sin(progress*TAU)*10, cos(progress*TAU)*10, 15);
  line(p1.y, p1.y, p2.y, p2.x);
  line(p1.x, p1.y, p2.x, p2.y);
  resetMatrix();
  
  // bounce square
  translate(midCenter.x, midCenter.y);
  rotate(progress * TAU / 4.0);
  square(0, 0, 55 + abs(sin(progress*TAU)) * 20);
  resetMatrix();
  
  // chaos circles
  translate(midRight.x, midRight.y);
  noFill(); // let them overlap—it's visually noisier
  radius = 75;
  circle(cos(progress * 1 * TAU) * radius, sin(progress * 4 * TAU) * radius, 20);
  circle(cos(progress * 1 * TAU) * radius, sin(progress * 2 * TAU) * radius, 25);
  circle(cos(progress * 2 * TAU) * radius, sin(progress * 1 * TAU) * radius, 25);
  circle(cos(progress * 4 * TAU) * radius, sin(progress * 1 * TAU) * radius, 20);
  resetMatrix();
  
  // BOTTOM ROW
  // winding clock
  translate(botLeft.x, botLeft.y);
  pushMatrix();
  rotate(-abs(sin(progress*TAU)) * TAU);
  square(0, 0, 25);
  popMatrix();
  rotate(TAU * -0.25); // changes sync point
  rotate(progress * TAU);
  line (45, 0, 75, 0);
  rotate(progress * TAU);
  line (50, 0, 75, 0);
  rotate(progress * TAU);
  line (55, 0, 75, 0);
  rotate(progress * TAU);
  line (60, 0, 75, 0);
  resetMatrix();
  
  // bouncing ball
  translate(botCenter.x, botCenter.y);
  fill(0);
  ellipse(0, 50, 30-abs(sin(progress*TAU)*25), 25-abs(sin(progress*TAU)*20));
  fill(255);
  ellipse(0, 50-abs(sin(progress*TAU)*100), 25 + 5*abs(cos(progress*TAU)), 23 + 5*abs(sin(progress*TAU)));
  resetMatrix();
  
  // rotating tetrahedron
  translate(botRight.x, botRight.y);
  radius = 75;
  p0.set(0, -50);
  // swapping sin/cos gives us CCW movement
  p1.set(sin(progress * TAU + TAU * 1.0 / 3.0)*radius,
         cos(progress * TAU + TAU * 1.0 / 3.0)*radius*0.5 + 50);
  p2.set(sin(progress * TAU + TAU * 2.0 / 3.0)*radius,
         cos(progress * TAU + TAU * 2.0 / 3.0)*radius*0.5 + 50);
  p3.set(sin(progress * TAU + TAU * 3.0 / 3.0)*radius,
         cos(progress * TAU + TAU * 3.0 / 3.0)*radius*0.5 + 50);
  line(p0.x, p0.y, p1.x, p1.y);
  line(p0.x, p0.y, p2.x, p2.y);
  line(p0.x, p0.y, p3.x, p3.y);
  line(p1.x, p1.y, p2.x, p2.y);
  line(p1.x, p1.y, p3.x, p3.y);
  line(p2.x, p2.y, p3.x, p3.y);
  resetMatrix();
  
  // if progress is less than 100%, save a frame
  if(progress <= 1){
    saveFrame("frames/####.png");
    println(progress * 100 + "%");
  }
}
