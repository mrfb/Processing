PVector center;
int colorChangeTimer = 30;
color leftLine, rightLine;

int leftHueBase, rightHueBase;
int leftHueJitter, rightHueJitter;

void setup(){
  size(1000, 1000);
  background(#FFFFFF);
  
  noSmooth();
  //strokeWeight(2);
  
  leftHueBase = int(random(360));
  rightHueBase = int(random(360));
  leftHueJitter = int(random(5, 15));
  rightHueJitter = int(random(5, 15));
  
  center = new PVector(width/2, height/2);
}

void draw(){
  if(frameCount % colorChangeTimer == 1){
    leftLine = pickColor(leftHueBase, leftHueJitter);
    rightLine = pickColor(rightHueBase, rightHueJitter);
  }
  
  translate(center.x, center.y);

  //float noiseTheta = map(noise(frameCount * 0.0003, 0), 0, 1, -TAU, TAU);
  //rotate(noiseTheta);
  rotate(frameCount * 0.001);
  
  // slowly moves outward over time
  float lineStartMin = 50;
  float lineStartMax = 250;
  float lineStart = map(noise(frameCount * 0.01, 1), 0, 1, lineStartMin, lineStartMax);
  
  float lineEndMin = 250;
  float lineEndMax = lineEndMin + (frameCount * 0.01);
  float lineEnd = map(noise(frameCount * 0.001, 2), 0, 1, lineEndMin, lineEndMax);
  
  stroke(rightLine);
  line(lineStart, 0, lineEnd, 0);
  
  stroke(leftLine);
  line(-lineStart, 0, -lineEnd, 0);
  
}
