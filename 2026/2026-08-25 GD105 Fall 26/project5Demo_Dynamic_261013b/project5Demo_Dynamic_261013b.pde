// Matthew R.F. Balousek 2026-10-13
// Simple dynamic sketch that saves out all its frames.

void setup(){
  // Setup runs once at the start
  size(1000,1000);
  strokeWeight(20);
  strokeCap(SQUARE);
  //frameRate(1); // to slow down the program for examination
}

void draw(){
  // Draw runs once per frame.
  background(#FFFFFF);
  
  // Print frame # in lower left corner. Loops with modulo (%)
  fill(#000000);
  textSize(128);
  text(frameCount % 24, 50, height - 50);
  
  // Add a gentle sway to the pinwheel.
  
  float offset = sin(TAU / 24 * frameCount) * width * .02;
  
  // Pinwheel base stays still.
  stroke(#000000);
  line(width * .5 + offset, height * .5, width * .5, height * 0.9);
  
  // Pinwheel blades spin.
  translate(width * .5 + offset, height * .5);
  rotate((TAU / 24) * frameCount);
  stroke(#aa0000);
  line(width * -.1, height * -.1, width * .1, height * .1);
  stroke(#0000aa);
  line(width * .1, height * -.1, width * -.1, height * .1);
  
  // Mask bottom of the pinwheel with a white square
  // to keep the bottom "flat"
  resetMatrix();
  noStroke();
  fill(#ffffff);
  square(width * .48, height * .89, width * .04);
  
  // save the first 24 frames; frames after should be identical
  if(frameCount < 25){
    println(frameCount);
    saveFrame("frames/output_####.png");
  }
}
