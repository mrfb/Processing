PVector A, B, C, D;
float rotationSpeed = TAU / 7.0;
float oscillationSpeed  = 0.001;

int nextSave = 1;

String saveRoot = year() + "-" + month() + "-" + day()
          + "_" + hour() + "-" + minute() + "-" + second();

void setup(){
  //size(666, 666);
  fullScreen();
  background(255);
  
  A = new PVector(0, 0);
  B = new PVector(0, 0);
  C = new PVector(0, 0);
  D = new PVector(0, 0);
  
  noSmooth();
  rectMode(CENTER);
}

void draw(){
  //background(128); // debug grey
  translate(width/2, height/2);
  rotate(frameCount * rotationSpeed);
  
  // shapes
  //noFill();
  //stroke(0);
  //square(A.x, A.y, map(cos(frameCount * oscillationSpeed), -1, 1, 1, 32));
  //circle(B.x, B.y, map(sin(frameCount * oscillationSpeed), -1, 1, 1, 16));
  //stroke(255);
  //square(C.x, C.y, map(cos(frameCount * oscillationSpeed), -1, 1, 1, 16));
  //circle(D.x, D.y, map(sin(frameCount * oscillationSpeed), -1, 1, 1, 32));
  
  // dots
  //strokeWeight(3);
  //stroke(0);
  //point(A.x, A.y);
  //point(B.x, B.y);
  //stroke(255);
  //point(C.x, C.y);
  //point(D.x, D.y);
  
  //lines
  //stroke(0);
  //line(A.x, A.y, B.x, B.y);
  //stroke(255);
  //line(C.x, C.y, D.x, D.y);
  
  //triangle
  noFill();
  stroke(0);
  fill(0);
  rotTri(A, frameCount * 0.001, map(cos(frameCount * oscillationSpeed), -1, 1, 1, 8));
  noFill();
  rotTri(B, frameCount * 0.001 + TAU/2.0, map(sin(frameCount * oscillationSpeed), -1, 1, 1, 32));
  
  stroke(255);
  fill(255);
  rotTri(C, frameCount * 0.001, map(sin(frameCount * oscillationSpeed), -1, 1, 1, 8));
  noFill();
  rotTri(D, frameCount * 0.001 + TAU/2.0, map(cos(frameCount * oscillationSpeed), -1, 1, 1, 32));
  
  A.add(PVector.random2D());
  B.add(PVector.random2D());
  C.add(PVector.random2D());
  D.add(PVector.random2D());
  
  //rotationSpeed += random(-.001, .001);
  
  if(frameCount == nextSave){
    saveFrame("output/" + saveRoot + "/######.png");
    println(frameCount + ": saved");
    nextSave *= 2;
  }
}

// draw an equilateral triangle at point p, rotated and with the specified radius
void rotTri(PVector p, float theta, float radius){
  PVector a, b, c;
  a = new PVector(p.x, p.y);
  a.add(PVector.fromAngle(theta).mult(radius));
  b = new PVector(p.x, p.y);
  b.add(PVector.fromAngle(theta + TAU / 3.0).mult(radius));
  c = new PVector(p.x, p.y);
  c.add(PVector.fromAngle(theta - TAU / 3.0).mult(radius));
  
  triangle(a.x, a.y, b.x, b.y, c.x, c.y);
}
