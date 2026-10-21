// Matthew R.F. Balousek
// 2026-10-19
// A mix of things to demonstrate functions.

void setup(){
  size(1000, 1000);
  background(#FFFFFF);
  noSmooth();
}

void draw(){    
  noStroke();
  // Moves to the right over time, loops back.
  float xPos = frameCount % width;
  int cSize = 20;
  
  float bluePos = noise(frameCount * 0.001) * height;
  float redPos = sin(frameCount * 0.01);
  float yelPos = abs(sin(frameCount * 0.01));
  redPos = map(redPos, -1, 1, height * .9, height * .1);
  yelPos = map(yelPos, -1, 1, height * .9, height * .1);
  
  // Blue Series
  fill(#0000aa, 30);
  //circle(xPos, bluePos, cSize);
  
  // Red Series
  fill(#aa0000, 30);
  circle(xPos, redPos, cSize);
  
  // Yellow Series
  fill(#ffbf00, 30);
  circle(xPos, yelPos, cSize);
  
  // Demonstrates where things are drawing.
  resetMatrix();
  fill(#FFFFFF);
  stroke(#000000);
  rect(0, height*0.95, width, height * 0.05);
  xPos = frameCount % width;
  line(xPos, height * 0.95, xPos, height);
}
