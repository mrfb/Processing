void setup() {
  size(1024, 1024);
  rectMode(CENTER);
}

void draw(){
  background(#FFBF00); // yellow background
  fill(255, 64);  // white, 64/255 opacity
  
  // move the origin point to the center
  translate(width/2, height/2);
  
  //this lets us see the center axis
  //for development purposes
  //stroke(0);
  //line(-9999, 0, 9999, 0);
  //line(0, -9999, 0, 9999);
  
  // we're labeling some values
  // so we can reuse them
  // we'll talk about these more later
  // please note: i picked these values by tweaking,
  // so they'll be weird numbers
  float shrinkAmount = 1.143;
  float spinAmount = TAU * 0.31;
  PVector translateAmount = new PVector(0, 0);
  PVector shapeAnchor = new PVector(width/4, 7);
  float shapeLength = 3000;
  
  // draw our first shape
  noStroke();
  rotate(TAU * -0.15);  // initial rotation
  rect(shapeAnchor.x, shapeAnchor.y, shapeLength, 50);
  
  // do the first transformation and draw the shape again
  rotate(spinAmount);
  scale(shrinkAmount);
  translate(translateAmount.x, translateAmount.y);
  rect(shapeAnchor.x, shapeAnchor.y, shapeLength, 50);
  
  // everything below was copy+pasted
  // once i was happy with the second shape
  rotate(spinAmount);
  scale(shrinkAmount);
  translate(translateAmount.x, translateAmount.y);
  rect(shapeAnchor.x, shapeAnchor.y, shapeLength, 50);
  
  rotate(spinAmount);
  scale(shrinkAmount);
  translate(translateAmount.x, translateAmount.y);
  rect(shapeAnchor.x, shapeAnchor.y, shapeLength, 50);
  
  rotate(spinAmount);
  scale(shrinkAmount);
  translate(translateAmount.x, translateAmount.y);
  rect(shapeAnchor.x, shapeAnchor.y, shapeLength, 50);
  
  rotate(spinAmount);
  scale(shrinkAmount);
  translate(translateAmount.x, translateAmount.y);
  rect(shapeAnchor.x, shapeAnchor.y, shapeLength, 50);
  
  rotate(spinAmount);
  scale(shrinkAmount);
  translate(translateAmount.x, translateAmount.y);
  rect(shapeAnchor.x, shapeAnchor.y, shapeLength, 50);
  
  rotate(spinAmount);
  scale(shrinkAmount);
  translate(translateAmount.x, translateAmount.y);
  rect(shapeAnchor.x, shapeAnchor.y, shapeLength, 50); 
  
  rotate(spinAmount);
  scale(shrinkAmount);
  translate(translateAmount.x, translateAmount.y);
  rect(shapeAnchor.x, shapeAnchor.y, shapeLength, 50); 
  
  rotate(spinAmount);
  scale(shrinkAmount);
  translate(translateAmount.x, translateAmount.y);
  rect(shapeAnchor.x, shapeAnchor.y, shapeLength, 50); 
  
  stroke(#484637); // dark brown for a little more warmth
  strokeWeight(30);
  
  // draw a smiley face on top
  resetMatrix();
  point(width * 0.45, height * 0.45);
  point(width * 0.55, height * 0.45);
  translate(width/2, height/2);
  rotate(TAU * 0.25);
  noFill();
  arc(0, 0, width * 0.15, height * 0.15, TAU * -0.10, TAU * 0.10);
  
  // save the canvas on the first frame
  if(frameCount == 1){
    String filename = "output";
    save(filename + ".png");
    println("canvas saved as " + filename + ".png");
  }
}
