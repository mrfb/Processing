int numBirds = 3;
Bird[] birds;

boolean recording = false;

float margin, leftEdge, rightEdge, topEdge, bottomEdge;

String timestamp;

void setup(){
  //frameRate(5);
  size(1000, 1000);
  
  timestamp = "" + year() + "-" + month() + "-" + day();
  timestamp += "_" + hour() + "-" + minute() + "-" + second();
  
  margin = width * .05;
  leftEdge = 0 + margin;
  rightEdge = width - margin;
  topEdge = 0 + margin;
  bottomEdge = height - margin;
  
  birds = new Bird[numBirds];
  
  for(int i = 0; i < birds.length; i++){
    float angle = i * TAU / birds.length;
    float radius = width * 0.4;
    float originX = width * .5;
    float originY = height * .5;
    float posX = cos(angle) * radius + originX;
    float posY = sin(angle) * radius + originY;
    birds[i] = new Bird(posX, posY, TAU/100, angle + TAU*0.66);
  }
  
  noStroke();
  background(#ffffff);
}

void draw(){
  //background(255);
  
  for(Bird b : birds){
    b.display();
  }
  
  for(Bird b : birds){
    b.update();
    //b.destroy();
  }
  
  if(recording){
    saveFrame("frames/####.png");
  }
}

void mouseClicked(){
  screenshot();
}

void keyPressed(){
  recording = !recording;
  println("recording: " + recording);
}

void screenshot(){
  String name = timestamp + "_fr" + frameCount + ".png";
  save("stills/" + timestamp + "/" + name);
  println("saved " + name);
}
