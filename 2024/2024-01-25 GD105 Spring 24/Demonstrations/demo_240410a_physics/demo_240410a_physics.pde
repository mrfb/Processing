PVector pos, vel, acc;

void setup(){
  size(666, 666);
  
  // initial location
  pos = new PVector();
  vel = new PVector();
  acc = new PVector(0, 3);
  initBall();
  
  frameRate(10);
  background(255);
}

void draw(){
  // fade old frames time so we can see the path
  noStroke();
  fill(255, 20);
  rectMode(CORNER);
  rect(0, 0, width, height);
  //background(255);
  
  // draw the ball
  stroke(0);
  noFill();
  circle(pos.x, pos.y, 50);
  
  // visualize velocity vector
  if(vel.y > 0){
    stroke(#aa0000);
  } else {
    stroke(#00aa00);
  }
  line(pos.x, pos.y, pos.x + vel.x, pos.y + vel.y);
  
  // update physics for next frame
  // velocity measures how much position changes each time step
  // acceleration measures how much velocity changes each time step
  pos.add(vel);
  vel.add(acc);
  
  // reset if we fall offscreen
  if(pos.y > height){
    initBall();
  }
}

// initial values for our arc
void initBall(){
  pos.set(0, height);
  vel.set(10, -50);
}
