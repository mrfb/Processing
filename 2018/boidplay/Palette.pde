void drawPalette(Palette p, PVector pos, int size){
  stroke(1);
  for(int i = 0; i < p.c.length; i++){
    fill(p.c[i]);
    rect(pos.x + (size + 2) * 2 * i, pos.y, size, size);
  }
  noStroke();
}

class Palette{
  int numColors;
  color[] c;
  
  color getColor(){
    // Pick two colors in the palette...
    int from, to;
    do{
      from = int(random(numColors));
      to = int(random(numColors));
    }while(from == to);
    
    // ...randomly lerp between them...
    float lerp = random(1);
    color col = lerpColor(c[from], c[to], lerp);
    
    // ...and return the result.
    return col;
  }
  
  // merge constructor
  Palette(Palette a, Palette b){
    numColors = a.c.length + b.c.length;
    c = new color[numColors];
    
    int i = 0;
    for( ; i < a.c.length ; i++){
      c[i] = a.c[i];
    }
    
    for( ; i < numColors; i++){
      c[i] = b.c[i - a.c.length];
    }
  }
  
  Palette(int nColors){
    numColors = nColors;
    c = new color[numColors];
    
    // pick a palette
    String[] palettes = {"vivid", "pale", "wild"};
    String palette = pick(palettes);
    
    // The first color is always a wildcard.
    c[0] = color(random(1), random(1), random(1));
    
    // Pick random ranges for HSB values.
    // For hue, pick a random point on the color wheel and then get a random
    // arc length extending away.
    float hMean = random(TAU);
    float hArc = pow(random(1), 3) * 0.8 * PI;  // maybe constrain range here
    float hMin = hMean - hArc;
    float hMax = hMean + hArc;
    
    float sMin = random(1);
    float sRange = random(1 - sMin);
    if(palette != "vivid") {
      sRange *= 0.8;
    }
    if(palette == "pale"){
      sMin *= sMin; // lower minimum when the palette is pale
      sRange *= sRange;
    } else if (palette == "vivid"){
      sMin = sqrt(sMin); // raise minimum when vivid
      sRange = random(1 - sMin); // need to reroll the range with the higher min
    }
    
    float bMin = random(0.3, 1.0);
    float bRange = random(1 - bMin);
    
    float aMin = random(1);
    float aRange = pow(random(1 - aMin), 2);

    // Now, pick n-1 colors in those ranges.
    for(int i = 1; i < numColors; i++){
      float rHue = random(hMin, hMax);
      rHue %= TAU; // [-0.5 PI, 1.5 PI] => [0, TAU]
      rHue /= TAU; // [0, TAU] => [0, 1]
      
      c[i] = color(rHue,
                   sMin + random(sRange),
                   bMin + random(bRange),
                   aMin + random(aRange));
    }
  }
}
