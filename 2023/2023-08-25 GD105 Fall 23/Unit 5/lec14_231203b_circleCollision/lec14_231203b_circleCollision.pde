// Check collisions for circles;

PVector staticCircle, mouseCircle;
int staticRadius = 64;
int mouseRadius = 32;

void setup(){
  size(1024, 1024);
  
  // just 'cuz
  noSmooth();
  noFill();
  
  // initialization
  staticCircle = new PVector(width/2, height/2);
  mouseCircle = new PVector(0, 0);
}

void draw(){ 
  // leave trails instead of drawing the background outright
  background(#ffffff);
  
  mouseCircle.set(mouseX, mouseY);
  
  if(staticCircle.dist(mouseCircle) < staticRadius + mouseRadius){
    // the point is inside the circle!
    fill(#aa0000, 128);
    println("ahhhh!");
  } else {
    // the point is not inside the circle!
    fill(#00aa00, 128);
  }
  
  // draw the two circles
  circle(staticCircle.x, staticCircle.y, staticRadius * 2);
  circle(mouseCircle.x, mouseCircle.y, mouseRadius * 2);
  
  // labels
  fill(#000000);
  line(staticCircle.x, staticCircle.y, mouseCircle.x, mouseCircle.y);
  text("staticRadius: " + staticRadius, staticCircle.x + staticRadius + 5, staticCircle.y);
  text("mouseRadius: " + mouseRadius, mouseCircle.x + mouseRadius + 5, mouseCircle.y);
  PVector midpoint = PVector.lerp(staticCircle, mouseCircle, 0.5);
  text("dist(static, mouse): " + staticCircle.dist(mouseCircle), midpoint.x + 5, midpoint.y);
}
