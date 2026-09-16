class Circle {
  PVector pos, vel, acc;
  float r;
  color col;
  float wander = 0;
  
  Circle(PVector p, float radius){
    pos = p;
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    r = radius;
    col = color(255,126);
  }
  
  void update(){    
    if(pos.x < 0) acc.x = 1;
    if(pos.x > width) acc.x = -1;
    if(pos.y < 0) acc.y = 1;
    if(pos.y > height) acc.y = -1;
    
    pos.add(vel);
    vel.add(acc);
    // damp vel/acc
    vel.mult(0.9);
    acc.mult(0.7);
  }
}
