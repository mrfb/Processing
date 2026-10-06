size(1000, 1000);
background(255);

// draw 12 pairs of lines:
// the first part is a bold black line above the threshold
// the second part is a thin black line below
// we'll use some simple linear algebra to make this easier
// and a loop because i super don't want to the math by hand

// output is randomized, so it comes out different every time

PVector thresholdStart = new PVector(width*0.25, height *0.20);
PVector thresholdEnd = new PVector(width*0.75, height*0.80);

int numLines = 12;
for(int i = 1; i <= numLines; i++){
  PVector slope = new PVector(random(0.5, 0.9), random(-0.5, -1.5));
  PVector center = PVector.lerp(thresholdStart, thresholdEnd, i/float(numLines+1));
  
  float upperDistance = random(30, 200);
  PVector lineUpper = PVector.add(center, PVector.mult(slope, upperDistance));
  
  float lowerDistance = -random(100, 400);
  PVector lineLower = PVector.add(center, PVector.mult(slope, lowerDistance));
  
  stroke(#000000);
  strokeWeight(10);
  strokeCap(SQUARE);
  line(lineUpper.x, lineUpper.y, center.x, center.y);
  
  // lines become thin as they cross the red line
  strokeWeight(3);
  line(lineLower.x, lineLower.y, center.x, center.y);
}

// draw a thick red line down the middle, but a little askew
stroke(#ff0000);
strokeWeight(15);
strokeCap(ROUND);
line(thresholdStart.x, thresholdStart.y, thresholdEnd.x, thresholdEnd.y);

save("output.png");
