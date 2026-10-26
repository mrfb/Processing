// Global scope variables
PVector position;
float circleSize = 50;
color circleColor = #000000;

void setup(){
  // this block runs once at the start
  size(1000, 1000);
  position = new PVector(width/2, height/2);
  background(#FFFFFF);
  noStroke();
}

void draw(){
  // this block runs once every frame
  if(frameCount % 50 == 0){
    // this code runs if the first condition is true
    circleColor = #000000;
    circleSize = 75;
  } else if(frameCount % 50 == 1){
    // this code runs if the first question is false, but the second is true
    circleColor = color(random(255), random(255), random(255));
    circleSize = 50;
  } else {
    // this code runs if both conditions are false
  }
  
  fill(circleColor);
  circle(position.x, position.y, circleSize);
  
  position.add( PVector.random2D().mult(5) );
}
