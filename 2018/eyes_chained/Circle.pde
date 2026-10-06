class Circle {
  PVector pos, vel, acc;
  float r;
  color col;
  
  Circle (){
    r = random(width/20, width/10);
    pos = new PVector(width/2, height/2);
    col = color(0,0,1,.45);
    vel = new PVector(0,0);
    acc = PVector.random2D();
  }
  
  Circle(PVector p, float radius, color c){
    pos = p;
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    r = radius;
    col = c;
  }
  
  void draw(){    
    if(pos.x - r < 0 || pos.x + r > width) vel.x *= -1;
    if(pos.y - r < 0 || pos.y + r > height) vel.y *= -1;
    
    pos.add(vel);
    vel.add(acc);
    noStroke();
    fill(col);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
}
