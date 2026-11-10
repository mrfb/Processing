Particle[] birds = new Particle[100];

void setup(){
  size(1000, 1000);
  
  background(#ffffff);
  stroke(0, 50);
  rectMode(CENTER);
  noiseDetail(8, 0.5);
  
  for(int i = 0; i < 100; i++){
    birds[i] = new Particle(random(width), random(height));
  }
}

void draw(){
  //background(#ffffff);
  
  for(int i = 0; i < 100; i++){
    birds[i].update();
  }
}

void mouseClicked(){
  String filename = "particleClass/" + frameCount + ".png";
  save(filename);
  println("saved as " + filename);
}
