Palette p;

void setup(){
  size(2048,2048); // for twitter
  //size(800,800); // for testing
  colorMode(HSB, 1.0);
  background(1);  // gesso
  noStroke();
  noSmooth();
  
  int paletteSize = int(random(8))+2;
  Palette tempA = new Palette (int(random(paletteSize - 2))+1);  // save at least two for the other subpalette
  Palette tempB = new Palette (paletteSize - tempA.c.length);
  p = new Palette(tempA, tempB);
  
  rectMode(CORNERS);
  color c = p.getColor();
  fill(c);
  rect(0,0,width,height);
  //background(c);
  
  switch((int)random(0,4)){  // => {0, 3}
    case 0:
      bands();
      break;
    case 1:
      albers2();
      break;
    default:
      albers();
      break;
  }
  
  saveAndQuit();
}

void bands(){
  float left, right, top, bottom, gap;
  
  switch((int)random(0, 5)){
    case 0:  // vertical bars
      left = 1.0;
      right = 0;
      top = 0;
      bottom = 0;
      break;
    case 1:  // chevrons
      left = 1.0;
      right = 0;
      top = 1.0;
      bottom = 0;
      break;
    case 2:  // obelisk
      left = 0.5;
      right = 0.5;
      top = 0.5;
      bottom = 0;
      break;
    case 3:  // square
      left = 0.5;
      right = 0.5;
      top = 0.5;
      bottom = 0.5;
      break;
    default:  // horizontal bars
      left = 0;
      right = 0;
      top = 1.0;
      bottom = 0;
      break;
  }
  
  int numBands = (int)random(2, 9);
  println("numBands: " + numBands);
  for(int i = 1; i < numBands; i++){
    
    fill(0, 0, 1);
    rect(width*(i*left / numBands), height*(i*top / numBands),
         width*(1.0-(i*right / numBands)), height*(1.0-(i*bottom / numBands)));
    setFill();
    rect(width*(i*left / numBands), height*(i*top / numBands),
         width*(1.0-(i*right / numBands)), height*(1.0-(i*bottom / numBands)));
  }
  
}

void albers(){
  // in the style of Josef Albers
  float top = 0;
  float bottom = height;
  float left = 0;
  float right = width;
  
  float topDiminish = .15;
  float bottomDiminish = .05;
  float sideDiminish = .10;
  
  int numSquares = (int)random(3,5);  // => {3, 4}
  println("numSquares: " + numSquares);
  for(int i = 1; i < numSquares; i++){
    top += height * topDiminish;
    bottom -= height * bottomDiminish;
    left += width * sideDiminish;
    right -= width * sideDiminish;
    
    fill(0, 0, 1);
    rect(left, top, right, bottom);
    setFill();
    rect(left, top, right, bottom);
  }
}

// 2x2 colors, with an optional interior 2x2 from a second palette
void albers2(){
  Palette exterior = new Palette(4);
  Palette interior = new Palette(4);
  
  fill(exterior.getColor());
  rect(width * 0.0, height * 0.0, width * 0.5, height * 0.5);
  fill(exterior.getColor());
  rect(width * 0.5, height * 0.0, width * 1.0, height * 0.5);
  fill(exterior.getColor());
  rect(width * 0.0, height * 0.5, width * 0.0, height * 1.0);
  fill(exterior.getColor());
  rect(width * 0.5, height * 0.5, width * 1.0, height * 1.0);
  
  if(random(1) < .5){
    fill(1, 0, 0, 1);
    rect(width * .25, height * .25, width * .75, height * .75);
    
    fill(interior.getColor());
    rect(width * 0.25, height * 0.25, width * 0.5, height * 0.5);
    fill(interior.getColor());
    rect(width * 0.5, height * 0.25, width * 0.75, height * 0.5);
    fill(interior.getColor());
    rect(width * 0.25, height * 0.5, width * 0.50, height * 0.75);
    fill(interior.getColor());
    rect(width * 0.5, height * 0.5, width * .75, height * 0.75);
  }
  
  p = new Palette(exterior, interior);
}

void setFill(){
  // get a color from the palette, save it to the fill, save it to the filename
  color c = p.getColor();
  fill(c);
}
