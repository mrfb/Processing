float drawHeight;
float frameDamp = 1;
int frameLimit = 1000;

PVector drawHead, pdrawHead;

void setup(){
  size(500, 500);
  background(#ffffff);
  noStroke();
  drawHeight = width * .25;
  drawHead = new PVector();
  pdrawHead = new PVector();
}

void draw(){
  float progress = frameCount * 1.0 / frameLimit;
  float theta = progress * TAU;
  
  strokeWeight(2);
  stroke(50);
  
  pdrawHead.set(drawHead);
  
  drawHead.x = cos(theta * 100 * frameDamp) * drawHeight;
  drawHead.y = sin(theta * 13 * frameDamp) * drawHeight;
  if(frameCount == 1) pdrawHead.set(drawHead);
  translate(width/2, height/2);
  rotate(theta);
  line(pdrawHead.x, pdrawHead.y, drawHead.x, drawHead.y);
  if(progress > 1.0){
    noLoop();
    println("all done!");
  }
}
