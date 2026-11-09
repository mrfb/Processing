color circleFill = #ffffff;
int circleSize = 50;

void setup(){
  size(1000, 1000);
  background(#FFFFFF);
  noStroke();
  //frameRate(10);
}

void draw(){
  //background(#FFFFFF);
  
  stroke(#000000);
  line(pmouseX, pmouseY, mouseX, mouseY);
  
  if(keyPressed){
    if(key == 'w' || key == 'W'){
      circleSize++;
    } else if(key == 's' || key == 'S'){
      circleSize--;
    }
    println("circleSize: " + circleSize);
  }
  
  if(frameCount % 20 == 0){
    noStroke();
    fill(circleFill, 200);
    circle(mouseX, mouseY, circleSize);
  }
}
