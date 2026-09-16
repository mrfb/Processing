Eye[] e;
boolean thresh = true;

void setup() {
  //size(999,666);
  fullScreen(1);
  ellipseMode(CENTER);
  
  // summon the eyes
  e = new Eye[(int)random(16, 24)];
  for(int i = 0; i < e.length; i++){
    e[i] = new Eye();
  }
  
}

void draw() {
  // paint it black
  background(0);
  // paint it eyes
  for(int i = 0; i < e.length; i++){
    e[i].draw();
  }
  
  // trim the excess
  if(thresh) filter(THRESHOLD);
}

void keyPressed(){
  if(key == ' '){
    thresh = !thresh;
  }
}
