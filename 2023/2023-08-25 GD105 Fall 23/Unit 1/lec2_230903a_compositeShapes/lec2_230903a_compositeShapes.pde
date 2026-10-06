// this runs once at the start
void setup(){
  size(1024, 1024);
}

// this runs once per frame after setup
void draw(){
  // top left, top right, bottom left, bottom right
  PVector anchorTL = new PVector(width*0.25, height*0.25);
  PVector anchorTR = new PVector(width*0.75, height*0.25);
  PVector anchorBL = new PVector(width*0.25, height*0.75);
  PVector anchorBR = new PVector(width*0.75, height*0.75);
  
  // the colors we'll be using
  color paper = #F2FAF4;
  color brightInk = #67ffc3;
  color darkInk = #6c3937;
  
  
  // DRAW THE BASE SHAPES
  background(paper);
  strokeWeight(24);
  fill(brightInk);
  noStroke();
  // draw the squares in the top-left and bottom-right
  rectMode(CENTER);
  // rounded rectangle (cannot be a square)
  rect(anchorTL.x, anchorTL.y, width * 0.25, width * 0.25, width * 0.10);
  square(anchorBR.x, anchorBR.y, width * 0.25);
  // draw the circles in the top-right and bottom-left
  ellipseMode(CENTER);
  circle(anchorTR.x, anchorTR.y, width * 0.25);
  circle(anchorBL.x, anchorBL.y, width * 0.25);
  
  
  // CREATE MORE COMPLEX SHAPES WITH LAYERING
  // top-left rectangle
  fill(paper);
  circle(anchorTL.x, anchorTL.y, width * 0.10);
  stroke(paper);
  line(anchorTL.x, anchorTL.y,
       anchorTL.x, anchorTL.y + width * 0.15);
  stroke(darkInk);
  fill(brightInk);
  quad(anchorTL.x - width * 0.025, anchorTL.y,
       anchorTL.x, anchorTL.y - height * 0.025,
       anchorTL.x + width * 0.025, anchorTL.y,
       anchorTL.x, anchorTL.y + height * 0.025);
       
  // top-right circle
  fill(paper);
  noStroke();
  // erase part of the existing circle
  circle(anchorTR.x, anchorTR.y - width * 0.15, width*0.25);
  circle(anchorTR.x, anchorTR.y + width * 0.15, width*0.25);
  // the fill the hollows
  fill(darkInk);
  circle(anchorTR.x, anchorTR.y - width * 0.10, width*0.05);
  circle(anchorTR.x, anchorTR.y + width * 0.10, width*0.05);
  
  // bottom-left circle
  // draw an equilateral triangle in the center
  fill(paper);
  noStroke();
  // calculate the points of the triangle first
  PVector tri1 = new PVector(anchorBL.x + cos(TAU * .25) * width * .1,
                             anchorBL.y + sin(TAU * .25) * width * .1);
  PVector tri2 = new PVector(anchorBL.x + cos(TAU * (.25 + 1.0/3.0)) * width * .1,
                             anchorBL.y + sin(TAU * (.25 + 1.0/3.0)) * width * .1);
  PVector tri3 = new PVector(anchorBL.x + cos(TAU * (.25 + 2.0/3.0)) * width * .1,
                             anchorBL.y + sin(TAU * (.25 + 2.0/3.0)) * width * .1);
  triangle(tri1.x, tri1.y,
           tri2.x, tri2.y,
           tri3.x, tri3.y);
  // and fill it with a circle
  fill(darkInk);
  circle(anchorBL.x, anchorBL.y, width*0.05);
  
  // bottom-right square
  // make a dark quad in the center
  fill(darkInk);
  noStroke();
  quad(anchorBR.x + -50, anchorBR.y + -45,
       anchorBR.x + 76, anchorBR.y + -76,
       anchorBR.x + 67, anchorBR.y + 19,
       anchorBR.x + -40, anchorBR.y + 39);
  // now draw lines on top of it
  stroke(paper);
  line(anchorBR.x + -165, anchorBR.y + -18,
       anchorBR.x + 155, anchorBR.y + -108);
  line(anchorBR.x + -77, anchorBR.y + -154,
       anchorBR.x + -15, anchorBR.y + 174);
  line(anchorBR.x + -202, anchorBR.y + 62,
       anchorBR.x + 203, anchorBR.y + 0);
  line(anchorBR.x + 61, anchorBR.y + -221,
       anchorBR.x + 80, anchorBR.y + 165);
       
  // save on the first frame and only then
  if(frameCount == 1){
    String filename = "output";
    save(filename + ".png");
    println("saved as " + filename + ".png");
  }
  
}
