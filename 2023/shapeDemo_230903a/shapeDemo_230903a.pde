// this runs once at the start
void setup(){
  size(1024, 1024);
  colorMode(HSB, 360, 100, 100);
}

// this runs once per frame after setup
void draw(){
  
  // top left, top right, bottom left, bottom right
  PVector anchorTL = new PVector(width*0.25, height*0.25);
  PVector anchorTR = new PVector(width*0.75, height*0.25);
  PVector anchorBL = new PVector(width*0.25, height*0.75);
  PVector anchorBR = new PVector(width*0.75, height*0.75);
  
  color paper = #F2FAF4;
  color brightInk = #67ffc3;
  color darkInk = #6c3937;
  
  background(paper);
  
  strokeWeight(24);
  fill(brightInk);
  noStroke();
  
  // draw squares in the top-left and bottom-right,
  // and circles in the bottom-left and top-right.
  rectMode(CENTER);
  rect(anchorTL.x, anchorTL.y, width*0.25, width*0.25, 50);
  square(anchorBR.x, anchorBR.y, width*0.25);
  
  ellipseMode(CENTER);
  circle(anchorTR.x, anchorTR.y, width*0.25);
  circle(anchorBL.x, anchorBL.y, width*0.25);
  
  // layer shapes on top to make more complicated shapes
  fill(paper);
  circle(anchorTL.x, anchorTL.y, width*0.10);
  stroke(paper);
  line(anchorTL.x, anchorTL.y, anchorTL.x, anchorTL.y + width * 0.15);
  
}
