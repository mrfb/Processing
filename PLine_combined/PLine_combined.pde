class PLine{
  PVector start, end;
  color ink;
  float lineWeight;
  
  PLine(float sX, float sY, float eX, float eY){
    start = new PVector(sX, sY);
    end = new PVector(eX, eY);
    
    ink = color(random(180), random(180), random(180));
    
    lineWeight = random(5, 10);
  }
  
  void update(){
    start.add(PVector.random2D());
    end.add(PVector.random2D());
    
    if(start.x < 0 || start.x > width){
      start.x = width/2;
    }
    if(start.y < 0 || start.y > height){
      start.x = height/2;
    }
    
    if(end.x < 0 || end.x > width){
      end.x = width/2;
    }
    if(end.y < 0 || end.y > height){
      end.x = height/2;
    }
  }
  
  void display(){
    stroke(ink);
    line(start.x, start.y, end.x, end.y);
  }

}
