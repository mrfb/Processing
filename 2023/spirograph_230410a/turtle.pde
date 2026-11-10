class Turtle {
  // PROPERTIES
  color ink;    // line color
  float weight; // line weight
  PVector pos;  // where the turtle is
  PVector dir;  // direction/facing
  
  // CONSTRUCTORs
  Turtle(float x, float y){
    pos = new PVector(x, y);
    ink = color(0);
    dir = new PVector(1, 0);
  }
  
  Turtle(float x, float y, color c){
    pos = new PVector(x, y);
    ink = c;
    dir = new PVector(1, 0);
  }
  
  Turtle(float x, float y, color c, float rotation){
    pos = new PVector(x, y);
    ink = c;
    dir = PVector.fromAngle(rotation);
  }
  
  // METHODS
  void turn(float amount){
    dir.rotate(amount);
  }
  
  void forward(float amount){
    PVector start = pos.copy();
    pos.add(PVector.mult(dir, amount));
    PVector end = pos.copy();
    
    stroke(ink);
    strokeWeight(weight);
    line(start.x, start.y, end.x, end.y);
  }
  
  void display(){
    // draw where we currently are
    translate(pos.x, pos.y);
    rotate(dir.heading());
    fill(128);
    
    float wingspan = 20;
    quad(0, 0,
         - wingspan, - wingspan,
         + wingspan, 0,
         - wingspan, + wingspan);
  }     
}
