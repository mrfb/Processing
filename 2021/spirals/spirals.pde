int numSquares = 20;
int numFrames = 100;
float maxRotation = 0.12; // the squares butt into each other around here

void setup() {
  size(512, 512);
  background(#ffffff);
  rectMode(CENTER);
  fill(0, 40); // 0/255 greyscale and 40/255 opacity
  noStroke();
}

void draw() {
  float progress = frameCount * 1.0 / numFrames;
  
  background(#ffffff);
  // note: the transform matrix resets every draw() call
  translate(width/2, height/2); // this moves (0, 0) to the center
  
  float theta = sin(TAU * progress) * maxRotation;
  for(int i = 0; i < numSquares; i++){
    square(0, 0, width*.95);
    rotate(theta); // rotate with each additional shape
    scale(.9); // scale down with each additional shape
  }
  
  saveFrame("frames/####.png");
  
  if(progress >= 1.0){
    exit();
  }
}
