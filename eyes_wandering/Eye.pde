void openEyes(){
  for(int i = 0; i < numCircles; i++){
    eyes[i] = new Eye(circles[i]);
  }
}

class Eye{
  Circle c1, c2, pupil;
  
  Eye(Circle c){
    PVector offset = PVector.random2D().mult(c.r * random(0,1));
    c1 = new Circle(offset.add(c.pos), c.r * random(0,1), color(0,0,1,.4));
    offset = PVector.random2D().mult(c.r * random(0,1));
    c2 = new Circle(offset.add(c.pos), c.r * random(0,1), color(0,0,1,.4));
    pupil = new Circle(c.pos, width / 100, color(0,0,0,1));
  }
  
  void draw(){
    c1.draw();
    c2.draw();
    pupil.draw();
  }
}
