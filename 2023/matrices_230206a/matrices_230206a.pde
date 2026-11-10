void setup() {
  size(1000, 1000);
  stroke(#FFFFFF);
  strokeWeight(5);
  strokeCap(SQUARE);
}

void draw() {
  background(#CE5370);
  
  // Step 1: set this to draw 73 lines,
  // (that's 36 pairs of white-black lines,
  // plus one white one at the end)
  
  stroke(#FFFFFF);
  line(320, 0, 320, 700);
  translate(5, 0);
  stroke(#000000);
  line(320, 0, 320, 700);
  
  // Step 2: draw just the black lines,
  // but slightly offset and rotated
  
  
}

void mouseClicked() {
  save("output.png");
  println(frameCount + ": saved as output.png");
}
