// Check collisions for rectangles;

PVector staticRect, mouseRect;
int staticWidth = 64;
int staticHeight = 128;
int mouseWidth = 32;
int mouseHeight = mouseWidth;

void setup(){
  size(1024, 1024);
  
  // just 'cuz
  noSmooth();
  noFill();
  
  // initialization
  staticRect = new PVector(width/2, height/2);
  mouseRect = new PVector(0, 0);
}

void draw(){ 
  // leave trails instead of drawing the background outright
  background(#ffffff);
  
  mouseRect.set(mouseX, mouseY);
  
  // we don't normally need all these variables, this is just for clarity
  float mouseLeft = mouseRect.x;
  float mouseRight = mouseRect.x + mouseWidth;
  float mouseTop = mouseRect.y;
  float mouseBottom = mouseRect.y + mouseHeight;
  
  float staticLeft = staticRect.x;
  float staticRight = staticRect.x + staticWidth;
  float staticTop = staticRect.y;
  float staticBottom = staticRect.y + staticHeight;
  
  boolean gapExists = mouseRight < staticLeft
                      || mouseLeft > staticRight
                      || mouseBottom < staticTop
                      || mouseTop > staticBottom;
  
  if(!gapExists){
    // the point/rectangle is inside the rectangle!
    fill(#aa0000, 128);
    println("ahhhh!");
  } else {
    // the point/rectangle is not inside the rectangle!
    fill(#00aa00, 128);
  }
  
  // draw the two rectangles
  rect(staticRect.x, staticRect.y, staticWidth, staticHeight);
  rect(mouseRect.x, mouseRect.y, mouseWidth, mouseHeight);
}
