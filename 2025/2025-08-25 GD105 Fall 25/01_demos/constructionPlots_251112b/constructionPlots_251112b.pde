import processing.svg.*;

void setup(){
  size(800, 800);
  frameRate(5);
}

void draw(){
  background(255);
  
  if(frameCount == 1){
    beginRecord(SVG, "plot.svg");
  }
  
  line(width * 0.50, height * 0.00,
       width * 0.50, height * 1.00);
       
  PVector anchor = new PVector();
  int lineRadius = 20;
  int margin = 25;
  // fill in left half of the canvas
  // make sure we don't cross the half line
  for(int i = 0; i < 12; i++){
    anchor.set(random(lineRadius + margin, width * 0.50 - lineRadius - margin),
               random(lineRadius, height - lineRadius));
    line(anchor.x - lineRadius, anchor.y + lineRadius,
         anchor.x + lineRadius, anchor.y - lineRadius);
  }
  
  // fill in right half of the canvas
  for(int i = 0; i < 12; i++){
    anchor.set(random(width * 0.50 + lineRadius + margin, width - lineRadius - margin),
               random(lineRadius, height - lineRadius));
    line(anchor.x - lineRadius, anchor.y + lineRadius,
         anchor.x + lineRadius, anchor.y - lineRadius);
  }
  
  if(frameCount == 1){
    endRecord();
    save("output.png");
  }
  
  //noLoop();
  
}
