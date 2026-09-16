// speed we rotate around the center
float spinSpeed = random(.001, .1);

// speed we wobble on our axis
float wobbleSpeed = random(0.001, 0.005);
float wobbleIntensity = random(TAU * 10);

// speed we spiral in and out of the center
float spiralSpeed = random(.1);
float spiralMin = 200;

PVector center;
PVector origin;

float lineLength = random(100);
float lineOpacity = 10.0;
float wingLength = 100 - lineLength;

void setup(){
  size(666, 666);
  background(255);
  stroke(0, lineOpacity);
  
  center = new PVector(width/2, height/2);
  origin = new PVector(75, 0);
}

void draw(){
  // get our line to the right place...
  // first move the origin to the center and spin a bit
  translate(center.x, center.y);
  float spin = frameCount * spinSpeed;
  rotate(spin);
  
  // then offset to where we're going to draw the line
  translate(origin.x * cos(frameCount * spiralSpeed) + spiralMin, origin.y);
  // and add a secondary rotation
  float wobble = sin(frameCount * wobbleSpeed) * wobbleIntensity;
  rotate(wobble);
  
  //draw the lines
  line(-lineLength*.5, 0, lineLength*.5, 0);
  line(0, -wingLength * .5, 0, wingLength*.5);
}

void keyPressed(){
  save("output.png");
}
