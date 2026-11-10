float flux = 0;
boolean output = false;

void setup() {
  size(1024, 1024);
  noFill();
  strokeWeight(8);
  // for technical reasons, 50fps
  // is generally the target for a looping gif
  frameRate(50);
}

void draw() {
  // writing our colors like this enables us to use tweak mode on them
  color paper = color(184, 82, 137);
  color ink = color(244, 220, 198);
  
  // 8 frames
  float fluxStep = 1.0/100.0;
  
  background(paper);
  
  PVector anchorA = new PVector(width * .75, height * .25);
  PVector anchorB = new PVector(width * .25, height * .75);
  PVector center = new PVector(width/2, height/2);

  // show the orbit circle
  
  float diameter = 768;
  strokeWeight(1);
  stroke(255);
  circle(center.x, center.y, diameter);

  int numLines = 15;
  for (int i = 0; i < numLines; i++) {
    float start = TAU / float(numLines) * i;
    float end = TAU / float(numLines) * (i + 1);
    float offset = lerp(start, end, flux);
    
    // orbit moves around in a circle around the center
    PVector orbitA = new PVector(cos(offset),
                                sin(offset));
    float distance  = 0.66;
                                
    PVector orbitB = new PVector(cos(-offset), sin(-offset));              
    //orbitB.x = orbitA.y;
    //orbitB.y = orbitA.x;
    // we can scale these independently for some fun shapes
    orbitA.mult(diameter / 2);
    orbitB.mult(diameter / -1);
    
    // reversed x/y on controlB
    PVector controlA = new PVector(orbitA.x + center.x, orbitA.y + center.y);
    PVector controlB = new PVector(orbitB.x + center.x, orbitB.y + center.y);
    
    // to visualize control lines
    strokeWeight(1);
    stroke(0);
    line(anchorA.x, anchorA.y, controlA.x, controlA.y);
    line(controlB.x, controlB.y, anchorB.x, anchorB.y);
    
    
    stroke(ink);
    strokeWeight(8);
    bezier(anchorA.x, anchorA.y, controlA.x, controlA.y,
           controlB.x, controlB.y, anchorB.x, anchorB.y);
  }
  
  if(flux < 1 && output){
    saveFrame("frames/####.png");
  }
  flux += fluxStep;
  if(flux >= 1){
    println(frameCount + ": cycle done");
    output = false;
  }
  flux %= 1;
  
}
