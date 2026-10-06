float flux = 0;
float fluxStep = 0.01;
boolean output = true;

PVector body;
PVector wingLeftMid = new PVector();
PVector wingRightMid = new PVector();
PVector wingLeftTip = new PVector();
PVector wingRightTip = new PVector();

void setup(){
  size(1024, 1024);
  body = new PVector(width*.25, height * .4);
}

void draw(){
  background(#1DA1F2);
  
  strokeWeight(2);
  circle(32, height-32, 24);
  translate(32, height-32);
  rotate(flux * TAU);
  fill(255);
  circle(12, 0, 8);
  noFill();
  resetMatrix();
  
  bird(width*.2,  height*.3,  100, 30, TAU*.20, TAU*.25);
  bird(width*.3,  height*.4,   25, 10, TAU*.50, TAU*.10);
  bird(width*.35, height*.55,  85, 50, TAU*.80, TAU*.15);
  
  bird(width*.6,  height*.15,  20, 20,  TAU*.30, TAU*.10);
  bird(width*.8,  height*.2,   55, 30,  TAU*.70, TAU*.10);
  bird(width*.9,  height*.3,   50, 20,  TAU*.90, TAU*.15);
  
  flux += fluxStep;
  
  if(output && flux < 1){
    saveFrame("frames/####.png");
  } 
}

void bird (float locX, float locY, float wingWidth, float wingHeight, float timeBase, float timeOffset){
  body.x = locX;
  body.y = locY;
  
  wingLeftTip.x = body.x - wingWidth;
  wingLeftTip.y = body.y - wingHeight * sin(flux * TAU + timeBase);
  wingLeftMid.x = body.x - wingWidth * .4;
  wingLeftMid.y = body.y - wingHeight * sin(flux * TAU + timeBase + timeOffset) * .5;
  
  wingRightTip.x = body.x + wingWidth;
  wingRightTip.y = body.y - wingHeight * sin(flux * TAU + timeBase);
  wingRightMid.x = body.x + wingWidth * .4;
  wingRightMid.y = body.y - wingHeight * sin(flux * TAU + timeBase + timeOffset) * .5;
  
  stroke(255);
  noFill();
  strokeWeight(wingWidth / 10.0);
  bezier(body.x, body.y, wingLeftMid.x, wingLeftMid.y,
         wingLeftMid.x, wingLeftMid.y, wingLeftTip.x, wingLeftTip.y);
  bezier(body.x, body.y, wingRightMid.x, wingRightMid.y,
         wingRightMid.x, wingRightMid.y, wingRightTip.x, wingRightTip.y);
}
