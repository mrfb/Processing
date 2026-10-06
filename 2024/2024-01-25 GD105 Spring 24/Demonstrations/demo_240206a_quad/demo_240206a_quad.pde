void setup(){
  size(666, 666);
  background(255);
  //frameRate(1);
  noFill();
}

void draw(){
  translate(width * 0.25, height * 0.25); // move the origin to the top-left
  
  int radius = 100; // we don't want to change the origin in every place, so let's save it
  int minError = -50; // labeling the lower bound of the error
  int maxError = 50; // labeling the upper bound of the error
  circle(0, 0, 50); // for marking origin
  quad(-radius + random(minError, maxError),  -radius + random(minError, maxError),
        radius + random(minError, maxError),  -radius + random(minError, maxError),
        radius + random(minError, maxError),   radius + random(minError, maxError),
       -radius + random(minError, maxError),   radius + random(minError, maxError));
       
  translate(width * 0.50, 0); // schmoove over to the right
  circle(0, 0, 50); // mark the origin
  quad(-radius + random(minError, maxError),  -radius + random(minError, maxError),
        radius + random(minError, maxError),  -radius + random(minError, maxError),
        radius + random(minError, maxError),   radius + random(minError, maxError),
       -radius + random(minError, maxError),   radius + random(minError, maxError));
       
  translate(-width * 0.50, height * 0.50); // schmoove to the left, then down
  circle(0, 0, 50); // mark the origin
  quad(-radius + random(minError, maxError),  -radius + random(minError, maxError),
        radius + random(minError, maxError),  -radius + random(minError, maxError),
        radius + random(minError, maxError),   radius + random(minError, maxError),
       -radius + random(minError, maxError),   radius + random(minError, maxError));
       
  translate(width * 0.50, 0); // schmoove to the right
  circle(0, 0, 50); // mark the origin
  quad(-radius + random(minError, maxError),  -radius + random(minError, maxError),
        radius + random(minError, maxError),  -radius + random(minError, maxError),
        radius + random(minError, maxError),   radius + random(minError, maxError),
       -radius + random(minError, maxError),   radius + random(minError, maxError));
  
  // each frame we'll draw one set of quads and then we'll get the rest on the next pass
  
  // we'll stop after frame 6
  if(frameCount == 6){
    noLoop();
  }
}
