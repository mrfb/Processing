float pressure = 0;
float pressureSpeed = 0.01;
float brushSize = 100;

void setup(){
  size(666,666);
  background(0, 100, 100);
  noStroke();
}

void draw(){
  if(mousePressed){
    pressure += pressureSpeed;
  } else {
    pressure -= pressureSpeed;
  }
  
  pressure = constrain(pressure, 0.0f, 1.0f);
  
  fill(pressure * 256);
  ellipse(mouseX, mouseY, brushSize * pressure, brushSize * pressure);
}