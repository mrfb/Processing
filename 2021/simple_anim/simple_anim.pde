int numFrames = 100;
float maxRotation = TAU*.8;

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
  
  // oscillates vertically through the center
  circle(0, sin(TAU*progress) * (height * .45), 30);
  
  // twists to the right, then to the left, then goes back to the center
  rotate(sin(TAU*progress) * maxRotation);
  scale(sin(progress*TAU) + 0.2);
  square(0, 0, width*.55);
  
  saveFrame("frames/####.png");
  
  if(progress >= 1.0){
    exit();
  }
}
