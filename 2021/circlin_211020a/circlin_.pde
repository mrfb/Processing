boolean saveOutput = true;
int frameLimit = 100; // number of frames to render
int numCircles = 8;

void setup() {
  size(500, 500);
  //frameRate(15);
  colorMode(HSB, 1, 1, 1);
  noStroke();
}

void draw() {
  translate(width/2, height/2);
  background(0);
  
  float progress = frameCount * 1.0 / frameLimit; // ranges from 0 to 1

  // draw a square that moves in a cool way
  fill(#BEEDAD);
  rectMode(CENTER);
  rotate(TAU/8);
  square((width*.05)*sin(TAU * progress), (width*.2)*sin(TAU * progress) , 40);

  rotate(TAU * progress);

  for(int i = 0; i < numCircles; i++){
    rotate(TAU / numCircles);
    if(i % (numCircles/2) == 0){
      continue; // continue works like return, and will just skip to the next loop iteration
    }
    fill(#FEDBEE);
    circle(0, width*-.4, 30);
    
    pushMatrix(); // saves the current matrix
    translate(0, width*-.4);
    for(int j = 0; j < 3; j++){
      fill(progress, .7, 1);
      circle(0, 45, 10);
      rotate(TAU * progress);
    }
    popMatrix(); // load the matrix from before
    
  }

  if (progress >= 1) {
    exit();
    // noLoop(); works also
  }

  if (saveOutput) {
    saveFrame("frames/####.png");
  }
}
