class Eye{
  PVector pos;
  float radius;
  float yOff;
  float xOff;
  Circle top, bottom, pupil;
  
  Eye(PVector p, float s){
    pos = p;
    xOff = random(-1, 1) * s;
    yOff = random(-1, 1) * s;
    top = new Circle(p.x + xOff / 2, p.y + yOff / 2, 100, color(0, 0, 1, 0.45));
    bottom = new Circle(p.x - xOff / 2, p.y - yOff / 2, 100, color(0, 0, 1, 0.45));
    PVector pupilPos = new PVector(p.x + random(-xOff, xOff), p.y + random(-yOff, yOff));
    pupil = new Circle(pupilPos, 20, color(0,0,0,1));
  }
  
  void draw(){
    top.draw();
    bottom.draw();
    pupil.draw();
    fill(0,0,0,0);
    stroke(1);
    rect(pos.x, pos.y, 2*xOff, 2*yOff);
    point(pupil.pos.x, pupil.pos.y);
  }
  
}
