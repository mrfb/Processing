color paper, ink1, ink2, ink3;

PVector topLeft, topMid, topRight,
        midLeft, center, midRight,
        botLeft, botMid, botRight;

float sizeBase = 256;
float rotateSpeed = .03;

float flux = 0;
float fluxStep = 0.01;

void setup(){
  size(1024, 1024);
  rectMode(CENTER);
  
  // top row
  topLeft  = new PVector(width * .25, height * .25);
  topMid   = new PVector(width * .50, height * .25);
  topRight = new PVector(width * .75, height * .25);
  
  // middle row
  midLeft  = new PVector(width * .25, height * .50);
  center   = new PVector(width * .50, height * .50);
  midRight = new PVector(width * .75, height * .50);
  
  // bottom row
  botLeft  = new PVector(width * .25, height * .75);
  botMid   = new PVector(width * .50, height * .75);
  botRight = new PVector(width * .75, height * .75);
  
  paper = #25E8C9;
  ink1 = #FFDA08;
  ink2 = #FA67CE;
  ink3 = #2E4B52;
  
  //frameRate(5);
}

void draw(){
  background(paper);
  
  // TOP RIGHT CIRCLE
  noStroke();
  resetMatrix();
  translate(topRight.x, topRight.y);
  fill(ink3);
  PVector a = new PVector(cos(-flux * TAU + TAU*.125),
                          sin(-flux * TAU + TAU*.125));
  a.mult(sizeBase*.4);
  circle(a.x, a.y, sizeBase * .25);
  a.add(topRight);
  
  // BOTTOM RIGHT CIRCLE
  resetMatrix();
  translate(botRight.x, botRight.y);
  PVector b = new PVector(cos(flux * TAU + TAU*.125),
                          sin(flux * TAU + TAU*.125));
  b.mult(sizeBase*.125);
  circle(b.x, b.y, sizeBase * .5);
  b.add(botRight);
  
  // TR-BR CONNECTION
  resetMatrix();
  stroke(ink3);
  strokeWeight(sizeBase * 32 / a.dist(b));  // smaller distance = thicker
  line(a.x, a.y, b.x, b.y);
  
  // BOUNCY CENTER
  resetMatrix();
  translate(center.x, center.y);
  rotate(flux * TAU * .50);
  noStroke();
  fill(ink1);
  square(0, 0, sizeBase * (abs(sin(flux * TAU * .50))*.5+.5));
  rotate(flux * TAU * .50);
  fill(ink2);
  square(0, 0, sizeBase * (abs(sin(flux * TAU * .50))*.5+.5));
  fill(ink1);
  circle(0, 0, sizeBase * (abs(sin(flux * TAU * .50))*.3+.2));
  
  // WIGGLE TRIANGLES
  resetMatrix();
  translate(botMid.x, botMid.y);
  rotate(sin(flux * TAU)/8 * TAU - TAU*.25);
  fill(ink2);
  triangle(sizeBase * .4, 0,
           -sizeBase * .25, sizeBase * .125,
           -sizeBase * .25, -sizeBase * .125);
  
  resetMatrix();
  translate(topMid.x, topMid.y);
  rotate(sin(flux * TAU)/8 * TAU + TAU*.25);
  fill(ink2);
  triangle(sizeBase * .4, 0,
           -sizeBase * .25, sizeBase * .125,
           -sizeBase * .25, -sizeBase * .125);
  
  // LEFT CURVE
  resetMatrix();
  fill(ink1);
  circle(topLeft.x, topLeft.y, sizeBase/4);
  fill(ink2);
  square(botLeft.x, botLeft.y, sizeBase/4);
  stroke(ink3);
  noFill();
  strokeWeight(sizeBase / 16);
  a.x = midLeft.x + cos((flux - .25) * TAU) * sizeBase;
  a.y = midLeft.x + sin((flux - .25) * TAU) * sizeBase;
  b.x = midLeft.x + cos((flux + .25) * TAU) * sizeBase;
  b.y = midLeft.x + sin((flux + .25) * TAU) * sizeBase;
  bezier(topLeft.x, topLeft.y,
         a.x, a.y, b.x, b.y,
         botLeft.x, botRight.y);
  
  flux += fluxStep;
  
  if(flux < 1){
    saveFrame("frames/####.png");
  }
  
}
