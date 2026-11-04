color pickColor(){
  int rHue;
  float rSat, rBrightness;
  
  rHue = int(random(175, 265));
  rSat = random(0.75, 1.00);
  rBrightness = random(0.75, 1.00);
  
  colorMode(HSB, 360, 1, 1);
  
  return color(rHue, rSat, rBrightness);
}

color pickColor(int hBase, int hJitter){
  if(random(1) < 0.01){
    return #000000;
  }
  
  int rHue;
  float rSat, rBrightness;
  
  rHue = int(random(hBase - hJitter, hBase + hJitter));
  rHue %= 360;
  rSat = random(0.85, 1.00);
  rBrightness = random(0.75, 1.00);
  
  colorMode(HSB, 360, 1, 1);
  
  return color(rHue, rSat, rBrightness);
}
