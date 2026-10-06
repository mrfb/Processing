void setup(){
  size(1024, 1024);
  strokeWeight(32);
  strokeCap(SQUARE);
}

void draw(){
  background(255);
  
  color crimson = color(#920b0b, 128);
  color marigold = color(#fee61d, 128);
  color sapphire = color(#1c2196, 128);
  color onyx = color(#565353, 128);
  
  // 1 + 2: declare and initialize
  int leftMargin = 64;
  int rightMargin = width - 64;
  int leftMarginStep = 32;
  int rightMarginStep = -32;
  int spaceBetweenLines = 207;
  float rotation = 0;
  float rotationStep = TAU * -0.023;
  
  //println("leftMargin: " + leftMargin);
  
  stroke(crimson);
  translate(0, spaceBetweenLines);
  rotate(rotation);
  line(leftMargin, 0, rightMargin, 0);
  leftMargin += leftMarginStep;
  rightMargin += rightMarginStep;
  rotation += rotationStep;
  
  stroke(marigold);
  translate(0, spaceBetweenLines);
  rotate(rotation);
  line(leftMargin, 0, rightMargin, 0);
  leftMargin += leftMarginStep;
  rightMargin += rightMarginStep;
  rotation += rotationStep;
  
  stroke(sapphire);
  translate(0, spaceBetweenLines);
  rotate(rotation);
  line(leftMargin, 0, rightMargin, 0);
  leftMargin += leftMarginStep;
  rightMargin += rightMarginStep;
  rotation += rotationStep;
  
  stroke(onyx);
  translate(0, spaceBetweenLines);
  rotate(rotation);
  line(leftMargin, 0, rightMargin, 0);
  leftMargin += leftMarginStep;
  rightMargin += rightMarginStep;
  rotation += rotationStep;
  
  stroke(sapphire);
  translate(0, spaceBetweenLines);
  rotate(rotation);
  line(leftMargin, 0, rightMargin, 0);
  leftMargin += leftMarginStep;
  rightMargin += rightMarginStep;
  rotation += rotationStep;
  
  stroke(marigold);
  translate(0, spaceBetweenLines);
  rotate(rotation);
  line(leftMargin, 0, rightMargin, 0);
  leftMargin += leftMarginStep;
  rightMargin += rightMarginStep;
  rotation += rotationStep;
  
  stroke(crimson);
  translate(0, spaceBetweenLines);
  rotate(rotation);
  line(leftMargin, 0, rightMargin, 0);
  leftMargin += leftMarginStep;
  rightMargin += rightMarginStep;
  rotation += rotationStep;
  
  if(frameCount == 1){
    String filename = "";
    filename += hex(crimson) + "_";
    filename += hex(marigold) + "_";
    filename += hex(sapphire) + "_";
    filename += hex(onyx);
    save(filename + ".png");
    println("saved as " + filename + ".png");
  }
  
}
