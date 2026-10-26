// Global declaration
PVector position;
float circleSize = 50;
color circleColor = #000000;

void setup(){
  size(1000, 1000);
  
  // allocation and initialization
  position = new PVector(width/2, height/2);
  background(#FFFFFF);
  noStroke();
  colorMode(HSB, 360, 1, 1);
}

void draw(){
  if(frameCount % 30 == 0){
    // this code runs if the first question is true
    circleColor = color(frameCount % 360, .5, .9);
  } else if (frameCount % 15 == 0) {
    // this code runs if the first question is false,
    // but the second question is true
  } else {
    // this code runs if both questions are false
  }
  
  fill(circleColor, 200);
  circle(position.x, position.y, circleSize);
  
  position.add(PVector.random2D().mult(5));
}
