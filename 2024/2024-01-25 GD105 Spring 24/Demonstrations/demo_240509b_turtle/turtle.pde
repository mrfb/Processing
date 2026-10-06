class Turtle {
  PVector position;
  float heading;
  color ink;
  float lineWeight;
  
  Turtle(float x, float y){
    position = new PVector(x, y);
    heading = 0;
    ink = color(0);
    lineWeight = 2;
    strokeWeight(lineWeight);
  }
  
  void turn(float amount){
    heading += amount;
  }
  
  void walk(float amount){
    PVector old = position.copy();
    position.add( PVector.fromAngle(heading).mult(amount) );
    stroke(ink);
    line(old.x, old.y, position.x, position.y);
  }
  
  
  
}
