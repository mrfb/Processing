int numEyes = 10;
Eye[] e = new Eye[numEyes];

boolean thresh = false;

void setup(){
  size(666,666);
  colorMode(HSB, 1.0);
  rectMode(CENTER);
  e[0] = new Eye(new PVector(width/2, height/2), 50);
  float circleRadius = 250;
  float diff = 1.0 / ((float)numEyes - 1.0);
  for(int i = 1; i < numEyes; i++){
    e[i] = new Eye(new PVector(width/2 + cos(TAU * diff * i) * circleRadius,
                               height/2 + sin(TAU * diff * i) * circleRadius), 50);
  }
}

void draw(){
  background(0);
  for(int i = 0; i < numEyes; i++){
    e[i].draw();
  }
  if(thresh) filter(THRESHOLD);
}

void keyPressed(){
  thresh = !thresh;
}
