import processing.svg.*;

void setup(){
  size(800, 800);
}

void draw(){
  background(255);
  
  if(frameCount == 1){
    beginRecord(SVG, "plot.svg");
  }
  
  for(int i = 5; i <= 42; i++){
    int gap = 17;
    line(width - gap * i, height * 0.66,
         width - gap * i, height * 0.88);
  }
  
  if(frameCount == 1){
    endRecord();
    save("output.png");
  }
  
}
