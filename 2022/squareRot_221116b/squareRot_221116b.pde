color bg = #F5CC36; // yellow
color circleStroke = #082343;
color squareStroke = #F536AF;

float gridDivisions = 8;
float size = 64;

// used for animating
float flux = 0;
float fluxStep = 0.01;

void setup(){
  noiseSeed(20221116);
  size(1024, 1024);
  noFill();
  strokeWeight(size/8);
  rectMode(CENTER);
}

void draw(){
  background(bg);
  PVector noiseSample = new PVector();
  float noiseSampleRadius = 64;
  float noiseScale = .001;
  float offset = 0;
  
  // do one row at a time
  for(int y = 1; y <= gridDivisions; y++){
    
    // within each row, do each item in the column
    for(int x = 1; x <= gridDivisions; x++){
      resetMatrix();
      translate(width * (x/(gridDivisions+1)),
                height * (y/(gridDivisions+1)));
      noiseSample.x = width  * (x/(gridDivisions+1)) + cos(flux * TAU)*noiseSampleRadius;
      noiseSample.y = height * (y/(gridDivisions+1)) + sin(flux * TAU)*noiseSampleRadius;
      offset = noise(width * (x/(gridDivisions+1) * noiseScale),
                     height * (y/(gridDivisions+1)) * noiseScale);
      offset *= TAU;
      noiseSample.mult(noiseScale);
      
      float noiseRot = noise(noiseSample.x, noiseSample.y);
      //float wobble = sin(flux * TAU) * min(x, y);
      stroke(circleStroke);
      circle(0, 0, size * 0.5);
      noiseRot *= TAU * 2;
      noiseRot -= TAU;
      rotate(noiseRot + offset);
      stroke(squareStroke);
      square(0, 0, size);
    }
  }
  
  flux += fluxStep;
  if(flux < 1){
    saveFrame("frames/####.png");
  }
}
