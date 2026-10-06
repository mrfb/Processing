class Line {
  PVector start;
  PVector end;
  
  float strokeWeight;
  color stroke;
  
  boolean wandering;
  boolean erasing;
  
  Line(float x1, float y1, float x2, float y2){
    start = new PVector(x1, y1);
    end = new PVector(x2, y2);
    
    stroke = color(random(180, 255), random(180, 255), random(180, 255), random(10));
    strokeWeight = 1;
    
    wandering = random(1) < 0.5;
  }
  
  // includes various behaviors like moving
  // and changing colors to white or back
  void update(){
    if(wandering){
      end.add(PVector.random2D());
    }
    
    if(random(1) < 0.1){
      wandering = !wandering;
    }
    
    if(random(1) < 0.001){
      erasing = !erasing;
    }
  }
  
  void display(){
    strokeWeight(strokeWeight);
    stroke(erasing?255:stroke); // ternary operator!
    line(start.x, start.y, end.x, end.y);
  }
}
