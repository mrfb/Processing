int scoreLeft = 0;
int scoreRight = 0;

float paddleSpeed = 5;
float ballSpeed = 8;

PVector ball;
float ballSize = 30;
PVector ballVelocity = new PVector (-ballSpeed, 0.0);

PVector paddleLeft;
PVector paddleRight;
float gutter = 50;
float paddleWidth = 10;
float paddleHeight = 50;

void setup(){ // runs at the start
  size(999, 666);
  rectMode(CENTER);
  stroke(255);
  ball = new PVector(width/2, height/2);
  paddleLeft = new PVector(gutter, height/2);
  paddleRight = new PVector(width - gutter, height/2);
}

// bounces the ball off of paddles and top/bottom walls
void bounceBall(){
  //bounce off top or bottom wall
  if(ball.y < 0 || ball.y > height){
    ballVelocity.y *= -1;
  }
  
  // is the ball in the left gutter and between where the paddle is?
  if(ball.x < gutter &&
     ball.y > paddleLeft.y - paddleHeight/2 &&
     ball.y < paddleLeft.y + paddleHeight/2){
    ballVelocity.y = random(-ballSpeed,ballSpeed);
    ballVelocity.x *= -1;
  }
  
  // is the ball in the right gutter and between where the paddle is?
  if(ball.x > width - gutter &&
     ball.y > paddleRight.y - paddleHeight/2 &&
     ball.y < paddleRight.y + paddleHeight/2){
    ballVelocity.y = random(-ballSpeed,ballSpeed);
    ballVelocity.x *= -1;
  }
}

void drawCourt(){
  // draw a white line down the center
  line(width/2, 0, width/2, height);
  
  // draw the score
  textSize(64);
  textAlign(RIGHT);
  text(scoreLeft, width/2 - gutter, gutter * 2);
  textAlign(LEFT);
  text(scoreRight, width/2 + gutter, gutter * 2);
}

void checkGoal(){
  // did the ball score for the left side?
  if(ball.x > width){
    // it did.
    scoreLeft++;
    ball.x = width/2;
    ball.y = height/2;
    ballVelocity = new PVector(-ballSpeed, 0);
  }
  
  // did the ball score for the right side?
  if(ball.x < 0){
    // it did.
    scoreRight++;
    ball.x = width/2;
    ball.y = height/2;
    ballVelocity = new PVector(ballSpeed, 0);
  }
  
  if(scoreLeft >= 10 || scoreRight >= 10){
    textAlign(CENTER);
    text("WINNER", width/2, height/2);
  }
}

void draw(){ // runs once per frame
  background(50);
  drawCourt();
  bounceBall();
  
  ball.x += ballVelocity.x;
  ball.y += ballVelocity.y;
  ellipse(ball.x, ball.y, ballSize, ballSize);
  
  checkGoal();
  
  rect(paddleLeft.x, paddleLeft.y, paddleWidth, paddleHeight);
  rect(paddleRight.x, paddleRight.y, paddleWidth, paddleHeight);
  
  if(keyPressed){
    movePaddles();
  }
}

void movePaddles(){
  // Left Player: up with W, down with S
  if(key == 'w'){
    // move the left paddle up
    paddleLeft.y -= paddleSpeed;
  } else if (key == 's'){
    // move the left paddle down
    paddleLeft.y += paddleSpeed;
  }
  
  // Right Player: up with UP, down with DOWN
  if(keyCode == UP){
    // move the right paddle up
    paddleRight.y -= paddleSpeed;
  } else if (keyCode == DOWN){
    // move the right paddle down
    paddleRight.y += paddleSpeed;
  }
}
