// making a happy face
// this was an in-class demo building up
// things a little at a time

// this is using some things i don't expect
// you to use yet—namely the stuff
// that makes things animate

void setup(){
  // set the canvas size
  size(666, 666);
  frameRate(50);
}

void draw(){
  // paint the background so we don't have trails
  // while tweaking
  background(180);
  strokeWeight(3);
  
  PVector A, B, C;
  float progress = map(frameCount * 0.05, 0, TAU, 0, 1);
  progress = (float)easeInOutExpo(progress);
  
  A = new PVector(50, 50);
  B = new PVector(200, 600);
  C = new PVector(600, 333);
  fill(#aa0000);
  circle(lerp(A.x, B.x, progress), lerp(A.y, B.y, progress), 50);
  circle(lerp(B.x, C.x, progress), lerp(B.y, C.y, progress), 50);
  circle(lerp(C.x, A.x, progress), lerp(C.y, A.y, progress), 50);
  point(A.x, A.y);
  point(B.x, B.y);
  point(C.x, C.y);
  
  
  translate(333, 333);
  rotate(frameCount * 0.05);
  
  // set the styles:
  // fill is yellow, stroke is default black
  // and stroke weight is a little heavier
  fill(#FFEA00);
  
  
  // draw a circle for the head
  circle(0, 0, 333);
  
  // draw some fangs that will get
  // partially obscured by the mouth
  fill(255);
  noStroke();
  
  //pushMatrix();
  
  triangle(94, 56, 58, -6, 57, 100);
  triangle(-94, 56, -58, -6, -57, 100);
  stroke(0);
  
  // draw the mouth
  // by student request, the lips are "luscious"
  strokeWeight(30);
  noFill();
  arc(0, 15, 211, 207, TAU * 0.00, TAU * 0.50);
  strokeWeight(3);
  
  // draw the eyes
  fill(0);
  ellipse(-60, 275-333, 25, 50); // left eye
  ellipse(60, 275-333, 25, 50); // right eye
  
  // eye accents:
  // make phillip think about how happy he is
  fill(255);
  circle(268-333, 269-333, 14); // left lower
  circle(271-333, 257-333, 9); // left upper
  circle(268+120-333, 269-333, 14); // right lower
  circle(271+120-333, 257-333, 9); // right upper
  
  // waggling eyebrows
  // this moves where the eyebrows are drawn
  //translate(0, (1-abs(sin(frameCount * 0.05)))*15);
  // this draws the eyebrows
  noFill();
  arc(-60, 238-333, 50, 30, TAU * 0.50, TAU * 1.00);
  arc(+60, 238-333, 50, 30, TAU * 0.50, TAU * 1.00);
  //resetMatrix();
  
  // save enough frames to make a looping gif
  if(frameCount * 0.05 < TAU * 1.0){
    saveFrame("frames/####.png");
  }
}

// via easings.net
double easeInOutExpo(double x) {
  return x == 0
    ? 0
    : x == 1
    ? 1
    : x < 0.5 ? Math.pow(2, 20 * x - 10) / 2
    : (2 - Math.pow(2, -20 * x + 10)) / 2;
}
