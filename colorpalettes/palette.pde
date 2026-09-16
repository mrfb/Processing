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
  
  Palette(int nColors){
    numColors = nColors;
    c = new color[numColors];
    
    // The first color is always a wildcard.
    c[0] = color(random(1), random(1), random(1));
    
    // Pick random ranges for HSB values.
    float hMin = random(1);
    float hRange = random(1 - hMin);
    float sMin = random(1);
    float sRange = random(1 - sMin);
    float bMin = random(1);
    float bRange = random(1 - bMin);

    // Now, pick n-1 colors in those ranges.
    for(int i = 1; i < numColors; i++){
      c[i] = color(hMin + random(hRange),
                   sMin + random(sRange),
                   bMin + random(bRange));
    }
  }
}