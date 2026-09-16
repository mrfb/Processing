//import PLine.*;

PLine[] lines;

void setup(){
  size(800, 800);
  
  lines = new PLine[5];
  
  for(int i = 0; i < lines.length; i++){
    lines[i] = new PLine(width/2.0, height/2.0, width/2.0, height/2.0);
  }
  
}

void draw(){
  
}
