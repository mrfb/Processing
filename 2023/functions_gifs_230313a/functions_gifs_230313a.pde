float progress = 0;
float progressStep = 0.01;

void setup(){
  size(1000, 1000);
  rectMode(CENTER);
  frameRate(50); // optimal for animated GIFs
}

void draw(){
  background(#ef5f43);
  
  translate(500 + cos(-TAU*progress) * 50, 500);
  //rotate(TAU * progress);
  
  shapeSettings("SQUARE");
  // the transforms defined between push/pop matrix won't affect
  // other stuff afterward
  pushMatrix();
  translate(0 + cos(TAU*progress) * 50, 0 + sin(TAU*progress) * 50);
  noStroke();
  square(0, 0, 250);
  rotate(TAU/16);
  square(0, 0, 220);
  rotate(TAU/16);
  square(0, 0, 250);
  rotate(TAU/16);
  square(0, 0, 220);
  popMatrix();
  
  
  shapeSettings("CIRCLE");
  circle(-250, -250, 150);
  circle(-250, 250, 150);
  circle(250, -250, 50);
  
  shapeSettings("SQUARE");
  translate(250, 250);
  rotate(cos(TAU*progress) * TAU * 0.125 + TAU * 0.125);
  square(0, 0, 150);
  
  progress += progressStep;
  // progress = progress + progressStep;
  
  if(progress < 1){
    saveFrame("frames/####.png");
    println("saved frame: " + frameCount);
  }
}

void shapeSettings(color interior, color exterior, int weight){
  fill(interior);
  stroke(exterior);
  strokeWeight(weight);
}

void shapeSettings(String mode){
  // default style
  color interior = #FEFFF0;
  color exterior = #A8DCF5;
  int weight = 5;
  
  if(mode == "SQUARE"){
    // default interior
    exterior = #D2A8F5;
    weight = 10;
  } else if (mode == "CIRCLE"){
    interior = #edfbff;
    // default exterior
    // default weight
  } else {
    // default interior
    // default exterior
    // default weight
    println("ERROR: mode \"" + mode + "\" is undefined, using defaults");
  }
  
  fill(interior);
  stroke(exterior);
  strokeWeight(weight);
}
