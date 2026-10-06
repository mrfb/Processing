// making a happy face
// this was an in-class demo building up
// things a little at a time

// this is using some things i don't expect
// you to use yet—namely the stuff
// that makes things animate

void setup(){
  // set the canvas size
  size(666, 666);
}

void draw(){
  // paint the background so we don't have trails
  // while tweaking
  background(180);
  
  // set the styles:
  // fill is yellow, stroke is default black
  // and stroke weight is a little heavier
  fill(#FFEA00);
  strokeWeight(3);
  
  // draw a circle for the head
  circle(333, 333, 333);
  
  // draw some fangs that will get
  // partially obscured by the mouth
  fill(255);
  noStroke();
  translate(333, 333);
  triangle(94, 56, 58, -6, 57, 100);
  triangle(-94, 56, -58, -6, -57, 100);
  resetMatrix();
  stroke(0);
  
  // draw the mouth
  // by student request, the lips are "luscious"
  strokeWeight(30);
  noFill();
  arc(333, 348, 211, 207, TAU * 0.00, TAU * 0.50);
  strokeWeight(3);
  
  // draw the eyes
  fill(0);
  ellipse(333-60, 275, 25, 50); // left eye
  ellipse(333+60, 275, 25, 50); // right eye
  
  // eye accents:
  // make phillip think about how happy he is
  fill(255);
  circle(268, 269, 14); // left lower
  circle(271, 257, 9); // left upper
  circle(268+120, 269, 14); // right lower
  circle(271+120, 257, 9); // right upper
  
  // waggling eyebrows
  // this moves where the eyebrows are drawn
  translate(0, (1-abs(sin(frameCount * 0.05)))*15);
  // this draws the eyebrows
  noFill();
  arc(333-60, 238, 50, 30, TAU * 0.50, TAU * 1.00);
  arc(333+60, 238, 50, 30, TAU * 0.50, TAU * 1.00);
  resetMatrix();
  
  // draws the text "phillip is hungry" in a wiggly way
  textSize(64);
  float textOffset = 0.43;
  String message = "philip is hungry";
  translate(25, 587);
  for(int i = 0; i < message.length(); i++){
    text(message.charAt(i), cos(frameCount * 0.05 + textOffset * i) * 10, sin(frameCount * 0.05 + textOffset * i) * 20);
    translate(39, 0);
  }
  
  // save enough frames to make a looping gif
  if(frameCount * 0.05 < TAU * 1.0){
    saveFrame("frames/####.png");
  }
}
