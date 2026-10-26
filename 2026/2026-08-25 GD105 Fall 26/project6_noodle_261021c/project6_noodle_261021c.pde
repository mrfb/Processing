void setup(){
  size(1000, 1000);
  
  background(#000000);
  strokeCap(SQUARE);
}

void draw(){
  background(#FFFFFF);
  
  float leftLength = map(sin(frameCount * 0.01), -1, 1, width * -0.45, width * -0.05);
  float rightLength = map(noise(frameCount * 0.01), 0, 1, width * 0.05, width * 0.25);
  float rotationDiff = map(sin(frameCount * 0.01), -1, 1, -TAU * 3, TAU * 3)
                      -map(sin((frameCount-1) * 0.01), -1, 1, -TAU * 3, TAU * 3);
  float rotationAmount = map(sin(frameCount * 0.01), -1, 1, -TAU * 3, TAU * 3);
  float lineWidth = abs(rotationDiff * 1000) + 1;
  
  translate(width/2, height/2);
  rotate(rotationAmount);
  strokeWeight(lineWidth);
  stroke(#000000);
  line(leftLength, 0, rightLength, 0); 
}
