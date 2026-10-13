// Matthew R.F. Balousek 2026-10-13
// Static sketch base to try to animate...

void setup(){
  // this code runs once at the start of the program
  size(1000,1000);
  strokeWeight(20);
  strokeCap(SQUARE);
  //frameRate(1);
}

void draw(){
  background(#FFFFFF);
  fill(#000000);
  textSize(128);
  text(frameCount % 24, 50, height - 50);
  
  // this code runs once per frame
  // base
  stroke(#000000);
  line(width * .5, height * .5, width * .5, height * 0.9);
  
  // blades
  translate(width * .5, height * .5);
  rotate((TAU / 24) * frameCount);
  stroke(#aa0000);
  line(width * -.1, height * -.1, width * .1, height * .1);
  stroke(#0000aa);
  line(width * .1, height * -.1, width * -.1, height * .1);
  
  if(frameCount < 25){
    println(frameCount);
    saveFrame("frames/output_####.png");
  }
}
