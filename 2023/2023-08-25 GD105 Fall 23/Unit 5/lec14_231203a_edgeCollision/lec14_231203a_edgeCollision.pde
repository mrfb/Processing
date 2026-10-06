// Ball has a velocity and bounces off of the canvas edges.

PVector ballPosition;
PVector ballVelocity;

void setup(){
  size(1024, 1024);
  
  // just 'cuz
  noSmooth();
  noStroke();
  
  // initialization
  ballPosition = new PVector(width/2, height/2);
  ballVelocity = PVector.random2D().mult(5);
  
  background(#ffffff);
}

void draw(){ 
  // leave trails instead of drawing the background outright
  fill(#ffffff, 32);
  rect(0, 0, width, height);
  
  // update the position
  ballPosition.add(ballVelocity);
  
  // check for a collision on each wall
  // if we collide, invert the corresponding
  // component of the velocity
  if(ballPosition.x < 0){
    ballVelocity.x *= -1;
    println("bounce: left wall");
  }
  
  if(ballPosition.x > width){
    ballVelocity.x *= -1;
    println("bounce: right wall");
  }
  
  if(ballPosition.y > height){
    ballVelocity.y *= -1;
    println("bounce: bottom wall");
  }
  
  if(ballPosition.y < 0){
    ballVelocity.y *= -1;
    println("bounce: top wall");
  }
  
  // draw the ball
  fill(#000000);
  circle(ballPosition.x, ballPosition.y, 64);
}

void keyPressed(){
  // move the ball back to the center and randomize the direction
  ballPosition.set(width/2, height/2);
  ballVelocity = PVector.random2D().mult(5);
}
