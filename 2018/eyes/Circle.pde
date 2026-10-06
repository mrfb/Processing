class Circle {
  PVector pos;
  float size;
  color col;
  
  Circle (PVector p, float s, color c){
    pos = p;
    size = s;
    col = c;
  }
  
  Circle (float x, float y, float s, color c){
    pos = new PVector(x, y);
    size = s;
    col = c;
  }
  
  void draw(){
    noStroke();
    fill(col);
    ellipse(pos.x, pos.y, size, size);
  }
}
