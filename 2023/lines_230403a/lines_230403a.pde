float innerRadius = 75;
float outerRadius = 225;
int numLines = 48;
float animSpeed = 0.0075;

void setup(){
  noSmooth();
  size(512, 512);
  strokeWeight(3);
  frameRate(50);
  strokeCap(SQUARE);
}

void draw(){
  background(255);
  translate(width/2, height/2);
  
  noFill();
  circle(0, 0, innerRadius * 2);
  
  noStroke();
  fill(#11b3ff);
  circle(0, 0, innerRadius * 1.6);
  stroke(0);
  
  //circle(0, 0, outerRadius * 2);
  
  PVector inner = new PVector();
  PVector outer = new PVector();
  //stroke(#aa0000);
  for(int i = 0; i < numLines; i++){
    inner.x = cos((i / float(numLines) * TAU) + frameCount * animSpeed) * innerRadius;
    inner.y = sin((i / float(numLines) * TAU) + frameCount * animSpeed) * innerRadius;
    
    outer.x = cos((i / float(numLines) * TAU) - frameCount * animSpeed * 2) * outerRadius;
    outer.y = sin((i / float(numLines) * TAU) - frameCount * animSpeed * 3) * outerRadius;
    
    line(inner.x, inner.y, outer.x, outer.y);
    stroke(0);
  }
  
  
  if(frameCount * animSpeed < TAU){
    saveFrame("frames/####.png");
  }
}
