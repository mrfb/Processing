// Matthew R.F. Balousek 2026-10-13
// Simple dynamic sketch that saves out the frames as it proceeds.

void setup(){
  // The setup block runs once at the start of the program.
  size(1000,1000);
  strokeWeight(20);
  strokeCap(SQUARE);
}

void draw(){
  // The draw block runs once per frame.
  
  background(#FFFFFF);
  
  // Display frame number for later flipbook assembly
  textSize(128);
  fill(#000000);
  text(frameCount, 50, height-50);
  
  // The base gets shorter, while the blades get longer.
  // note which terms are changing here
  // anything with frameCount in it will change over time
  
  // base
  translate(width * .5, height * .5);
  line(0, 0, 0, height * 0.4 - frameCount * 16 - 16);
  
  // blades
  rotate(TAU / 8);
  line(width * -.1 - frameCount * 4, 0, width * .1 + frameCount * 4, 0);
  line(0, height * -.1 - frameCount * 4, 0, height * .1 + frameCount * 4);
  
  // We only want to save enough frames to make our flipbook.
  // This if-else statement is something we'll talk about more later.
  // This makes the program stop after we've generated our frames.
  if(frameCount < 25){
    saveFrame("frames/output_####.png");
  } else {
    noLoop();
  }
}
