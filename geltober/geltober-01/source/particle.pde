// an individual particle

class Particle {
  PVector loc;
  PVector ploc;
  PVector vel;
  
  float weight;
  color col;
  
  float speed;
  float offset;
  
  float vMin, vMax;
  
  boolean dead = false;
  
  Particle(float x, float y, float dir){
    offset = dir;
    vMin = dir - TAU*.25;
    vMax = dir + TAU*.25;
    
    loc = new PVector(x,y);
    ploc = new PVector(x,y);
    vel = new PVector(0,0);
    weight = lineWidth;
    col = p.getColor(-1);
    
    speed = lineWidth * 0.5;
  }
  
  void update(){
    ploc.x = loc.x;
    ploc.y = loc.y;
    
    float dir = noise(loc.x * 0.001, loc.y * 0.001);
    dir = map(dir, 0, 1, vMin, vMax) - TAU*.25;
    vel = PVector.fromAngle(dir).mult(speed);
    
    loc.x += vel.x;
    loc.y += vel.y;
    
    if(loc.x < 0 || loc.x >= width || loc.y < 0 || loc.y >= height){
      dead = true;
      return;
    }
  }
  
  void render(){
    if(loc.x < width*.1 || loc.x > width*.9 || loc.y < height*.1 || loc.y > height*.9 || dead){
      return;
    }
    stroke(col);
    strokeWeight(weight);
    line(ploc.x, ploc.y, loc.x, loc.y);
  }
}
