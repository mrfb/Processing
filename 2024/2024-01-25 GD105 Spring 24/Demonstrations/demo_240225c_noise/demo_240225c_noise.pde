PVector pos;
PVector pos2;
PVector pos3;

void setup(){
  size(1024, 1024);
  background(255);
  
  pos = new PVector(width * 0.25, height * 0.25);
  pos2 = new PVector(width * 0.25 - 50, height * 0.25);
  pos3 = new PVector(width * 0.25 + 50, height * 0.25);
  noSmooth();
}

void draw(){
  noStroke();
  fill(255, 3);
  rect(0, 0, width, height);
  
  stroke(0);
  strokeWeight(3);
  
  translate(pos.x, pos.y);
  float noiseScale = 0.005;
  float turniness = 2.2;
  float theta = noise(pos.x * noiseScale, pos.y * noiseScale, frameCount * noiseScale) * TAU * turniness;
  rotate(theta);
  line(0, 0, 50, 0);
  PVector velocity = PVector.fromAngle(theta);
  pos.add(velocity);
  
  resetMatrix();
  translate(pos2.x, pos2.y);
  turniness = 2.8;
  theta = noise(pos2.x * noiseScale, pos2.y * noiseScale, frameCount * noiseScale) * TAU * turniness;
  rotate(theta);
  line(0, 0, 30, 0);
  velocity = PVector.fromAngle(theta);
  pos2.add(velocity);
  
  resetMatrix();
  translate(pos3.x, pos3.y);
  turniness = 3.2;
  theta = noise(pos3.x * noiseScale, pos3.y * noiseScale, frameCount * noiseScale) * TAU * turniness;
  rotate(theta);
  line(0, 0, 10, 0);
  velocity = PVector.fromAngle(theta);
  pos3.add(velocity);
  
  pos.set(constrain(pos.x, 0, width), constrain(pos.y, 0, width));
  pos2.set(constrain(pos2.x, 0, width), constrain(pos2.y, 0, width));
  pos3.set(constrain(pos3.x, 0, width), constrain(pos3.y, 0, width));
}

void mouseClicked(){
  save("output/fr" + frameCount + ".png");
  println("saved as fr" + frameCount + ".png");
}
