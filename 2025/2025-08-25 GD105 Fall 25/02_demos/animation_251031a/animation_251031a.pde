boolean makeGif = true;

void setup(){
  size(800, 800);
  noSmooth();
  strokeCap(SQUARE);
}

//circle(0, 0, width);

void draw(){
  background(255);
  translate(width/2, height/2);
  //line(-9999, 0, 9999, 0);
  //line(0, -9999, 0, 9999);
  
  // the reason I'm dividing these by 360 and 90 is
  // that that way they'll be on the same cycle to loop the GIF
  // the horizontal pendulum completes a cycle in the same time
  // it takes the square to go one quarter rotation, and then
  // the big circle takes longer. think of it in terms of
  float verticalMotion, horizontalMotion, swingRadius, cycleLength;
  
  // the vertical pendulum moves pretty slowly--it takes a long time to complete
  // its animation cycle and return to where it started
  swingRadius = width * 0.25;
  cycleLength = 360.0;
  verticalMotion = sin(frameCount * TAU / cycleLength) * swingRadius;
  noFill();
  strokeWeight(4);
  circle(0, verticalMotion, width - swingRadius * 2.0 - 5);
  
  // the horizontal pendulum moves faster
  // it's a little smaller to help sell the idea that it's lighter
  swingRadius = width * 0.35;
  cycleLength = 90.0;
  horizontalMotion = sin(frameCount * TAU / cycleLength) * swingRadius;
  circle(horizontalMotion, 0, width - swingRadius * 2.0 - 5);
  
  strokeWeight(constrain(500 / abs(horizontalMotion), 2, 20));
  line(0, 0, horizontalMotion, 0);
  strokeWeight(constrain(1000 / abs(verticalMotion), 2, 20));
  line(0, 0, 0, verticalMotion);
  
  // spin on you crazy diamond
  rectMode(CENTER);
  rotate(radians(frameCount)); // 90 frames for an equivalent cycle
  fill(0);
  noStroke();
  square(0, 0, width * .1);
  stroke(0);
  
  if(frameCount < 360 && makeGif){
    saveFrame("frames/####.png");
  }
  
}
