PVector ball = new PVector();
PVector velocity = new PVector(2, 0);
int radius = 5;
PVector center = new PVector();

int lScore = 0;
int rScore = 0;

PVector lPaddle = new PVector();
PVector rPaddle = new PVector();

int paddleHeight = 100;
int paddleWidth = 20;

void setup(){
  size(800, 600);
  center.set(width/2, height/2);
  ball.set(center.x, center.y);
  
  lPaddle.set(50, center.y);
  rPaddle.set(width-50, center.y);
  
  rectMode(CENTER);
}

void draw(){
  background(255);
  fill(0);
  
  // update ball
  ball.add(velocity);
  
  // collide with walls
  if(ball.y + radius > height || ball.y - radius < 0){
    // the ball has bonked the top or bottom edge
    velocity.y *= -1;
  }

  if(ball.x - radius > width){
    // the ball has gone off the right edge
    lScore += 1;
    ball.set(center);
    // convert to PVector.fromAngle later
    velocity.set(PVector.random2D());
    
  }
  
  if(ball.x + radius < 0){
    // the ball has gone off the left edge
    rScore += 1;
    ball.set(center);
    velocity.set(PVector.random2D());
  }
  
  // convert center/width/height to
  // left/right/bottom/top
  float L = rPaddle.x - paddleWidth/2;
  float R = rPaddle.x + paddleWidth/2;
  float B = rPaddle.y - paddleHeight/2;
  float T = rPaddle.y + paddleHeight/2;
  
  // collide with paddles
  // for a small ball, it's fine to ignore the radius
  if(L < ball.x
     && ball.x < R
     && B < ball.y
     && ball.y < T){
    // bonk off right paddle
    velocity.x *= -1;
  }
  
  // draw ball
  circle(ball.x, ball.y, radius*2);
  
  // draw paddles
  rect(lPaddle.x, lPaddle.y, paddleWidth, paddleHeight);
  rect(rPaddle.x, rPaddle.y, paddleWidth, paddleHeight);
  
  // draw score
  textAlign(RIGHT);
  text(lScore, center.x - 50, 50);
  textAlign(LEFT);
  text(rScore, center.x + 50, 50);
}

void keyPressed(){
  // move lPaddle up
  
  // move lPaddle down
  
  // move rPaddle up
  
  // move rPaddle down
  
}
