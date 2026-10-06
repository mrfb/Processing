int numEyes;
Eye[] eyes;
boolean thresh = false;

void setParameters(){
  numEyes = 4;
}

void setup(){
  size(666,666);
  colorMode(HSB, 1.0);
  textAlign(CENTER);
  ellipseMode(CENTER);
  background(0);
  setParameters();
  
  eyes = new Eye[numEyes];
  for(int i = 0; i < numEyes; i++){
    eyes[i] = new Eye();
  }
}

void draw(){
  background(0);
  for(int i = 0; i < numEyes; i++){
    eyes[i].draw();
  }
  
  if(thresh) filter(THRESHOLD);
}

void keyPressed(){
  if(key == ' '){
    thresh = !thresh;
  }
}
